---
title: Playbook 02 — Підключити MCP
---

# Playbook 02 — Підключити MCP

**Для кого:** коли Agent потребує доступ до браузера, API, docs

## Чеклист

- [ ] Дізнатись у постачальника MCP: імя сервера, command, env
- [ ] Створити або відредагувати `.cursor/mcp.json`
- [ ] Секрети — в переменні окруження, **не в Git**
- [ ] Перезапустити Cursor
- [ ] Settings → MCP — сервер зелений / активний
- [ ] В Agent: «Які MCP tools доступні?»
- [ ] Одна тестова операція

## Пример структури mcp.json

```json
{
  "mcpServers": {
    "example": {
      "command": "npx",
      "args": ["-y", "example-mcp-server"],
      "env": {}
    }
  }
}
```

## Наступний крок

Playbook 03 — Створити субагента
