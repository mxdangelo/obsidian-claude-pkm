---
name: daily
description: Fallback for creating/opening the daily note when Obsidian isn't available. In the normal case Obsidian creates the daily (Templater) and you write it by hand — Claude isn't needed. Distillation (chronicle, close) lives in the weekly, not here.
allowed-tools: Read, Write, Edit, Glob
user-invocable: true
---

# Daily

Opens `Daily Notes/YYYY-MM-DD.md`.
**Normal case: you create it in Obsidian (instant) and write it by hand. Templater does everything itself — renders the dates, populates `📅 Today` from the Agenda, and the 🔴 is a live Dataview view over today's `[plan::]` tasks. You can write the day without Claude, for days.** `/daily` is only a fallback for sessions without Obsidian (e.g. CLI), and for a minimal augment if you open a note Templater didn't process. No evening close, no proposed people/themes/tasks: distillation is done by `/weekly` on Sunday.

## Routing

does `Daily Notes/{today}.md` exist?
  yes → Augment (don't recompose the note)
  no → Create, then Augment

## Create (only if missing — fallback without Obsidian)

Normally Templater creates it in Obsidian (folder template on `Daily Notes/`, see `Templates/Daily Template.md`): it renders the date tokens. The 🔴 is a live Dataview block, don't fill it. Act here only if the note is missing and you can't create it in Obsidian, replicating what Templater would do:

- Read `Templates/Daily Template.md`
- Render the Templater tokens `<% ... %>`:
    "YYYY-MM-DD"               → today · offset `-1`/`+1` → yesterday/tomorrow
    "dddd, MMMM DD, YYYY"      → e.g. Monday, June 22, 2026
    "YYYY-[W]WW"               → ISO week (e.g. 2026-W26)
    "DDD" → day of year · "WW" → week number
- 🔴: leave the Dataview block as is. In CLI (Dataview won't render) you may, if useful, list the tasks with `[plan:: {today}]` found in `Projects/` below it — a session convenience, not the source.
- `📅 Today`: replicate the Templater script — read `Agenda.md`, pull the day's rows (format `ddd D`, e.g. `Wed 24`) and write them as bullets `- {time} — {item}`.
- Write the file

## Augment (minimal · idempotent · only targeted edits, do NOT regenerate the note)

- unrendered Templater tokens `<% %>` (a sign the note didn't go through Templater) → render them
- `📅 Today`: normally Templater already populated it at creation. Touch only if empty (note that
    didn't go through Templater) → fill from `Agenda.md` (today's appointments). Idempotent: if full, leave it.
- 🔴 To do today: it's a live Dataview view, not filled by hand. Nothing to copy.
- Then invite the user to write. No task/person/theme proposed: they write first.

NOT: TaskCreate · reading Projects/Themes/People/Senso · filling closing sections · appending
  traces or logs. All of that moved to the weekly. The daily is just theirs.

## Where the close went

The evening close no longer exists in the daily. The week's chronicle — a light typographic pass on
the dailies, dated traces in `People/`, project checkbox review, High/Low, went-well/improve/learned,
People touched — is compiled by `/weekly` on Sunday, reading the 7 dailies. The longitudinal
reflection (what you feel, what you don't say, the themes and threads over time) belongs to `/weave`,
every 2 weeks.
