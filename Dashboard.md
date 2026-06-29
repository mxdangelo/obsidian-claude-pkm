---
tags: [dashboard]
---

# Dashboard

*A Dataview cockpit consulted in Obsidian — not edited via Claude. Requires the Dataview plugin.*

## 📅 Upcoming

![[Agenda#Upcoming]]

## 🔴 Open tasks by project

```dataview
TASK FROM "Projects"
WHERE !completed AND !contains(text, "⏳")
GROUP BY file.link
SORT file.link ASC
```

## 📌 Active projects

```dataview
TABLE status, file.mtime AS "Last edited"
FROM "Projects"
WHERE status = "active"
SORT file.mtime DESC
```

## 🗓️ This week's plan

```dataview
TASK FROM "Projects"
WHERE plan AND plan >= date(today) - dur(7 days)
SORT plan ASC
GROUP BY plan
```
