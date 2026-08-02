---
title: Playbook 03 — Створити своєю субагента
---

# Playbook 03 — Створити своєю субагента

**Для кого:** просунутий новачок

## Чеклист

- [ ] Створити `.cursor/agents/perevirka-tekstu.md`
- [ ] Frontmatter: `name`, `description`, `readonly: true` якщо тільки перевірка
- [ ] Тіло: роль і кроки
- [ ] Перезапустити Cursor
- [ ] Попросити: «Використай subagent perevirka-tekstu для @file.md»

## Шаблон файлу

```markdown
---
name: perevirka-tekstu
description: Перевіряє текст на ясність. Use proactively.
readonly: true
---

Ти редактор для неспеціалістів.
1. Знайди незрозумілі терміни
2. Запропонуй прості замінники
3. Список зауважень за пріоритетом
```

## Наступний крок

Playbook 04 — Відкат і безпека
