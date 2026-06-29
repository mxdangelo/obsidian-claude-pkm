---
name: agenda
description: Manages Agenda.md — the vault's source of truth for appointments and deadlines. Auto-invoked when the user mentions appointments, commitments, deadlines, the calendar, or when /daily needs to populate "📅 Today". Auto-archives past rows.
allowed-tools: Read, Write, Edit, Glob, Bash
user-invocable: true
---

# Agenda

`Agenda.md` in the vault root is the source of truth for appointments and deadlines. Expected
structure:

```markdown
---
date: YYYY-MM-DD
tags: [agenda]
---
# Agenda

## Upcoming
| Day | Time | Commitment | Notes |   ← 7-day window, GENERATED (see Behavior 0)

## [Month] YYYY

| Day    | Time  | Commitment | Notes |
|--------|-------|------------|-------|
| Wed 27 | 18:00 | ...        | ...   |

## Archive
### [Month] YYYY
| ... | ... | ... | ... |
```

The source of truth is the month sections. `## Upcoming` is a derived view: the Dashboard embeds
it via `![[Agenda#Upcoming]]`.

## Behaviors

### 0. Regenerate "Upcoming"

Every time the skill is invoked (always, right after the auto-archive):

1. Filter from the month sections the rows with date ∈ [today, today + 7 days].
2. Rewrite the entire table under `## Upcoming`, in chronological order (within a day: morning, —,
   ascending times, evening).
3. Never add or edit commitments here: you write in the month sections, this section regenerates.

### 1. Auto-archive past rows

Every time the skill is invoked (explicitly or by `/daily`):

1. Read `Agenda.md`.
2. For each row in the month sections (NOT in the Archive), parse the day (e.g. `Wed 26`) + the
   section's month → absolute date.
3. If the date is < `$TODAY`, move the row to `## Archive` → the matching `### [Month] YYYY`. If
   the subsection doesn't exist, create it in reverse chronological order (most recent months on top).
4. Update the frontmatter `date:` to `$TODAY`.

### 2. Pull into the daily's "📅 Today"

When invoked by `/daily` (or when the user asks "what do I have today?"):

1. Read `Agenda.md`.
2. Filter rows with date = `$TODAY` **from the month sections only** (the source of truth), never
   from `## Upcoming`: it's a derived view and the same commitments appear there duplicated.
3. Format:
   ```
   - **HH:MM — Commitment** *(Notes)*
   ```
   Omit `*(Notes)*` if the Notes cell is empty.
4. If there are no rows, show "*Nothing on the calendar.*".

### 3. Add inline ad-hoc

If the user writes things like:
- "dentist tomorrow at 3pm"
- "meeting with X friday morning"
- "I'm leaving on June 12"
- "add to the agenda: ..."

→ Add a row to the correct month section:

1. Determine the absolute date (today + N days, next Friday, etc.).
2. Determine the `## [Month] YYYY` section. If it doesn't exist, create it in chronological order
   (most recent months at the bottom, before the Archive).
3. Insert the row in chronological order within the section.
4. Day format: `[3-letter abbr] [day]` (e.g. `Wed 27`, `Thu 28`, `Fri 5`).
5. If the user doesn't specify a time, leave the Time cell as `—`.

### 4. Show the next days

If the user asks "what do I have this week?" / "upcoming appointments?" / "/agenda show":

1. Read `Agenda.md`.
2. Filter rows with date ∈ [today, today + 7 days].
3. Show as a table or a list grouped by day.

## Notes

- Day abbreviations: `Mon Tue Wed Thu Fri Sat Sun`.
- Month names: `January February March April May June July August September October November December`.
- Don't call `TaskCreate`.
- If Agenda.md doesn't exist, do NOT create it automatically — tell the user and ask.
- Keep the columns aligned: use extra spaces for readability.
