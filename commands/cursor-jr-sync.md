# Оновити базу знань CursorJr

Запусти синхронізацію офіційної документації Cursor:

```powershell
.\scripts\sync-docs.ps1
```

Потім:

1. Відкрий `knowledge-base/UPDATE-QUEUE.md`
2. Запусти `.\scripts\audit-coverage.ps1`
3. Обробляй пункти зі статусом `new` або `changed`
4. Спрощуй мову для новачків (контракт: `shared/knowledge-update-contract.md`)
5. Записуй у `knowledge-base/CHANGELOG.md`
6. Виконай `.\scripts\install-plugin.ps1`
7. Виконай `.\scripts\verify-install.ps1`

Дотримуйся rule `cursor-jr-knowledge-refresh`.

Якщо робота велика — делегуй `Task(cursor-jr-maintainer)`.
