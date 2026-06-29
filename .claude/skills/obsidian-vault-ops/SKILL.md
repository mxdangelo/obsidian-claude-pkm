---
name: obsidian-vault-ops
description: Read and write Obsidian vault files, manage wiki-links, process markdown with YAML frontmatter. Use when working with vault file operations, creating notes, or managing links.
allowed-tools: Read, Write, Edit, Glob, Grep
model: sonnet
---

# Obsidian Vault Operations

Baseline operations for reading, writing, and linking files in the vault. Format and tag
conventions live in `.claude/docs/conventions/markdown-standards.md` — that is the source of
truth, so follow it rather than restating it here.

## Vault structure

```
vault-root/
├── CLAUDE.md           # Main context — read first
├── Daily Notes/        # YYYY-MM-DD.md
├── Senso/              # Direzione, Pratiche, Mese, Weekly Review
├── Projects/           # One flat file per project: <Name>.md
├── Sources/            # Literature notes
├── Ideas/              # Idea seeds
├── Themes/             # Weave-Log and theme files
├── People/             # People profiles
├── Templates/          # Reusable note structures
└── Archives/           # Completed/inactive content
```

## Reading

- Find files with Glob (`*.md`, `Daily Notes/*.md`).
- Read `CLAUDE.md` first for vault context.
- Follow wiki-links to related notes when relevant.

## Creating

1. Check the note doesn't already exist.
2. Use the matching template from `Templates/` if one fits.
3. Add frontmatter (`date`, `tags`, `status`) per markdown-standards.
4. Link to related notes.

## Editing

- Preserve existing frontmatter and wiki-links.
- Keep one H1 and don't skip heading levels.

## Wiki-link format

```markdown
[[Note Name]]                 # simple link
[[Note Name|Display Text]]    # alias
[[Note Name#Section]]         # link to a heading
```

## Template variables

```
{{date}}         today (YYYY-MM-DD)
{{date:format}}  formatted date
{{date-1}}       yesterday
{{date+1}}       tomorrow
{{time}}         current time
```

## Daily note creation

For the carry-over and template logic, use the `/daily` skill — don't reimplement it here.
