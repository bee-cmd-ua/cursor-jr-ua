# Verifies CursorJr installation after install-plugin.ps1.
# Usage: .\scripts\verify-install.ps1

$ErrorActionPreference = "Stop"

$checks = @(
    @{
        Name = "Task subagent"
        Path = Join-Path $env:USERPROFILE ".cursor\agents\cursor-jr.md"
        ShouldExist = $true
        MustContain = "name: cursor-jr"
    },
    @{
        Name = "Maintainer subagent"
        Path = Join-Path $env:USERPROFILE ".cursor\agents\cursor-jr-maintainer.md"
        ShouldExist = $true
        MustContain = "name: cursor-jr-maintainer"
    },
    @{
        Name = "Legacy skill must be absent"
        Path = Join-Path $env:USERPROFILE ".cursor\skills\cursor-jr\SKILL.md"
        ShouldExist = $false
        MustContain = $null
    },
    @{
        Name = "Maintainer skill"
        Path = Join-Path $env:USERPROFILE ".cursor\skills\cursor-jr-knowledge-base\SKILL.md"
        ShouldExist = $true
        MustContain = "disable-model-invocation: true"
    },
    @{
        Name = "Routing rule"
        Path = Join-Path $env:USERPROFILE ".cursor\rules\cursor-jr-routing.mdc"
        ShouldExist = $true
        MustContain = "Task(cursor-jr)"
    },
    @{
        Name = "Knowledge refresh rule"
        Path = Join-Path $env:USERPROFILE ".cursor\rules\cursor-jr-knowledge-refresh.mdc"
        ShouldExist = $true
        MustContain = "sync-docs.ps1"
    },
    @{
        Name = "CursorJr command"
        Path = Join-Path $env:USERPROFILE ".cursor\commands\cursor-jr.md"
        ShouldExist = $true
        MustContain = "Task(cursor-jr)"
    },
    @{
        Name = "CursorJr sync command"
        Path = Join-Path $env:USERPROFILE ".cursor\commands\cursor-jr-sync.md"
        ShouldExist = $true
        MustContain = "sync-docs.ps1"
    },
    @{
        Name = "CursorJr maintainer command"
        Path = Join-Path $env:USERPROFILE ".cursor\commands\cursor-jr-maintain.md"
        ShouldExist = $true
        MustContain = "Task(cursor-jr-maintainer)"
    },
    @{
        Name = "CursorJr health command"
        Path = Join-Path $env:USERPROFILE ".cursor\commands\cursor-jr-health.md"
        ShouldExist = $true
        MustContain = "health-check.ps1"
    }
)

$failed = 0

foreach ($check in $checks) {
    $exists = Test-Path $check.Path

    if ($check.ShouldExist -and -not $exists) {
        Write-Host "FAIL $($check.Name): missing $($check.Path)" -ForegroundColor Red
        $failed++
        continue
    }

    if (-not $check.ShouldExist -and $exists) {
        Write-Host "FAIL $($check.Name): should not exist $($check.Path)" -ForegroundColor Red
        $failed++
        continue
    }

    if ($check.ShouldExist -and $check.MustContain) {
        $content = Get-Content -LiteralPath $check.Path -Raw -Encoding utf8
        if ($content -notlike "*$($check.MustContain)*") {
            Write-Host "FAIL $($check.Name): missing marker '$($check.MustContain)'" -ForegroundColor Red
            $failed++
            continue
        }
    }

    Write-Host "OK   $($check.Name)" -ForegroundColor Green
}

$agentContent = Get-Content -LiteralPath (Join-Path $env:USERPROFILE ".cursor\agents\cursor-jr.md") -Raw -Encoding utf8
if ($agentContent -notlike "*readonly: true*") {
    Write-Host "FAIL Task subagent: cursor-jr must stay readonly" -ForegroundColor Red
    $failed++
}

$maintainerContent = Get-Content -LiteralPath (Join-Path $env:USERPROFILE ".cursor\agents\cursor-jr-maintainer.md") -Raw -Encoding utf8
if ($maintainerContent -notlike "*readonly: false*") {
    Write-Host "FAIL Maintainer subagent: cursor-jr-maintainer must be allowed to maintain files" -ForegroundColor Red
    $failed++
}

if ($failed -gt 0) {
    throw "CursorJr verification failed: $failed problem(s). Run .\scripts\install-plugin.ps1 and restart Cursor."
}

Write-Host "CursorJr verification passed. Restart Cursor if you just installed it." -ForegroundColor Green
