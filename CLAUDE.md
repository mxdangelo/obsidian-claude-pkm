# CLAUDE.md

A personal Obsidian vault wired to Claude Code. A journaling-first PKM system: the
daily note is the core, and the system acts as an **outside eye** that re-reads your
life over time and gives back the threads, tensions, and ideas you can't see from
the inside.

> One Italian word is kept on purpose: **Senso** — "meaning / direction / sense". It
> names the backbone subsystem (`Senso/`, `Direzione.md`, `Pratiche.md`, the monthly
> `Mese` note). Everything else is in English. Glosses below.

## Directory structure

| Folder | Purpose |
|--------|---------|
| `Daily Notes/` | Daily journal (`YYYY-MM-DD.md`) |
| `Senso/` | The compass of living — `Direzione.md` (Direction), `Pratiche.md` (Practices), `Mese YYYY-MM.md` (Month), `Weekly Review YYYY-Wxx.md` |
| `Projects/` | Projects with an active front — one `.md` file per project |
| `Inbox/` | Front door of the knowledge side — raw, temporary capture (`inbox.md`), emptied by processing |
| `Sources/` | Literature notes — one note per article/source worth keeping |
| `Ideas/` | Seeds not yet activated — possibilities held in waiting |
| `Themes/` | Longitudinal patterns — `Weave-Log.md` + one file per theme |
| `People/` | Profiles of the people you interact with |
| `Media/` | Books, films, series |
| `Attachments/` | Attachments — PDFs, images |
| `Templates/` | Reusable note structures |
| `Archives/` | Completed or inactive notes |
| `.claude/` | System internals — skills, agents, hooks |

At the root, besides `Agenda.md`: `Dashboard.md` — a Dataview cockpit (agenda, active
projects, open tasks), consulted in Obsidian, not edited via Claude.

## Senso (the backbone)

`Direzione` and `Pratiche` are the foundation; `Mese`, the Weekly Review, and the Daily
Notes are where life happens.

```
Senso/Direzione.md              — who I want to be, where I want to go
Senso/Pratiche.md               — what I choose to cultivate regularly
Senso/Mese YYYY-MM.md           — the current month's intention
Senso/Weekly Review YYYY-Wxx.md — the operational plan for the week
Daily Notes/YYYY-MM-DD.md       — the day
```

The daily note is created by Obsidian (Templater, a folder template on `Daily Notes/`):
it renders the dates; the `🔴` is a **live Dataview view** over today's `[plan::]` tasks
in the projects. Claude isn't needed to create it — `/daily` steps in to enrich it during
the day and for the evening close; it only creates the note itself as a fallback in
sessions without Obsidian.

The threads between days are woven by `/weave`: it re-reads the dailies and braids the
patterns into `Themes/` and `People/`. Run it by hand, whenever you want. Reflection
lives there, not in the Weekly Review.

### Projects vs ideas

A **project** has an active front: you're working on it now, it has deliverables, tasks,
a log. An **idea** is a seed not yet opened: a possibility you hold in waiting. When you
start working on it and it begins to produce, the idea *becomes* a project.

The line vs a theme: a project you build; a theme you watch recur.

Exception: `Projects/Personal.md` is a **permanent list** (home, body, admin, errands),
not a project with deliverables — it lives in `Projects/` so its tasks enter the views
and the week's Budget, instead of staying invisible time.

## Knowledge side (Inbox → Sources)

Mirror of Senso: where the life side captures in the dailies and distills with `/weave`,
the knowledge side captures in the `Inbox` and distills into `Sources/`.

```
Inbox/inbox.md      — raw capture: one URL per line, clippings, quick notes
Sources/[Title].md  — literature note: a synthesis of the source + your own words in "Takeaways"
```

`Inbox/inbox.md` can be fed however you like — typed directly, or via a clipboard helper
from your phone (a `capture-clip` script, gitignored, kept machine-local). Then `/capture`
reads the inbox (or URLs pasted into the session): for URLs it fetches the article and
creates a note in `Sources/`, leaving `## Takeaways` for you; plain-text lines it routes by
hand. From there ideas graduate into `Ideas/`, patterns into `Themes/`, books into `Media/`.

The line: a **source** is something you've read and want to keep; an **idea** is a seed of
your own; a **theme** is a pattern you watch recur.

## Hooks (automatic, defined in `.claude/settings.json`)

- **SessionStart** (`session-init.sh`) — sets `$VAULT_PATH`, `$TODAY`, `$YESTERDAY`,
  `$CURRENT_WEEK`; surfaces the ONE Big Thing of the current Weekly Review; and makes **a
  single commit** of the previous session's changes (commit once per session, not on every
  save).
- **UserPromptSubmit** (`skill-discovery.sh`, timeout 5s) — prompt → skill routing.

## Permission model

Claude may write in: `Daily Notes/`, `Senso/`, `Projects/`, `Inbox/`, `Sources/`,
`Archives/`, `Templates/`, `Themes/`, `People/`, and `Agenda.md`.

Claude may **not** edit `.claude/**` or `.git/**`. Changes to hooks/settings/skills are made
intentionally, explaining why.

**Git:** local commits when it makes sense, but **no `push` and no opening PRs without an
explicit request** from the user. This holds for remote/cloud sessions too.

## Session tasks vs Markdown tasks

**Session tasks** (`TaskCreate`/`TaskUpdate`) are temporary spinners visible during a Claude
operation — they vanish at the end of the session. The persistent to-do is the **markdown
checkboxes in `Projects/`** (`## Next actions` / `## Backlog`): a single source, rendered by
the daily and the plan via Dataview. Use session tasks only for session work, never to track
real work.

## Conventions

Detailed conventions (markdown standards, task tracking, productivity workflow, project
management) live in `.claude/docs/conventions/`. Consult on demand.
