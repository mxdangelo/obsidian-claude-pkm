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

**The inbox is mixed:** some lines are URLs (→ articles), others free text (an idea, a
clipping). Sort:
- **Line starting with `http(s)://`** → it's a source, follow the Procedure below.
- **Free-text line** → not an article: do **not** WebFetch. Report it back to the user and
  propose where to take it (a seed in `Ideas/`, a trace, a task), then let them decide. Don't
  create a `Sources/` note for it.
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

## Voice

`Sources/` is a reference layer, not a journal: describe the source in the third person. The
`## Takeaways` section is the only first-person point, and the user fills it — you leave it ready.
