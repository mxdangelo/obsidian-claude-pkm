---
paths: "Projects/**/*.md"
---

# Project Management

Projects are the one place this vault tracks structured work — and even here it stays light.
No progress percentages, no status taxonomy to maintain, no mandatory cadence. A project file
is a working surface, not a report.

## Shape

- One flat file per project: `Projects/<Name>.md`. The filename is the project title, in
  plain text — spaces are fine, no forced PascalCase (e.g. `Learning Spanish.md`).
- Built from `Templates/Project Template.md`.
- Tasks live in `## Next actions` (each with an `[est:: N]` estimate) and `## Backlog`. Goals
  live in `## Goals`, not among the tasks. This is the single source of tasks — the daily and
  the weekly plan are Dataview views over it.

## The `Supports:` field

A project can link to a **Senso** element via `Supports:` in its frontmatter —
`[[Senso/Direzione]]`, `[[Senso/Pratiche]]`, or the current `[[Senso/Mese YYYY-MM]]`. That's
how a project connects to the compass. If a project supports nothing, that's worth noticing
once — it may be drifting, or it may just be standalone. Surface it; don't prescribe. Never
invent an OKR-style parent layer.

## Product fields (optional)

Where there's a user who stays, fill the optional product fields: **For whom / Outcome / How
I'll know / Cycle** (discovery / build / live / iterate). Leave them empty on one-off builds.

## Project vs idea vs theme

A simple test for where something belongs: **a project you build; an idea you hold; a theme
you watch recur.** An idea (`Ideas/`) is a seed not yet opened; when you start acting on it
and it produces, it *becomes* a project. A theme (`Themes/`) is a pattern `/weave` surfaces
across the dailies — you observe it, you don't work it.

## Lifecycle (`/project`)

- **new** — scaffold `Projects/<Name>.md` from the template, optionally link a Senso element,
  name the first next action.
- **status** — a plain-prose dashboard of where active projects stand: current focus, next
  actions, what's moved. No scoring, no health metrics.
- **archive** — move the file to `Archives/<Name>.md` and set `status: archived`. Nothing is
  deleted; closed work is kept, just out of the active set.

## The `Personal.md` exception

`Projects/Personal.md` is a **permanent list** (home, body, admin, errands), not a project
with deliverables. It lives in `Projects/` so its tasks enter the views and the week's Budget,
instead of staying invisible time.

## Tone

Keep the project's current state and log honest and in prose. There's no status to perform for
anyone, and no timeline to defend.
