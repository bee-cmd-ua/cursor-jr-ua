---
title: "Rules — постійні інструкції"
source: https://cursor.com/ru/docs/context/rules
audience: beginner
tier: 2
last_synced: 2026-07-02
---

## Простими словами

**Rules** — нотатки для агента, які він читає кожного разу (або коли потрібно): «пиши українською», «не чіпай папку dist».

## Коли вам це потрібно

Хочете, щоб Agent завжди пам'ятав ваші стандарти без повторення в кожному повідомленні.

## Типи правил

| Тип | Де | Для кого |
|-----|-----|----------|
| Project rules | `.cursor/rules/*.mdc` | Один проєкт |
| User rules | Settings → Rules | Всі ваші проєкти |
| Team rules | Dashboard команди | Вся команда |

## Типи застосування

| Тип | Коли спрацьовує |
|-----|----------------|
| Always Apply | У кожному чаті |
| Apply Intelligently | Agent сам вирішує за описом |
| Apply to Specific Files | Коли відкрито файл за шаблоном |
| Apply Manually | Коли ви пишете `@назва-правила` |

## Покроково

1. В Agent напишіть `/create-rule` і опишіть правило
2. Або створіть файл `.cursor/rules/moe-pravylo.mdc`
3. Додайте frontmatter: `alwaysApply: true` або `description:` + `globs:`

## Часті помилки

- Файл `.md` замість `.mdc` у `.cursor/rules/` — **ігнорується**
- Надто довге правило — розбийте на кілька

## Офіційне посилання

https://cursor.com/ru/docs/context/rules
