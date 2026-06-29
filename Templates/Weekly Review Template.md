---
date: {{date}}
tags: [weekly-review]
status: active
week: {{date:W}}
---

# Weekly Review — Week {{date:W}} ({{date:DD MMM}} – {{date+6:DD MMM YYYY}})

---

## 🎯 One thing only

**If I do nothing else this week, I do:**

---

## 📅 Commitments of the week

*Extracted from [[Agenda]] for the current week.*

| Day | Time | Commitment | Notes |
|-----|------|------------|-------|
| | | | |

---

## Critical deadlines

---

## 📋 The plan

### ⏱️ Budget

<!-- Example:
Demand:      Project A 7h · Project B 6h · comms 1h  = 14h
Usable days: Mon–Thu (Wed ½) · Fri/Sat busy · Sun review
Verdict:     tight — Thursday has zero margin → if it overflows, one big task slides to W+1
-->

### Deliverables by day

```dataview
TASK FROM "Projects"
WHERE plan AND plan >= this.file.day AND plan <= this.file.day + dur(6 days)
SORT plan ASC
GROUP BY plan
```

---

## 🅿️ Parking lot

*Everything still open but without a day: waiting loops, candidates that didn't make it in,
long-term items. Visible, not lost — re-pick from here at the next review or when it relocates.
In the projects this maps to `## Backlog` and the `⏳` items.*

- [ ] 

---

## How it went
*To fill in at the end of the week*

---

## 🔗 Related
- [[Senso/Mese {{date:YYYY-MM}}|Current month]]
- Previous: [[Weekly Review {{date-7:YYYY-[W]WW}}]]
- Next: [[Weekly Review {{date+7:YYYY-[W]WW}}]]
