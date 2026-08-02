# CursorJr — реєстр Task-субагентів

| Task name | Файл | Роль |
|-----------|------|------|
| `cursor-jr` | `agents/cursor-jr.md` | Україномовний наставник для новачків (readonly) |
| `cursor-jr-maintainer` | `agents/cursor-jr-maintainer.md` | Обслуговування KB, sync, coverage, install/verify |

Виклик: `Task(cursor-jr)`

Обслуговування: `Task(cursor-jr-maintainer)`

Fallback: `Task(generalPurpose)` + `agents/cursor-jr.md`
