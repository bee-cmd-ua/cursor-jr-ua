# Static behavior tests for CursorJr configuration.
# Usage: .\scripts\test-dialogues.ps1

$ErrorActionPreference = "Stop"
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$root = Split-Path -Parent $here

$agentPath = Join-Path $root "agents\cursor-jr.md"
$maintainerPath = Join-Path $root "agents\cursor-jr-maintainer.md"
$routingPath = Join-Path $root "rules\cursor-jr-routing.mdc"
$testsPath = Join-Path $root "tests\cursor-jr-dialogues.md"

$checks = @(
    @{ Name = "agent exists"; Path = $agentPath; Marker = "name: cursor-jr" },
    @{ Name = "agent readonly"; Path = $agentPath; Marker = "readonly: true" },
    @{ Name = "agent is not a skill"; Path = $agentPath; Marker = "skill" },
    @{ Name = "simple answer algorithm"; Path = $agentPath; Marker = "cursor.com/ru/docs" },
    @{ Name = "analogy requirement"; Path = $agentPath; Marker = "mermaid" },
    @{ Name = "max seven steps"; Path = $agentPath; Marker = "7" },
    @{ Name = "profiles linked"; Path = $agentPath; Marker = "profiles/beginner-profiles.md" },
    @{ Name = "wizards linked"; Path = $agentPath; Marker = "wizards/wizard-router.md" },
    @{ Name = "maintainer exists"; Path = $maintainerPath; Marker = "name: cursor-jr-maintainer" },
    @{ Name = "maintainer not mentor"; Path = $maintainerPath; Marker = "Not for answering beginner questions" },
    @{ Name = "routing calls cursor-jr"; Path = $routingPath; Marker = "Task(cursor-jr)" },
    @{ Name = "dialogue CJ-001"; Path = $testsPath; Marker = "CJ-001" },
    @{ Name = "dialogue maintainer case"; Path = $testsPath; Marker = "Task(cursor-jr-maintainer)" }
)

$failed = 0
foreach ($check in $checks) {
    if (-not (Test-Path $check.Path)) {
        Write-Host "FAIL $($check.Name): missing $($check.Path)" -ForegroundColor Red
        $failed++
        continue
    }
    $content = Get-Content -LiteralPath $check.Path -Raw -Encoding utf8
    if ($content -notlike "*$($check.Marker)*") {
        Write-Host "FAIL $($check.Name): missing marker '$($check.Marker)'" -ForegroundColor Red
        $failed++
        continue
    }
    Write-Host "OK   $($check.Name)" -ForegroundColor Green
}

if ($failed -gt 0) {
    throw "CursorJr dialogue tests failed: $failed problem(s)."
}

Write-Host "CursorJr dialogue tests passed." -ForegroundColor Green
