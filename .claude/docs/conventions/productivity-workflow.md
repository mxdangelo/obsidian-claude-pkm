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

## Daily — by hand

The daily note is created by Obsidian (Templater) the moment you open it: it renders the
dates, populates `📅 Today` from the Agenda, and the `🔴` is a live Dataview view over
today's `[plan::]` tasks. You write it by hand, without Claude, for days.

`/daily` is only a fallback for sessions without Obsidian: it creates the note by replicating
Templater and does a minimal augment (render the tokens, populate `📅 Today` if empty). No
evening close: distillation is periodic, done by `/weekly` on Sunday.

## Weekly Review — chronicle + planning

### When: Sunday · Duration: 30–40 minutes

Two beats. **Chronicle** of the closing week: read the 7 dailies, do a light typographic pass
on each (capitalization, typos, paragraphs — never the words), append dated traces to
`People/`, review the project checkboxes (only `✅ YYYY-MM-DD`, no line in `## Log`), fill the
closing sections (High/low of the week, went-well/improve/learned, People touched). Themes are
not touched here: that's interpretive work for `/weave`. **Planning** of the opening week:

1. **One thing only** — if I do nothing else this week, I do: ...
2. **Commitments of the week** — from `Agenda.md`
3. **Open loops** — carried over from the previous review
4. **The plan** — assign each chosen deliverable its day (`[plan::]`) in the project file;
   the plan itself is a Dataview view. Sum the `[est::]` into a **Budget**: demand in hours
   against usable days.

A task left unchecked relocates by changing `[plan::]` (a decision, not a transfer).
Reflection — what you feel, the threads, "where am I going" — lives in `/weave`, not here:
here you record the chronicle and you plan.

## Month — intention

`Senso/Mese YYYY-MM.md` is where you set the month's Theme and Intention, when you feel like
it. It's not a ritual: one or two sentences on what you want to tend. Projects and the
Weekly Review can link to it.

## Archive

Move to `Archives/`:
- Completed projects
- Dailies older than 30–60 days (optional, but it clears the view)
- Closed Weekly Reviews and Month files from the previous half-year
