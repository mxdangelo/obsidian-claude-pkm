# Changelog

All notable changes to this system are documented here.

## 4.1 — 2026-07-01 — Smarter capture, atomic notes

Two refinements to the knowledge side.

### Capture triage

`/capture` no longer treats every URL as a literature note. It classifies each inbox line into
one of four types and **acts when obvious, asks when not**:

- a **source with a thesis** → a `Sources/` note (as before);
- a **reference page** (a tool's homepage, a dashboard, docs) → a line in `Useful Links.md`,
  instead of a `Sources/` note with a `## Takeaways` that never gets filled;
- an **idea** → a seed proposed for `Ideas/`;
- a **commitment** → a line proposed for `Agenda.md` or a project task.

The longitudinal judgment stays the user's; Claude proposes and files only the low-stakes,
obvious cases. The `Inbox` framing is de-emphasized from URLs — free text is a first-class item.
Free text splits further: a reflection on an offline source (a book you've read) becomes a
`Sources/` note, while a thought of your own becomes an atomic `Ideas/` note.

### Atomic notes and books

`Ideas/` now holds not just seeds but **concepts distilled from sources** — one idea per note,
in your words. A new **Graduation** step in `/capture` extracts a standalone concept from a
source's `## Takeaways` into its own atomic note, on request. And a **book** worth keeping is a
source like an article: it gets a literature note in `Sources/`, while `Media/` is the catalog
of what you read.

### New

- `Useful Links.md` at the root — practical bookmarks to find again, not sources to distill.

## 4.0 — 2026-07-01 — Manual daily, weekly distillation

A major redesign of the life-side rhythm. The daily note no longer needs Claude: you write
it by hand. The distillation that used to happen at the daily's evening close is centralized
into the Sunday weekly review, and the reflective layer is sharpened and moved to a strict
2-week cadence.

### Why

The evening close ran through Claude and had quietly created an obligation: to be on Claude
every day. That isn't needed. Obsidian creates the daily, writing is free and needs no AI,
and the longitudinal value is periodic, not daily. Centralizing distillation once a week also
costs far fewer tokens (every invocation reloads `CLAUDE.md` and the files it reads). Three
layers, each reading the one below: **daily** (raw, by hand) → **weekly** (chronicle) →
**weave** (reflection).

### The three layers now

- **`/daily` — fallback only.** Obsidian creates the note (Templater renders the dates,
  populates `📅 Today` from the Agenda; the `🔴` is a live Dataview view). You write it by
  hand. `/daily` only steps in to create the note in sessions without Obsidian. No evening
  close.
- **`/weekly` — chronicle + planning (Sunday).** Reads the 7 dailies of the closing week and
  absorbs the old daily close: a light typographic pass on each daily, dated traces appended
  to `People/`, project checkbox review, and the closing sections (High/low of the week,
  went-well/improve/learned, People touched). Then it plans the opening week as before. It
  records the **observable** — what you say, do, who you see.
- **`/weave` — longitudinal reflection (every ~2 weeks).** Reads the raw dailies (your words,
  with real quotes) across the weeks and distills the patterns into `Themes/` and `People/`.
  It reads the **layer underneath** — what you feel, what you don't say, what you avoid — on a
  register distinct from the weekly. Always runs after a weekly, on closed weeks, so its window
  sits on already-chronicled days.

### Breaking changes

- **Daily template stripped.** Removed: Morning/Afternoon/Evening subdivision, Open questions,
  High/low, End of day, Themes. Kept: free writing block, `📅 Today`, the `🔴` view, Related,
  footer. Existing dailies are unaffected; the change is to the template for new notes.
- **Evening close removed** from `/daily`. Its work moved into `/weekly`.
- **Project `## Log` narrative lines discontinued.** Project progress is now recorded as
  checkboxes only (`✅ YYYY-MM-DD` in `## Next actions`), reviewed by `/weekly`. Historical
  logs are left in place.
- **Themes are `/weave`'s job only.** The daily and the weekly no longer tag themes; naming a
  recurring pattern is interpretive, longitudinal work. The `Themes/` files are the graph hubs.

### Changed

- Daily and Weekly Review templates.
- Skills: `daily`, `weekly`, `weave`.
- `CLAUDE.md` and the conventions (`markdown-standards`, `productivity-workflow`,
  `task-tracking`).
- README and the fictional example daily / weekly, to show the new system.
