---
name: weekly
description: Sunday's weekly review. CHRONICLE + PLANNING. Reads the 7 dailies of the closing week, appends dated traces to People/, reviews project checkboxes, fills the closing sections; then plans the opening week. Does NOT do longitudinal reflection (that's /weave) and does NOT run it.
allowed-tools: Read, Write, Edit, Glob, Grep
user-invocable: true
---

# Weekly

Sunday's ritual. Two beats: **chronicle** of the closing week, **planning** of the opening one. It
records the facts — what happened, who you saw, what you moved forward — and organizes the coming
work so nothing slips. Sunday closes one week and opens another: the chronicle looks at the 7 days
just lived, the planning at the 7 ahead.

This is the chronicle of facts, not reflection. The layer underneath — what you feel, what you don't
say, the threads that cross the weeks — lives in `/weave`, every 2 weeks. Do **not** re-read
interpretively and do **not** run `/weave`: if you want the patterns, point to it.

## The two weeks

- **Closing week** = the current ISO week (contains today). Its review already exists (created last
  Sunday). This is where the **chronicle** goes: the 7 dailies just written by hand.
- **Opening week** = the next ISO week. This is where the **planning** goes: you create its review
  and assign the days.

## Chronicle — the closing week

1. **Read** `Senso/Weekly Review YYYY-Www.md` of the closing week (if missing, create it from the
   template and proceed). **Glob + Read** the 7 dailies `Daily Notes/YYYY-MM-DD.md` of the week.
2. **Typographic pass on the dailies** — on each of the 7 dailies, a light, **presentation-only**
   pass: capitalize sentence starts, obvious typos, and break the block into readable paragraphs
   where the thought shifts. **Never** change words, syntax, order, or meaning — stay in first
   person ("I") (it's their journal, their voice). Idempotent: if a note is already formatted, leave
   it. This is the only place the weekly writes *inside* the daily; the rest of the chronicle writes
   elsewhere (People, Projects, the review).
3. **People** — for each meaningful passage in the dailies (not a passing mention):
   - if `People/{p}.md` is missing → create it (FORMAT at the bottom);
   - append a line at the end of {p}'s `## Traces`, dated **to the real day** it happened, in second
     person ("you"): `**YYYY-MM-DD** — <faithful to their account> [[Daily Notes/YYYY-MM-DD]]`.
     It's a Sunday batch, but traces stay dated per day, not one weekly line.
   - epithets/nicknames (e.g. "the neighbor") → resolve them via the `aliases` in the frontmatter of
     the `People/` files; if an epithet recurs and isn't an alias yet, propose adding it.
4. **Projects** — review the checkboxes, the source is the project:
   - in `## Next actions` of `Projects/{g}.md`, check off (`✅ YYYY-MM-DD`) the tasks with real
     progress in the dailies (a decision, deliverable, concrete step — not a thought);
   - if a new action emerges → add it there.
   - **No narrative line in `## Log`**: progress is checkboxes only. Historical logs stay where they
     are, no new ones are written.
5. **Close** — fill the `## 🔍 How the week went` sections in the closing review, from the words of
   the 7 dailies (voice: first person "I" for their quoted words; no inventions):
   - ⬆️⬇️ High and low of the week
   - What went well / what I'd improve / what I learned
   - 👥 People touched (who had a passage during the week)
   - **Themes** are not touched here: naming recurring patterns is interpretive, longitudinal work
     for `/weave`. The weekly records the facts.
6. **Write** the closing review.

## Planning — the opening week

7. **Identify** the next ISO week (`YYYY-Www`). Check `Senso/Weekly Review YYYY-Www.md`:
   - Already exists → read it, show what's filled and what's missing, ask what to update. STOP.
   - Doesn't exist → **Read** `Templates/Weekly Review Template.md` and continue.
8. **Glob** `Projects/*.md`. **Read** the active ones — state and next actions. **Read** the previous
   review for its open loops / unkept commitments to carry forward.
9. **Touch the month file** (`Senso/Mese YYYY-MM.md`):
   - if it doesn't exist → create it from `Templates/Mese Template.md`;
   - remove critical deadlines that have passed; add new ones from `Agenda.md` or the projects;
   - if it's the first review of the month and Theme/Intention are empty → ask (one direct question;
     declining is fine). Never deduce them.
10. **Compose the new review**, populating from observed data:
    - **🎯 One thing only**: ask (don't deduce — it's a commitment).
    - **Commitments of the week**: from `Agenda.md` (the week's rows).
    - **Critical deadlines**: from `Agenda.md` + project deadlines.
    - **📋 The plan** — not copied checkboxes: it's a **Dataview view** over the project tasks
      (already in the template) plus a **Budget** header. Planning = two gestures:
      1. **Assign days to the source.** Go through each active project's `## Next actions` (excluding
         the blocked `⏳`) plus the previous review's Parking lot. For the chosen candidates, write
         the day **on the task in the project file**: `[plan:: YYYY-MM-DD]`. If a task lacks an
         estimate, ask for it and add `[est:: N]` (hours). **Don't recopy the task text into the
         review**: the checkbox lives only in the project, the view shows it. Days full in the Agenda
         don't take tasks.
      2. **Compute the Budget.** Sum the `[est::]` of the planned tasks, per day and in total. Compare
         against usable days (minus Agenda commitments). Fill the header: `Demand`, `Usable days`,
         `Verdict`. The verdict doesn't decide: it makes the load a number before the week starts. If
         demand exceeds usable days, say so — something goes back without `plan::` (Parking lot) or
         slides to W+1.
    - **🅿️ Parking lot**: what stays open but has no day — waiting loops, unplaced candidates,
      long-term. In the projects this maps to tasks without `plan::`, the `⏳`, and the `## Backlog`:
      no need to recopy them, just leave them without a day. Here list only the loops to keep an eye on.
11. **Set `date:`** to the **Monday** of the opening week (the plan's Dataview view bounds the week
    from `this.file.day`). **Write**. Short confirmation: what you closed (traces, checkboxes,
    sections) and what you planned.

## Notes

- Don't call `TaskCreate`. Don't run `/weave`.
- Respect the writing language: if the dailies aren't in English, write the review in the same language.
- Don't write commitments for the user — fill observable data, ask for the forward-looking parts.
- The chronicle records facts; the cross-cutting reflection (patterns, threads, "where am I going")
  belongs to `/weave`. Here you don't interpret: you record and you plan.

FORMAT profile (creating a missing file): frontmatter `tags:[person]`, `relations:[]`, `themes:[]` ·
`# Name` · empty sections `## Recurring threads` and `## Traces`.
