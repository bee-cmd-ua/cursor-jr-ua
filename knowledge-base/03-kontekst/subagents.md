---
title: "Subagents — вузькі помічники"
source: https://cursor.com/ru/docs/subagents
audience: beginner
tier: 2
last_synced: 2026-07-02
---

## Простими словами

**Субагент** — окремий помічник зі своїм «вікном пам'яті». Головний Agent віддає йому підзавдання і отримує короткий результат.

## Вбудовані (не налаштовувати)

| Субагент | Навіщо |
|----------|--------|
| **Explore** | Шукати по проєкту |
| **Bash** | Команди в терміналі |
| **Browser** | Робота з веб-сторінкою |

## Власні субагенти

Файл `.cursor/agents/nazva.md` або `~/.cursor/agents/nazva.md`:

```markdown
---
name: miy-pomichnyk
description: Перевіряє текст на помилки. Use proactively.
readonly: true
---
```

## Коли subagent, коли skill

| Subagent | Skill |
|----------|-------|
| Довге дослідження | Одна швидка операція |
| Потрібна ізоляція контексту | Не потрібен окремий контекст |
| Паралельні завдання | Один крок |

## Покроково

1. Створіть `.cursor/agents/perevirka-tekstu.md`
2. Перезапустіть Cursor
3. Попросіть Agent: «використай субагент perevirka-tekstu для @file.md»

## Офіційне посилання

https://cursor.com/ru/docs/subagents
