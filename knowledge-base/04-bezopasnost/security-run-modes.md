---
title: "Security і Run Modes — безпечна робота Agent"
source: https://cursor.com/docs/agent/security/run-modes
audience: beginner
tier: 1
last_synced: 2026-07-02
---

# Security і Run Modes

## Простими словами

Run Mode відповідає за те, як Cursor дозволяє агенту запускати команди і інструменти. Це «ремінь безпеки» для Agent.

## Основні режими

| Режим | Для новачка | Що значить |
|-------|-------------|-----------|
| Auto-review | Рекомендується | Cursor сам оцінює ризик і питає при небезпечному |
| Allowlist | Коли розумієте команди | Дозволені тільки команди зі списку |
| Run Everything | Не для новачків | Все запускається без зайвих питань |

## Покроково

1. Відкрийте Settings → Agents / Terminal
2. Виберіть **Auto-review**
3. Якщо Agent просить команду — прочитайте її
4. Якщо незрозуміло — попросіть пояснити
5. Небезпечні команди відхиляйте

## Червоні прапори

- Видалення файлів або папок
- Команди з секретами
- Деплой на production
- Зміна git history
- Масові операції без backup

## Офіційне посилання

https://cursor.com/docs/agent/security/run-modes
