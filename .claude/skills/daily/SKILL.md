---
name: daily
description: Create, open, or close today's daily note. Pulls today's tasks from the projects via the week's plan; yesterday's leftovers relocate in the plan. At end of day it fills the closing sections.
allowed-tools: Read, Write, Edit, Glob
user-invocable: true
---

# Daily

Opens/enriches `Daily Notes/YYYY-MM-DD.md`.
**Normal case: you create it in Obsidian (instant). Templater does everything itself — renders the dates, populates `📅 Today` from the Agenda, and the 🔴 is a live Dataview view over today's `[plan::]` tasks. You can write the day without Claude, for days. `/daily` is for the evening close, for optional enrichments (carrying yesterday's priorities forward), and as a fallback without Obsidian.**

## Routing

does `Daily Notes/{today}.md` exist?
  yes → Augment (don't recompose the note)
  no → Create, then Augment

## Create (only if missing — fallback without Obsidian)

Normally Templater creates it in Obsidian (folder template on `Daily Notes/`, see `Templates/Daily Template.md`): it renders the date tokens. The 🔴 is a live Dataview block, don't fill it. Act here only if the note is missing and you can't create it in Obsidian (e.g. a CLI session), replicating what Templater would do:

- Read `Templates/Daily Template.md`
- Render the Templater tokens `<% ... %>`:
    "YYYY-MM-DD"               → today · offset `-1`/`+1` → yesterday/tomorrow
    "dddd, MMMM DD, YYYY"      → e.g. Monday, June 22, 2026
    "YYYY-[W]WW"               → ISO week (e.g. 2026-W26)
    "DDD" → day of year · "WW" → week number
- 🔴: leave the Dataview block as is. In CLI (Dataview won't render) you may, if useful, list the tasks with `[plan:: {today}]` found in `Projects/` below it — a session convenience, not the source.
- `📅 Today`: replicate the Templater script — read `Agenda.md`, pull the day's rows (format `ddd D`, e.g. `Wed 24`) and write them as bullets `- {time} — {item}`.
- Write the file

## Augment (always · idempotent · only targeted edits, do NOT regenerate the note)

- unrendered Templater tokens `<% %>` (a sign the note didn't go through Templater) → render them
- Glob `Daily Notes/*.md` → most recent previous daily → Read
- Read `Senso/Weekly Review {current week}.md` → "📋 The plan"
- 🔴 To do today: it's a live Dataview view, not filled by hand. Nothing to copy.
    The previous daily's "Tomorrow's priorities" (the evening's decision): write them as
    `[plan:: {today}]` on the right project's task — work/clients, or `Projects/Personal.md`
    if it's home/admin. Home and admin are tasks like any other, not a separate section.
- Yesterday's leftovers (tasks with `[plan:: {yesterday}]` left unchecked): they don't slide
    on their own. Relocating them is the user's decision, not a transfer: change `[plan::]` to
    the chosen day, or remove it (back to the Parking lot). Propose, don't decide. Say so in the confirmation.
- The checkbox is single, in the project: checking it in the view or in the project is the same
    gesture. No more syncing "twin views" — daily, plan, and Dashboard read the same source.
- `📅 Today`: normally Templater already populated it at creation. Touch only if empty (note that
    didn't go through Templater) → fill from `Agenda.md` (today's appointments). Idempotent: if full, leave it.
- Short confirmation: what you carried forward + what's in the agenda today.
- Posthumous close (AFTER the confirmation, silently — the user writes meanwhile):
    if the previous daily has written "Notes of the day" but an empty `## Themes`
    → run steps 2–4 of the End-of-day close on that note
      (People traces, project Logs, Themes — only the mechanical part, derivable from the text).
    High/low and End of day stay as they were: without the user's words, don't fill them.
    No separate report: at most one line at the end of the confirmation ("also closed yesterday: 2 traces, 1 log").

NOT (for today's note): TaskCreate · reading Projects/Themes/Senso — except the current
  Weekly Review (it's the plan) · people/themes
  (unless the user asks: "morning routine", "cascade context", "review goals")
  The posthumous close of yesterday is the planned exception: there People/Projects/Themes are touched.

## End-of-day close

Trigger: "close the day" / "end of day".
Run 1→4 in order. Idempotent: don't duplicate or overwrite. High threshold: only meaningful items.

source := today's note (Notes of the day + Open questions + the rest)
          if empty → the conversation.   # the note takes priority

1. fill from `source` (the user's words, no inventions · voice: first person "I"):
     ⬆️⬇️ High and low · What went well · What I'd improve · What I learned

2. people := who has a meaningful passage in `source`   # not a passing mention
   for each p in people:
     - epithets and nicknames (e.g. "the neighbor") → resolve them via the `aliases` in the
       frontmatter of the `People/` files. If an epithet recurs and isn't an alias yet, propose adding it.
     - if `People/{p}.md` is missing → create it (see FORMAT)
     - link `[[People/{p}|{epithet or name used}]]` ONLY at the 1st mention in the body; the rest = text
     - append a line at the end of {p}'s `## Traces`, in second person ("you"):
         **YYYY-MM-DD** — <faithful to their account> [[Daily Notes/YYYY-MM-DD]]

3. projects := `Projects/` projects with real progress in `source`   # a decision, deliverable, concrete step — not a thought
   for each g in projects:
     - link `[[Projects/{g}|{g}]]` ONLY at the 1st mention in the body; the rest = text
     - append a line at the end of `Projects/{g}.md`'s `## Log`, in second person ("you"):
         **YYYY-MM-DD** — <faithful to their account> [[Daily Notes/YYYY-MM-DD]]
     - if the progress completes a task in {g}'s `## Next actions` → check it (✅ YYYY-MM-DD);
       if a new action emerges → add it there (the source is the project, not the daily)

4. `## Themes` (daily) := wiki-links to `Themes/` for the recurring longitudinal patterns that emerged
                        only `Themes/`, never single people/events · frontmatter stays [daily-note]

Ideas: if a new seed worth keeping emerges, do NOT create it automatically — propose it to the user,
      create `Ideas/{Name}.md` only if they confirm.

FORMAT profile (creating a missing file): frontmatter `tags:[person]`, `relations:[]`,
                 `themes:[]` · `# Name` · empty sections `## Recurring threads` and `## Traces`
