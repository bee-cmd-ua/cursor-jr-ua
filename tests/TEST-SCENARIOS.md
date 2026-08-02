# Тест-сценарии CursorJr

Ручная проверка после `.\scripts\install-plugin.ps1` и перезапуска Cursor.

## Подготовка

1. `.\scripts\install-plugin.ps1`
2. Перезапустить Cursor
3. Открыть папку `Cursor Junior` или любой тестовый проект

---

## Сценарий 1 — Первый запуск

**Ввод пользователя:**
```
Я впервые в Cursor, что делать?
```

**Ожидание:**
- Главный агент делегирует именно `Task(cursor-jr)` (rule routing)
- Нельзя считать PASS, если главный агент просто отвечает «в стиле CursorJr»
- Ответ: суть + шаги + ссылка на playbook `00-pervyy-raz.md`
- Русский язык
- Не более 7 шагов за раз

**Статус:** [ ] PASS [ ] FAIL

---

## Сценарий 2 — Режимы Plan vs Agent

**Ввод:**
```
Чем Plan отличается от Agent? Объясни как для новичка.
```

**Ожидание:**
- Таблица или mermaid-схема выбора режима
- Без правки файлов (cursor-jr readonly)
- Ссылка на `knowledge-base/02-agent-i-rezhimy/rezhimy-tablica.md` или help

**Статус:** [ ] PASS [ ] FAIL

---

## Сценарий 3 — Автоматизация

**Ввод:**
```
Хочу автоматизировать публикации статей. С чего начать в Cursor?
```

**Ожидание:**
- Playbook 01 (rule + skill + Auto-review)
- **Не** рекомендует Run Everything
- Пошаговый чеклист

**Статус:** [ ] PASS [ ] FAIL

---

## Сценарий 4 — Другой язык

**Ввод:**
```
Explain Agent mode in simple English.
```

**Ожидание:**
- Ответ на английском
- Предложение зафиксировать язык в user rules

**Статус:** [ ] PASS [ ] FAIL

---

## Сценарий 5 — Опытный пользователь

**Ввод:**
```
Рефакторинг модуля auth без объяснений, просто сделай.
```

**Ожидание:**
- CursorJr **не** вызывается
- Главный агент работает в Agent без обучающего тона

**Статус:** [ ] PASS [ ] FAIL

---

## Проверка установки (автоматическая)

| Файл | Путь | Проверено |
|------|------|-----------|
| Subagent | `%USERPROFILE%\.cursor\agents\cursor-jr.md` | PASS |
| Legacy skill | `%USERPROFILE%\.cursor\skills\cursor-jr\SKILL.md` | MUST NOT EXIST |
| Maintainer skill | `%USERPROFILE%\.cursor\skills\cursor-jr-knowledge-base\SKILL.md` | PASS |
| Rule | `%USERPROFILE%\.cursor\rules\cursor-jr-routing.mdc` | PASS |
| Command | `%USERPROFILE%\.cursor\commands\cursor-jr.md` | PASS |
| KB INDEX | `knowledge-base/INDEX.md` | PASS |
| Playbook 00 | `playbooks/00-pervyy-raz.md` | PASS |
| Sync report | `knowledge-base/SYNC-REPORT.md` | PASS |

## Fallback (Cloud)

Если `Task(cursor-jr)` недоступен:
```
Task(generalPurpose) + full prompt from agents/cursor-jr.md
```

## Проверка конфликта skill/subagent

**Ожидание после установки:**

- `%USERPROFILE%\.cursor\agents\cursor-jr.md` существует
- `%USERPROFILE%\.cursor\skills\cursor-jr\SKILL.md` отсутствует
- `%USERPROFILE%\.cursor\skills\cursor-jr-knowledge-base\SKILL.md` существует
- `/cursor-jr` не должен отвечать сам: он должен просить главный Agent вызвать `Task(cursor-jr)`
