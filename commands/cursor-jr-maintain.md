# CursorJr Maintainer

Викликай maintainer-субагента:

```text
Task(cursor-jr-maintainer)
```

Передай завдання:

- перевірити `knowledge-base/UPDATE-QUEUE.md`;
- оновити відсутні картки;
- запустити `scripts/audit-coverage.ps1`;
- оновити `CHANGELOG.md`;
- виконати `scripts/install-plugin.ps1` і `scripts/verify-install.ps1`.

Не використовуй цей сценарій для відповідей новачкам. Для цього є `Task(cursor-jr)`.
