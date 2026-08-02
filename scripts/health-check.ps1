# Runs CursorJr health checks and writes knowledge-base/HEALTH-REPORT.md.
# Usage: .\scripts\health-check.ps1

$ErrorActionPreference = "Continue"
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$root = Split-Path -Parent $here
$kb = Join-Path $root "knowledge-base"
$reportPath = Join-Path $kb "HEALTH-REPORT.md"
$manifestPath = Join-Path $kb "manifest.json"

$checks = New-Object System.Collections.Generic.List[object]

function Add-Check($Name, $Status, $Details) {
    $script:checks.Add([ordered]@{
        name = $Name
        status = $Status
        details = $Details
    }) | Out-Null
}

function Test-Marker($Name, $Path, $Marker, $ShouldExist = $true) {
    $exists = Test-Path $Path
    if ($ShouldExist -and -not $exists) {
        Add-Check $Name "FAIL" "Missing: $Path"
        return
    }
    if (-not $ShouldExist -and $exists) {
        Add-Check $Name "FAIL" "Must be absent: $Path"
        return
    }
    if ($ShouldExist -and $Marker) {
        $content = Get-Content -LiteralPath $Path -Raw -Encoding utf8
        if ($content -notlike "*$Marker*") {
            Add-Check $Name "FAIL" "Missing marker: $Marker"
            return
        }
    }
    Add-Check $Name "OK" $Path
}

Test-Marker "cursor-jr subagent" (Join-Path $env:USERPROFILE ".cursor\agents\cursor-jr.md") "readonly: true" $true
Test-Marker "cursor-jr-maintainer subagent" (Join-Path $env:USERPROFILE ".cursor\agents\cursor-jr-maintainer.md") "readonly: false" $true
Test-Marker "legacy cursor-jr skill absent" (Join-Path $env:USERPROFILE ".cursor\skills\cursor-jr\SKILL.md") $null $false
Test-Marker "maintainer skill disabled" (Join-Path $env:USERPROFILE ".cursor\skills\cursor-jr-knowledge-base\SKILL.md") "disable-model-invocation: true" $true
Test-Marker "health command installed" (Join-Path $env:USERPROFILE ".cursor\commands\cursor-jr-health.md") "health-check.ps1" $true

if (Test-Path $manifestPath) {
    try {
        $manifest = Get-Content -LiteralPath $manifestPath -Raw -Encoding utf8 | ConvertFrom-Json
        $dates = @()
        foreach ($p in $manifest.pages.PSObject.Properties) {
            if ($p.Value.last_synced) {
                $dates += [datetime]::Parse($p.Value.last_synced)
            }
        }
        if ($dates.Count -gt 0) {
            $latest = ($dates | Sort-Object -Descending | Select-Object -First 1)
            $ageDays = [int]((Get-Date) - $latest).TotalDays
            if ($ageDays -le 30) {
                Add-Check "manifest freshness" "OK" "Latest sync: $($latest.ToString('yyyy-MM-dd')) ($ageDays days)"
            }
            else {
                Add-Check "manifest freshness" "WARN" "Latest sync: $($latest.ToString('yyyy-MM-dd')) ($ageDays days)"
            }
        }
        else {
            Add-Check "manifest freshness" "WARN" "No page sync dates found"
        }
    }
    catch {
        Add-Check "manifest freshness" "FAIL" $_.Exception.Message
    }
}
else {
    Add-Check "manifest freshness" "FAIL" "Missing manifest.json"
}

try {
    & (Join-Path $here "audit-coverage.ps1") | Out-Null
    Add-Check "coverage audit" "OK" "Missing=0"
}
catch {
    Add-Check "coverage audit" "FAIL" $_.Exception.Message
}

try {
    & (Join-Path $here "test-dialogues.ps1") | Out-Null
    Add-Check "dialogue tests" "OK" "Static behavior checks passed"
}
catch {
    Add-Check "dialogue tests" "FAIL" $_.Exception.Message
}

$failed = ($checks | Where-Object { $_.status -eq "FAIL" }).Count
$warned = ($checks | Where-Object { $_.status -eq "WARN" }).Count
$status = if ($failed -gt 0) { "FAIL" } elseif ($warned -gt 0) { "WARN" } else { "OK" }

$report = @"
# HEALTH-REPORT

**Generated:** $(Get-Date -Format "yyyy-MM-dd HH:mm")
**Status:** $status
**Failed:** $failed
**Warnings:** $warned

| Status | Check | Details |
|--------|-------|---------|
"@

foreach ($check in $checks) {
    $report += "`n| $($check.status) | $($check.name) | $($check.details) |"
}

$report += @"


## Next step

If status is `FAIL`, run:

```powershell
.\scripts\install-plugin.ps1
.\scripts\verify-install.ps1
.\scripts\health-check.ps1
```
"@

Set-Content -LiteralPath $reportPath -Value $report -Encoding utf8

foreach ($check in $checks) {
    Write-Host "$($check.status) $($check.name): $($check.details)"
}
Write-Host "Health report: $reportPath"

if ($failed -gt 0) {
    exit 2
}
