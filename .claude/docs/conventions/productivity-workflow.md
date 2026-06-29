---
paths: "Senso/**/*.md, Daily Notes/**/*.md"
---

# Productivity Workflow

Conventions for the daily, the weekly review, the month, and task management. A
journaling-first system centered on Senso.

## Senso flow

The foundation and where life happens:

```
Senso/Direzione.md   — who I want to be, where I want to go
Senso/Pratiche.md    — what I cultivate
Senso/Mese YYYY-MM   — the month's intention (Theme + a sentence or two)

Daily Notes/         — the day, where you write and deposit traces
Weekly Review        — the operational plan for the week
/weave               — the cross-cutting thread: re-reads the dailies and braids the patterns
```

The practices are the foundation; the month, the week, and the day are where life happens.
The threads between days are woven by `/weave`, when you run it.

## Daily — the center

The daily note is normally created by Obsidian (Templater) the moment you open it: it
renders the dates, populates `📅 Today` from the Agenda, and the `🔴` is a live Dataview
view over today's `[plan::]` tasks. You can write the day without Claude.

`/daily` steps in for:
- **Morning (optional):** turn yesterday evening's "Tomorrow's priorities" into
  `[plan:: today]` on the right project; surface what's in the Agenda today.
- **Evening close ("close the day"):** fill the closing sections from your words; append a
  dated trace to the relevant `People/`; add a line to each touched project's `## Log`;
  populate `## Themes` with wiki-links.

## Weekly Review

### When: Sunday or Monday · Duration: 20–30 minutes

The operational plan for the coming week — work and commitments, so nothing slips.

1. **One thing only** — if I do nothing else this week, I do: ...
2. **Commitments of the week** — from `Agenda.md`
3. **Open loops** — carried over from the previous review
4. **The plan** — assign each chosen deliverable its day (`[plan::]`) in the project file;
   the plan itself is a Dataview view. Sum the `[est::]` into a **Budget**: demand in hours
   against usable days.
5. **How it went** (at the end of the week)

Reflection — patterns, threads, "where am I going" — lives in `/weave`, not here.

## Month — intention

`Senso/Mese YYYY-MM.md` is where you set the month's Theme and Intention, when you feel like
it. It's not a ritual: one or two sentences on what you want to tend. Projects and the
Weekly Review can link to it.

## Archive

Move to `Archives/`:
- Completed projects
- Dailies older than 30–60 days (optional, but it clears the view)
- Closed Weekly Reviews and Month files from the previous half-year
