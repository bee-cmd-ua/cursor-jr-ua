# Changelog базы знаний CursorJr

Формат: дата — что изменилось — источник.

## 2026-07-02 (6)

- Добавлены `scripts/health-check.ps1` и команда `/cursor-jr-health`
- Добавлены тестовые диалоги `tests/cursor-jr-dialogues.md` и `scripts/test-dialogues.ps1`
- Добавлена матрица маршрутизации `routing-test-cases.md`
- Добавлены учебные материалы `learning-path-7-days.md` и `typical-beginner-failures.md`
- Обновлены install/verify, INDEX и prompt `cursor-jr`

## 2026-07-02 (5)

- Добавлен maintainer-субагент `cursor-jr-maintainer` для обслуживания KB, sync, coverage и verify
- Добавлен `scripts/audit-coverage.ps1` и отчёт `knowledge-base/COVERAGE-REPORT.md`
- Добавлены профили новичков и wizard-сценарии: первый проект, автоматизация, MCP, ошибка, Canvas
- Обновлены `agents/cursor-jr.md`, `INDEX.md`, `install-plugin.ps1`, `verify-install.ps1`, команды и rule обновления KB

## 2026-07-02 (4)

- Расширена база знаний до почти полной карты Cursor Docs/Help/Learn для CursorJr
- Добавлены P0-карточки: Ask Mode, Plan Mode, Debug Mode, Prompting, Agent Review, Terminal, Browser, Search, Security Run Modes
- Добавлены продвинутые разделы: Cloud Agents, Automations, Hooks, Teams/Dashboard, Pricing/Usage, Integrations, Bugbot/Security Agents, CLI, SDK, Cloud Agents API
- Обновлены `INDEX.md`, `agents/cursor-jr.md` и seed URL в `sync-docs.ps1`

## 2026-07-02 (3)

- Исправлена архитектура CursorJr: `cursor-jr` теперь полноценный субагент в `agents/cursor-jr.md`, а не skill-заглушка
- Удалён конфликтующий skill `cursor-jr`; оставлен только maintainer-skill `cursor-jr-knowledge-base` с `disable-model-invocation: true`
- Добавлен `scripts/verify-install.ps1` для проверки установки
- Очищен `UPDATE-QUEUE.md` от mojibake и уже обработанных пунктов
- `sync-docs.ps1` переведён на ASCII-служебные строки, чтобы PowerShell 5 не портил кириллицу
- Sync проверен: 11/11 страниц OK, `docs/rules` закрыт существующей карточкой `03-kontekst/rules.md`

## 2026-07-02 (2)

- Добавлена карточка `02-agent-i-rezhimy/canvas-i-shared-canvases.md` (Canvas, Shared Canvases, Publish)
- Seed sync: `https://cursor.com/docs/agent/tools/canvas`
- Обновлены INDEX, glossarium, SKILL routing

## 2026-07-02

- Первая версия базы знаний (разделы 01–08, glossarium, playbooks)
- Добавлен `sync-docs.ps1` и контракт обновления
- Добавлено rule `cursor-jr-knowledge-refresh`
