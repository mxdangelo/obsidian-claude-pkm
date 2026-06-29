---
paths: "Daily Notes/**/*.md, Projects/**/*.md, Senso/**/*.md"
---

# Task Tracking

Tasks are intentionally low-ceremony. They live where the work is, not in a separate task
system — and there is exactly **one** source for them.

## The project is the single source

Every project file in `Projects/` holds its own tasks:

- `## Next actions` — atomic, actionable-now deliverables, each with an estimate `[est:: N]`
  in hours.
- `## Backlog` — real actions, deliberately deferred. Not an archive (that's `Archives/`).

Goals live in `## Goals`, not among the tasks. Blocked items stay marked `⏳` and are not
planned until they unblock.

**The checkbox lives only in the project.** The daily and the weekly plan are **Dataview
views** over that source — checking a task in the view or in the project is the same gesture.
No more keeping twin copies in sync, no phantom tasks.

## Planning = assigning a day

Planning (done in the Weekly Review) means giving a deliverable its day, by writing
`[plan:: YYYY-MM-DD]` on the task **in the project file**. The daily's `🔴 To do today` is a
live view of the tasks planned for that day:

```dataview
TASK FROM "Projects"
WHERE plan = this.file.day
SORT est DESC
```

## Relocation, not carry-forward

A task left unchecked at the end of the day does **not** slide into tomorrow on its own.
Re-placing it is a small, deliberate decision — the user's, not the system's: change its
`[plan::]` to the chosen day, or remove it (it returns to the week's Parking lot). The one
thing that *does* flow automatically is the previous evening's "Tomorrow's priorities": that
was an explicit decision, and `/daily` turns it into `[plan:: today]` on the right project.

## Appointments and deadlines

Time-bound things are **not** tasks — they live in `Agenda.md`, managed by `/agenda`. The
daily's `📅 Today` line is populated from there. Keep deadlines out of the task list so it
stays about action, not dates.

## A note on session tasks

The journaling skills deliberately **don't** use Claude's session task tools
(`TaskCreate`/`TaskUpdate`) — these flows are conversational, and a mechanical spinner would
get in the way. Markdown checkboxes are the only task system here; session tasks, if ever
used, are temporary progress indicators for a long operation, never a place real to-dos live.

## Tone

No priority flair, no due-date scoring inside tasks, no streaks. A task is a checkbox with an
estimate. If it matters and is time-bound, it's in the Agenda; if it's just to be done, it's a
checkbox in a project.
