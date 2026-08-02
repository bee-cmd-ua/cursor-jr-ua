# Installs CursorJr globally for Cursor Desktop
# Usage: .\scripts\install-plugin.ps1

$ErrorActionPreference = "Stop"
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$root = Split-Path -Parent $here
$pluginDest = Join-Path $env:USERPROFILE ".cursor\plugins\local\cursor-jr"

Write-Host "CursorJr: installing..." -ForegroundColor Cyan
Write-Host "  from: $root"
Write-Host "  plugin: $pluginDest"

# --- Local plugin copy
if (Test-Path $pluginDest) {
    Remove-Item -Path $pluginDest -Recurse -Force
}
New-Item -ItemType Directory -Force -Path $pluginDest | Out-Null
Copy-Item -Path (Join-Path $root "*") -Destination $pluginDest -Recurse -Force

$ver = (Get-Content (Join-Path $root ".cursor-plugin\plugin.json") -Raw | ConvertFrom-Json).version

# --- Task subagent (user-global)
$agentSrc = Join-Path $root "agents"
$taskUser = Join-Path $env:USERPROFILE ".cursor\agents"
New-Item -ItemType Directory -Force -Path $taskUser | Out-Null
foreach ($agent in @("cursor-jr.md", "cursor-jr-maintainer.md")) {
    $src = Join-Path $agentSrc $agent
    if (Test-Path $src) {
        Copy-Item -Path $src -Destination $taskUser -Force
        Write-Host "Task subagent: $taskUser\$agent" -ForegroundColor Cyan
    }
}

# --- Maintainer skill only (NOT the subagent — disable-model-invocation)
$oldSkill = Join-Path $env:USERPROFILE ".cursor\skills\cursor-jr"
if (Test-Path $oldSkill) {
    Remove-Item -Path $oldSkill -Recurse -Force
    Write-Host "Removed legacy skill: $oldSkill" -ForegroundColor Yellow
}
$skillSrc = Join-Path $root "skills\cursor-jr-knowledge-base"
$skillDest = Join-Path $env:USERPROFILE ".cursor\skills\cursor-jr-knowledge-base"
if (Test-Path $skillSrc) {
    if (Test-Path $skillDest) { Remove-Item -Path $skillDest -Recurse -Force }
    Copy-Item -Path $skillSrc -Destination $skillDest -Recurse -Force
    Write-Host "Maintainer skill: $skillDest" -ForegroundColor Cyan
}

# --- Rules (user-global)
$rulesDest = Join-Path $env:USERPROFILE ".cursor\rules"
New-Item -ItemType Directory -Force -Path $rulesDest | Out-Null
foreach ($rule in @("cursor-jr-routing.mdc", "cursor-jr-knowledge-refresh.mdc")) {
    $src = Join-Path $root "rules\$rule"
    if (Test-Path $src) {
        Copy-Item -Path $src -Destination $rulesDest -Force
        Write-Host "Rule: $rulesDest\$rule" -ForegroundColor Cyan
    }
}

# --- Commands (user-global)
$cmdDest = Join-Path $env:USERPROFILE ".cursor\commands"
New-Item -ItemType Directory -Force -Path $cmdDest | Out-Null
foreach ($cmd in @("cursor-jr.md", "cursor-jr-sync.md", "cursor-jr-maintain.md", "cursor-jr-health.md")) {
    $src = Join-Path $root "commands\$cmd"
    if (Test-Path $src) {
        Copy-Item -Path $src -Destination $cmdDest -Force
        Write-Host "Command: $cmdDest\$cmd" -ForegroundColor Cyan
    }
}

# --- Project mirror (optional, for this repo)
$projAgents = Join-Path $root ".cursor\agents"
New-Item -ItemType Directory -Force -Path $projAgents | Out-Null
foreach ($agent in @("cursor-jr.md", "cursor-jr-maintainer.md")) {
    $src = Join-Path $agentSrc $agent
    if (Test-Path $src) {
        Copy-Item -Path $src -Destination $projAgents -Force
    }
}
Write-Host "Project mirror: $projAgents" -ForegroundColor Cyan

Write-Host "Done. Restart Cursor to load CursorJr v$ver." -ForegroundColor Green
Write-Host "Invoke: Task(cursor-jr) or Task(cursor-jr-maintainer) in ~/.cursor/agents/" -ForegroundColor DarkGray
