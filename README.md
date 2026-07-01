# obsidian-claude-pkm

A journaling-first personal knowledge management (PKM) system for **Obsidian**, driven by
**Claude Code**. The daily note is the core; the system acts as an *outside eye* that re-reads
your life over time and gives back the threads, tensions, and ideas you can't see from the
inside.

This repo is the **neutral skeleton** — structure, skills, hooks, templates, and a handful of
fictional example notes so you can see it working. No personal content. Fork it and make it yours.

> **One Italian word is kept on purpose: _Senso_** — "meaning / direction / sense." It names the
> backbone subsystem (`Senso/`, with `Direzione.md`, `Pratiche.md`, and the monthly `Mese` note).
> Everything else is in English.

## What it depends on

- **[Claude Code](https://claude.com/claude-code)** — the engine. The skills, hooks, and
  `CLAUDE.md` are Claude Code mechanisms. This is **not** AI-agnostic.
- **[Obsidian](https://obsidian.md)** with two community plugins:
  - **Dataview** — the daily's task list and the weekly plan are live queries, not copied lists.
  - **Templater** — creates the daily note and renders its dates automatically.

You can use the vault without the plugins, but you lose the live views and auto-created dailies.

## How it works

Two mirrored cycles:

```
Life side:       Daily Notes  →  /weekly  →  /weave   →  Themes/ + People/
Knowledge side:  Inbox        →  /capture →  Sources/ → Ideas / Themes
```

- **Senso** is the compass: `Direzione` (who you want to be), `Pratiche` (what you cultivate),
  `Mese` (the month's intention), and the **Weekly Review** (the operational plan).
- **The daily note** is where life happens. You write it **by hand** — Obsidian creates it,
  Claude isn't needed day to day. Distillation is periodic, not daily.
- **`/weekly`** (Sunday) is chronicle + planning: it reads the 7 dailies, appends dated traces to
  `People/`, reviews the project checkboxes, fills the closing sections, then plans the week ahead.
  It records the observable — what you did, who you saw.
- **Tasks have one source: the project file.** The daily and the weekly plan are Dataview *views*
  over the `[plan::]` / `[est::]` fields on project tasks — the checkbox lives only in the project.
- **`/weave`** (every ~2 weeks) reads across the dailies and braids recurring patterns into
  `Themes/` and `People/`. It reads the layer underneath — what you feel, what you don't say —
  and reflection lives there, not in the weekly.

## Directory structure

| Folder | Purpose |
|--------|---------|
| `Daily Notes/` | Daily journal (`YYYY-MM-DD.md`) |
| `Senso/` | Direzione, Pratiche, Mese, Weekly Review |
| `Projects/` | One flat file per project — the single source of tasks |
| `Inbox/` | Raw capture for the knowledge side |
| `Sources/` | Literature notes (one per article/book) |
| `Ideas/` | Seeds not yet activated |
| `Themes/` | Longitudinal patterns — `Weave-Log.md` + one file per theme |
| `People/` | Profiles of people you interact with |
| `Media/` | Books, films, series |
| `Templates/` | Reusable note structures |
| `Archives/` | Completed or inactive notes |
| `.claude/` | System internals — skills, agents, hooks, conventions |

## Skills

Invoke with `/name` in Claude Code:

| Skill | What it does |
|-------|--------------|
| `/daily` | Fallback only — create today's note without Obsidian; normally you write the daily by hand |
| `/weekly` | Sunday review — chronicle (reads the 7 dailies: traces, checkboxes, closing sections) + planning |
| `/weave` | Longitudinal pattern analysis across the dailies (every ~2 weeks) |
| `/project` | Create, status-check, or archive projects |
| `/capture` | Process the Inbox — URLs become `Sources/` notes |
| `/agenda` | Manage `Agenda.md` (appointments, deadlines) |
| `/search` | Keyword search grouped by directory |
| `/check-links` | Find broken wiki-links |
| `/push` | Commit and push the vault to Git |
| `senso-tracking` | Mirror: is the declared being lived? (auto) |
| `obsidian-vault-ops` | Baseline file/link operations (auto) |

There's also a **Push** output style (`.claude/output-styles/`) for when you want a nudge toward
action instead of the reflective mirror.

## Getting started

1. Clone into your Obsidian vaults folder and open it as a vault in Obsidian.
2. Install the **Dataview** and **Templater** community plugins. Point Templater's folder template
   at `Daily Notes/` using `Templates/Daily Template.md`.
3. Open the vault in Claude Code. The `SessionStart` hook sets up date variables and greets you
   with the current week's ONE Big Thing.
4. Make the example notes yours — edit `Senso/Direzione.md` and `Senso/Pratiche.md` first, then
   delete the fictional dailies, project, person, and theme.
5. `git init` is already done here if you cloned; otherwise initialize and add your own remote.

## Minimal setup (just journaling)

You don't need the whole thing. For a pure journaling practice, keep the core and delete the rest:

**Keep:**
- `Daily Notes/`, `Senso/`, `Templates/`, `Agenda.md`
- `.claude/` with the `/daily`, `/weekly`, `/agenda`, `/search`, `/check-links` skills and the two hooks

**Delete if you don't want them:**
- `Projects/` + `/project` and the Dataview task views — if you don't track structured work
  (the daily's `🔴` block just shows nothing)
- `Themes/`, `People/` + `/weave` and `senso-tracking` — the reflective layer
- `Inbox/`, `Sources/`, `Ideas/` + `/capture` — the knowledge side
- `Media/`, `Archives/`, `Attachments/` — optional folders

The core needs Templater (auto-created dailies); Dataview only matters once you add `Projects/`.
Grow back into the rest when you want it — the pieces are independent.

## A note on privacy

The personal vault this was derived from has no remote and is never pushed. If you publish your
own, keep `CLAUDE.local.md` (private overrides) gitignored — it already is. Never commit
credentials or private data; the `.gitignore` covers the usual cases.

## License

[MIT](LICENSE). The structure and skills are offered as a starting point — adapt freely.
