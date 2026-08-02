---
title: "Automations — запуск агентів за розкладом і подіями"
source: https://cursor.com/docs/cloud-agent/automations
audience: intermediate
tier: 2
last_synced: 2026-07-02
---

# Automations — автоматичний запуск агентів

## Простими словами

Automations — це коли агент запускається сам: за розкладом, подією або webhook. Наприклад, «щоранку перевірити issue» або «після події в GitHub підготувати PR».

## Коли це потрібно

- Регулярні перевірки
- Щоденні звіти
- Автоматичні PR
- Інтеграції з GitHub/Slack/Linear

## Схема

```mermaid
flowchart LR
    trigger[Розклад_або_подія] --> automation[Automation]
    automation --> cloud[Cloud_Agent]
    cloud --> result[PR_звіт_або_коментар]
```

## Для новачка

Не починайте з Automations. Спочатку зробіть завдання вручну через Agent, потім перетворіть повторюване завдання в automation.

## Офіційне посилання

https://cursor.com/docs/cloud-agent/automations
