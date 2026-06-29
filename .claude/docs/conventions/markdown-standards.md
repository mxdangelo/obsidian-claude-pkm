---
paths: "**/*.md"
---

# Markdown Standards for the Vault

These conventions apply to all markdown files in the vault.

## File Naming

- **Daily notes:** `YYYY-MM-DD.md` (e.g., `2026-01-15.md`)
- **Projects:** one flat file per project, plain title — spaces are fine (e.g., `Learning Spanish.md`)
- **General notes:** Title Case or plain title (e.g., `Some Theme.md`)
- **Templates:** Title Case with space (e.g., `Daily Template.md`)

## Heading Structure

- H1 (`#`) for the note title only — one per file
- H2 (`##`) for major sections
- H3 (`###`) for subsections
- Never skip heading levels (no H1 → H3)

## Links

### Internal Links (Wiki-style)
```markdown
[[Note Name]]                    # Link to note
[[Note Name|Display Text]]       # Link with alias
[[Note Name#Section]]            # Link to heading
[[Folder/Note Name]]             # Link with path
```

### External Links
```markdown
[Display Text](https://url.com)
```

## Tags

Tags stay minimal and structural — they mark the *kind* of note, not a taxonomy to
maintain. The note type goes in the frontmatter:

```
[daily-note]   [project]   [weekly-review]   [senso, mese]
[source]       [idea]      [theme, theme/name]   [person]
```

Themes are surfaced as wiki-links in the daily's `## Themes` section
(`[[Themes/Some Theme]]`), not as frontmatter tags — they are the hubs of the graph view.

## Inline fields (Dataview)

Tasks carry inline fields the plan and daily views read:

```markdown
- [ ] A deliverable [est:: 2] [plan:: 2026-06-15]
```

- `[est:: N]` — estimate in hours. The weekly plan sums these into the Budget.
- `[plan:: YYYY-MM-DD]` — the day the task enters the plan. Assigned by the Weekly Review.

## Task Format

```markdown
- [ ] Incomplete task
- [x] Completed task ✅ 2026-01-20
- [ ] ⏳ Blocked task — waiting on X
```

## YAML Frontmatter

All notes should include frontmatter:
```yaml
---
date: YYYY-MM-DD
tags: [relevant, tags]
status: active|completed|archived
---
```

## Text Formatting

- **Bold** for emphasis and key terms
- *Italic* for subtle emphasis
- `Code` for commands, paths, technical terms
- > Blockquotes for important callouts

## Lists

- Use `-` for unordered lists
- Use `1.` for ordered lists
- Indent with 2 spaces for nested items

## Best Practices

1. One idea per paragraph
2. Use blank lines between sections
3. Prose, not bullets, for reflective writing — bullets only for what is natively a list (tasks, appointments)
4. Include links to related notes
5. Add meaningful frontmatter
