---
name: capture
description: Process the knowledge-side Inbox. Reads the lines from Inbox/inbox.md or pasted into the session: for URLs it fetches the article and creates a note in Sources/ ready to refine; free text (an idea, a clipping, a quick note) it routes, proposing where to take it. Auto-invoked when the user says "capture", "process the inbox", "save this article", or pastes links or notes to file.
allowed-tools: Read, Write, Edit, Glob, Grep, Bash, WebFetch
user-invocable: true
---

# Capture

The capture arm of the vault's **knowledge side**. It closes the cycle `Inbox` (capture) →
`Sources` (literature note) → `Ideas`/`Themes`/`Projects` (distilled thought), mirroring the
life-side cycle `Daily` → `/weave` → `Themes`/`People`.

## Sources

In priority order:

1. **Lines pasted into the prompt** — if the user pasted links or text, process those.
2. **`Inbox/inbox.md`** — otherwise read the lines under `## To process`, one per line.

If there's nothing in either, say so and stop — don't invent.

**The inbox is mixed.** Classify each line into one of four types, then **act if obvious, ask
if not**. The system's rule holds: Claude does the mechanical work (fetch, synthesize,
propose); the longitudinal judgment — whether an idea is a seed or a theme — stays the user's.

- **URL** → WebFetch it (you read the page anyway), then tell *what* it is:
  - **A source with a thesis** (article, essay, paper, whitepaper) → it's a literature note:
    follow the Procedure below, create it in `Sources/`. Non-destructive, done without asking.
  - **A reference page** (a tool's homepage, a dashboard, documentation — to find again when
    needed, not to distill) → **not** a `Sources/` note: propose a line in `Useful Links.md`.
    Don't leave a `## Takeaways` you'll never fill.
  - Unsure between the two → ask, don't file at random.
- **Free text** → do **not** WebFetch. Recognize it and propose the destination, then let the
  user decide:
  - **A reflection on something you've read/watched** (a book, a film — an offline source:
    nothing to fetch, but worth keeping) → a `Sources/` note, with the line seeding
    `## Takeaways`; add the title to `Media/` if missing.
  - **A thought or seed of your own** (an insight, a distilled concept, even a longitudinal
    one) → an atomic note in `Ideas/`, linked to the relevant theme.
  - **Commitment/deadline** → a line in `Agenda.md`, or a task in a project.
- **Identical repeated URLs** → treat them once (dedup).

## Procedure

For **each** URL:

1. **WebFetch** the URL. Extract: title, source/outlet, publication date (if present), and the content.
   - **PDF:** WebFetch returns only binary. Extract the text from the PDF file WebFetch saved
     locally (it points to the path in the result) with `pdftotext "<path>" -` via Bash, and
     synthesize from there. (`pdftotext` ships with Git Bash.)
2. **Synthesis** — write `## In brief` in 2–3 lines: what the article is really about, not a
   generic preamble. Third person (it describes the source, not the user's voice).
3. **Connections** — search the vault for related notes (`Grep`/`Glob` over `Ideas/`, `Themes/`,
   `People/`, `Sources/`, `Projects/`) and propose 2–4 plausible wiki-links in `## Connections`.
   Only links to notes that exist or that make sense to create; don't force it.
4. **Create the note** in `Sources/<Title>.md` from `Templates/Source Template.md`:
   - `source:` the outlet, `url:` the URL, `date:` today, `status: to-read`.
   - Fill `# Title`, the line `*[Source] · [date]*`, `## In brief`, `## Connections`.
   - **Leave `## Takeaways` empty** (with the italic placeholder): it's the user's voice, first
     person, they write it.
   - Filename: clean, no illegal characters (`/ \ : * ? " < > |`), truncated if very long. If it
     already exists, add a suffix or update instead of duplicating.
5. If the URL is unreachable, flag it and keep it in the inbox (don't delete it).

## After

- If the URLs came from `Inbox/inbox.md`, **remove the processed lines** under `## To process`
  (leave the section empty). Failed URLs stay.
- Summarize for the user: how many notes created, where, and which connection links you proposed
  — so they know what to refine.
- Do **not** log into the Dailies/Projects and do **not** promote anything to Ideas/Themes: the
  graduation is the user's decision.

## Graduation (on request)

A step separate from processing the inbox, and **only on the user's explicit request**
("graduate", "take it into Ideas", pointing at a source). It never happens automatically
during `/capture`: on a fresh inbox `## Takeaways` is empty, and the promotion is the user's
call anyway.

When a source has a `## Takeaways` already written and a concept stands on its own:

1. Extract **one concept per note** into `Ideas/<Concept title>.md` — atomic, self-contained,
   readable without the source.
2. **The user's words.** Reuse their takeaway verbatim where you can; don't paraphrase or
   inflate. The note is theirs, first person.
3. Link back to the source (`[[Sources/...]]`) and look for 1–3 existing concepts/themes to
   connect, each with its *why* line.
4. The source stays where it is: the atomic note sits beside it, doesn't replace it.

A book counts like an article: if it's worth it, it gets its own literature note in
`Sources/`; `Media/` stays the catalog.

## Voice

`Sources/` is a reference layer, not a journal: describe the source in the third person. The
`## Takeaways` section is the only first-person point, and the user fills it — you leave it ready.
