---
title: "Карта бази знань CursorJr"
audience: beginner
last_synced: 2026-07-02
---

# База знань CursorJr

Спрощені витяги з офіційної документації Cursor українською.

## З чого почати

| День | Що вивчати | Файли |
|------|-----------|-------|
| **День 1** | Встановлення, перша папка, Agent, Ask/Plan/Debug, Tab | `01-pervye-shagi/`, `02-agent-i-rezhimy/` |
| **Тиждень 1** | Rules, Skills, diff, review, checkpoints, prompting | `03-kontekst/`, `02-agent-i-rezhimy/agent-review.md`, `prompting.md` |
| **Місяць 1** | Terminal, Browser, Search, MCP, subagents, Canvas | `09-tools/`, `03-kontekst/mcp-basics.md`, `canvas-i-shared-canvases.md` |
| **Пізніше** | Cloud Agents, Automations, Teams, CLI, SDK, API | `10-cloud-automation/`, `11-team-admin/`, `12-advanced-dev/` |

## Профілі та wizards

- [Профілі новачків](../profiles/beginner-profiles.md)
- [Cursor за 7 днів](learning-path-7-days.md)
- [Типові проблеми новачків](typical-beginner-failures.md)
- [Wizard Router](../wizards/wizard-router.md)
- [Перший проєкт](../wizards/wizard-first-project.md)
- [Перша автоматизація](../wizards/wizard-automation.md)
- [Підключити MCP](../wizards/wizard-connect-mcp.md)
- [Виправити помилку](../wizards/wizard-fix-error.md)
- [Canvas і Shared Canvas](../wizards/wizard-share-canvas.md)

## Розділи

### 01 — Перші кроки
- [Встановлення і вхід](01-pervye-shagi/ustanovka-i-vhod.md)
- [Перша папка](01-pervye-shagi/pervaya-papka.md)
- [Tab — автодоповнення](01-pervye-shagi/tab-avtodopolnenie.md)

### 02 — Agent і режими
- [Що таке Agent](02-agent-i-rezhimy/chto-takoe-agent.md)
- [Agents Window](02-agent-i-rezhimy/agents-window.md)
- [Таблиця режимів](02-agent-i-rezhimy/rezhimy-tablica.md)
- [Ask Mode](02-agent-i-rezhimy/ask-mode.md)
- [Plan Mode](02-agent-i-rezhimy/plan-mode.md)
- [Debug Mode](02-agent-i-rezhimy/debug-mode.md)
- [Design Mode](02-agent-i-rezhimy/design-mode.md)
- [Prompting](02-agent-i-rezhimy/prompting.md)
- [Agent Review](02-agent-i-rezhimy/agent-review.md)
- [Контрольні точки](02-agent-i-rezhimy/kontrolnye-tochki.md)
- [Черга повідомлень](02-agent-i-rezhimy/ochered-soobscheniy.md)
- [Canvas і Shared Canvases](02-agent-i-rezhimy/canvas-i-shared-canvases.md)

### 03 — Контекст
- [Rules](03-kontekst/rules.md)
- [Skills](03-kontekst/skills.md)
- [Subagents](03-kontekst/subagents.md)
- [MCP — основи](03-kontekst/mcp-basics.md)
- [@file і контекст](03-kontekst/ssylki-kontekst.md)

### 04 — Безпека
- [Run Mode](04-bezopasnost/run-mode.md)
- [Security і Run Modes](04-bezopasnost/security-run-modes.md)
- [permissions.json](04-bezopasnost/permissions.md)
- [Що не давати агенту](04-bezopasnost/chto-ne-davat-agentu.md)

### 05 — Практика
- [Plan Mode workflow](05-praktika/plan-mode-workflow.md)
- [Ревью diff](05-praktika/review-diff.md)
- [Troubleshooting](05-praktika/troubleshooting.md)
- [Cursor за 7 днів](learning-path-7-days.md)
- [Типові проблеми новачків](typical-beginner-failures.md)

### 06 — Хмара і API (пізніше)
- [Cloud Agents](06-oblako-i-api/cloud-agents.md)
- [API — огляд](06-oblako-i-api/api-overview.md)

### 07 — Курси Learn
- [Робота з агентами](07-learn-kursy/working-with-agents.md)

### 08 — FAQ Help
- [Agent FAQ](08-help-faq/agent-faq.md)
- [Tab FAQ](08-help-faq/tab-faq.md)
- [Тарифи та ліміти](08-help-faq/pricing-i-limity.md)

### 09 — Tools
- [Terminal tool](09-tools/terminal.md)
- [Browser tool](09-tools/browser.md)
- [Search tool](09-tools/search.md)

### 10 — Cloud і автоматизація
- [Cloud Agents setup](10-cloud-automation/cloud-agents-setup.md)
- [Cloud Agent Settings](10-cloud-automation/cloud-agent-settings.md)
- [Automations](10-cloud-automation/automations.md)
- [Hooks](10-cloud-automation/hooks.md)

### 11 — Команда і адміністрування
- [Teams і Dashboard](11-team-admin/teams-dashboard.md)
- [Pricing, usage limits і моделі](11-team-admin/pricing-usage-limits.md)
- [Integrations](11-team-admin/integrations.md)
- [Bugbot і Security Agents](11-team-admin/bugbot-security-agents.md)

### 12 — Просунутий dev-шар
- [Cursor CLI](12-advanced-dev/cli.md)
- [Cursor SDK](12-advanced-dev/sdk.md)
- [Cloud Agents API](12-advanced-dev/cloud-agent-api.md)

### Довідник
- [Глосарій](glossarium.md)
- [Changelog](CHANGELOG.md)
- [Черга оновлень](UPDATE-QUEUE.md)
- [Manifest (свіжість)](manifest.json)

## Оновлення бази

Якщо в Cursor з'явилось щось нове:

1. `.\scripts\sync-docs.ps1`
2. `.\scripts\audit-coverage.ps1`
3. `UPDATE-QUEUE.md` → спростити для новачків
4. `CHANGELOG.md` → записати зміну
5. `.\scripts\install-plugin.ps1`
6. `.\scripts\verify-install.ps1`

## Playbooks

- [00 — Перший раз](../playbooks/00-pervyy-raz.md)
- [01 — Перша автоматизація](../playbooks/01-pervaya-avtomatizaciya.md)
- [02 — Підключити MCP](../playbooks/02-podklyuchit-mcp.md)
- [03 — Створити субагента](../playbooks/03-sozdat-subagenta.md)
- [04 — Відкат і безпека](../playbooks/04-otkat-i-bezopasnost.md)

## Офіційні джерела

- https://cursor.com/ru/docs
- https://cursor.com/ru/learn
- https://cursor.com/ru/help
- https://cursor.com/ru/docs/api
