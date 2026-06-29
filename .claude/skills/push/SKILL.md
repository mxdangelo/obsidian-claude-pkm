---
name: push
description: Commit and push vault changes to Git with smart commit messages. Auto-stages files, creates meaningful commits, and syncs with remote. Use after making vault changes or at end of day.
allowed-tools: Bash, Read, Glob
model: sonnet
disable-model-invocation: true
user-invocable: true
---

# Push

Save the vault to Git with a meaningful commit message and sync with the remote.

## Usage

```
/push                       # auto-generated message
/push "custom message"      # given message
```

## What it does

1. **Stage** all changes — new, modified, deleted (`git add -A`).
2. **Commit message**: use the one provided, or generate it from the diff — a summary of touched
   files plus a timestamp.
3. **Sync**: `git pull --rebase`, then `git push`.

## Auto-generated commit format

```
Daily 2026-01-15 + 3 project updates
- Added: Daily Notes/2026-01-15.md
- Modified: Projects/Learning Spanish.md
- Modified: Senso/Mese 2026-05.md
```

With a custom message, prefix the timestamp: `[2026-01-15 09:30] Weekly review week 3`.

## Git flow

```bash
git add -A
git commit -m "<message>"
git pull --rebase origin <branch>
git push origin <branch>
```

Use the vault's current branch (`git rev-parse --abbrev-ref HEAD`). Before pushing, verify: the
git repo exists, there are changes to commit, and the `origin` remote is configured. If `origin`
is missing, stop and tell the user — don't invent a URL.

## Conflicts

1. Attempt the rebase. For notes, favor the local version on trivial conflicts.
2. If manual resolution is needed, guide the user through it.
3. Never `--force` without an explicit request.

## Security

Never commit credentials, API keys, personal or financial data. Suggested `.gitignore`:

```
private/
credentials.md
.env
.obsidian/workspace*
.obsidian/cache
.trash/
.DS_Store
```

## Troubleshooting

- **Push rejected** → `git pull --rebase origin <branch>`, then `git push origin <branch>`.
- **Not a git repo** → `git init`, then `git remote add origin <URL>`.
- **Large files** (images, attachments) → consider Git LFS.

## Integration

Committing happens **once per session** in `session-init.sh` (a snapshot of the previous session's
changes at startup) — there is no per-save auto-commit. `/push` is the explicit, curated commit
plus the remote sync; run it after `/daily` or `/weekly` when you want to save and push now.
