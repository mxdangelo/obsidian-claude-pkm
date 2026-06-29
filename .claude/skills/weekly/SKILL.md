---
name: weekly
description: Run the weekly review. Focused on planning — reads the active projects, Agenda.md, and the open loops from last week's review. It does NOT re-read the journal and does NOT run /weave. Generates the Senso/Weekly Review note.
allowed-tools: Read, Write, Edit, Glob, Grep
user-invocable: true
---

# Weekly

The operational planner for the coming week. It organizes work and commitments so nothing
slips. Focused on planning, not reflection: it must **not** re-read the journal and must
**not** run `/weave`. If you want to look back at patterns, point to `/weave` — reflection
lives there.

## Steps

1. **Identify the current week**: ISO week (`YYYY-Www`). Check whether
   `Senso/Weekly Review YYYY-Www.md` already exists.
   - Exists → read it, show what's filled and what's missing, ask the user what to update. STOP.
   - Doesn't exist → continue.
2. **Read** `Templates/Weekly Review Template.md`.
3. **Glob** `Projects/*.md` (flat files, one per project). **Read** the active ones —
   current state and next actions.
4. **Read** the previous Weekly Review (`Senso/Weekly Review YYYY-Wprev.md`) for its open
   loops and unkept commitments to carry forward. **Do not** read `Daily Notes/`.
5. **Touch the month file** (`Senso/Mese YYYY-MM.md`):
   - if it doesn't exist → create it from `Templates/Mese Template.md`;
   - remove critical deadlines that have now passed;
   - add new critical deadlines emerging from `Agenda.md` or the projects;
   - if it's the first review of the month and Theme/Intention are empty → ask the user
     (one direct question; declining is fine). Never deduce them.
6. **Compose the new review note**, populating from observed data:
   - **🎯 One thing only**: ask the user (don't deduce — it's a commitment).
   - **Commitments of the week**: from `Agenda.md` (rows in the current week).
   - **Critical deadlines**: from `Agenda.md` + project deadlines.
   - **📋 The plan** — these aren't copied checkboxes: the plan is a **Dataview view** over
     the project tasks (already in the template) plus a **Budget** header. Planning = two gestures:
     1. **Assign days to the source.** Go through each active project's `## Next actions` (the
        source of truth), excluding the blocked `⏳`, plus the previous review's Parking lot.
        For the candidates the user chooses, write the day **on the task in the project file**:
        `[plan:: YYYY-MM-DD]`. If a task lacks an estimate, ask for it and add `[est:: N]`
        (hours). **Don't recopy the task text into the review**: the checkbox lives only in
        the project, the view shows it. Days that are full in the Agenda don't take tasks.
     2. **Compute the Budget.** Sum the `[est::]` of the planned tasks, per day and in total.
        Compare against the number of usable days (minus Agenda commitments). Fill the header:
        `Demand` (hours per project = total), `Usable days`, `Verdict`. The verdict doesn't
        decide: it makes the load a number before the week starts. If demand exceeds usable
        days, say so — something goes back without `plan::` (Parking lot) or slides to W+1.
   - **🅿️ Parking lot**: what stays open but has no day — waiting loops, unplaced candidates,
     long-term. In the projects this maps to tasks without `plan::`, the `⏳`, and the
     `## Backlog`: no need to recopy them, just leave them without a day. Here list only the
     loops you want to keep an eye on.
7. **Set `date:`** in the frontmatter to the **Monday** of the target week: the plan's
   Dataview view bounds the week from `this.file.day`. **Write** the file. Short confirmation.

## Notes

- Don't call `TaskCreate`.
- Respect the user's writing language: if the dailies are in a language other than English,
  write the review in the same language.
- Don't write commitments for the user — fill only observable data, ask for the
  forward-looking parts.
- The reflective work — patterns, threads, "where am I going" — lives in `/weave`, not here.
  This review is for planning.
