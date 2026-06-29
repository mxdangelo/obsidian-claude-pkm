---
name: project
description: Create, track, or archive projects. Each project is a flat file Projects/<Name>.md.
allowed-tools: Read, Write, Edit, Glob, Grep, Bash
user-invocable: true
---

# Project

A project's lifecycle: creation, status dashboard, archiving.

A project = one flat file `Projects/<Name>.md` (e.g. `Projects/Learning Spanish.md`,
`Projects/Client Website.md`). The filename is the project title, in plain text (no forced
PascalCase: spaces are fine).

## Subcommands

### `/project new` (default if no argument)

1. Ask: project name, one-line description, optional `Supports:` toward Senso (Direzione /
   Pratiche / Mese).
2. Ask the product fields, **only if there's a user who stays** (otherwise leave them empty):
   **For whom**, **Outcome**, **How I'll know**, **Cycle** (discovery / build / live / iterate).
3. **Read** `Templates/Project Template.md`.
4. Replace the placeholders and **Write** `Projects/<Name>.md`.
5. Confirm with the path.

### `/project status`

1. **Glob** `Projects/*.md`.
2. **Read** each file, extract: name, `status` (active/paused/done), next action, date of the
   last update (Log).
3. Print a dashboard:
```
| Project | Status | Next action | Last update |
|---------|--------|-------------|-------------|
```
4. Flag stalled projects (>14 days without an update) and orphans (no `Supports:`).

### `/project archive <Name>`

1. Verify `Projects/<Name>.md` exists.
2. Ask for confirmation.
3. Set `status: archived` in the frontmatter.
4. Move `Projects/<Name>.md` → `Archives/<Name>.md` (create `Archives/` if missing).

## Notes

- Don't call `TaskCreate`.
- The `Supports:` field can link any element of `Senso/`.
- The product fields are optional: fill them where there's a user and a measurable outcome,
  leave them empty on one-off builds.
