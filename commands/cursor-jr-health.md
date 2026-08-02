# Перевірити CursorJr

Запусти повний health-check:

```powershell
.\scripts\health-check.ps1
```

Він перевірить:

- `cursor-jr` встановлено як readonly-субагент;
- `cursor-jr-maintainer` встановлено як maintainer-субагент;
- старий конфліктний skill `cursor-jr` відсутній;
- coverage бази знань без пропусків;
- тестові сценарії поведінки проходять;
- `manifest.json` не застарів.

Підсумковий звіт: `knowledge-base/HEALTH-REPORT.md`.
