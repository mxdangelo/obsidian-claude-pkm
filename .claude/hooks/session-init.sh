#!/bin/bash
# Session initialization hook for the Obsidian PKM vault (Senso-aware)

if [ -z "$VAULT_PATH" ] || [ "$VAULT_PATH" = '${cwd}' ]; then
      export VAULT_PATH="$(pwd)"
fi
export TODAY=$(date +%Y-%m-%d)
export YESTERDAY=$(date -v-1d +%Y-%m-%d 2>/dev/null || date -d "yesterday" +%Y-%m-%d)
export CURRENT_WEEK=$(date +%Y-W%V)
export DAILY_NOTE="$VAULT_PATH/${DAILY_NOTES_DIR:-Daily Notes}/$TODAY.md"

# Verify vault structure
if [ ! -f "$VAULT_PATH/CLAUDE.md" ]; then
    echo "Note: Not in a vault root directory (no CLAUDE.md found)"
fi

echo "PKM Session initialized"
echo "  Vault: $VAULT_PATH"
echo "  Today: $TODAY"

# Surface the ONE Big Thing from the most recent Weekly Review
SENSO_DIR_PATH="$VAULT_PATH/${SENSO_DIR:-Senso}"
WEEKLY_REVIEW=$(ls -1 "$SENSO_DIR_PATH"/Weekly\ Review\ *.md 2>/dev/null | sort | tail -1)

if [ -n "$WEEKLY_REVIEW" ] && [ -f "$WEEKLY_REVIEW" ]; then
    # Extract the "One thing only" / "Una cosa sola" section content
    ONE_BIG_THING=$(awk '/^## .* [Oo]ne thing only|^## .* [Uu]na cosa sola/{flag=1; next} /^## /{flag=0} flag && /^\*\*/{gsub(/^\*\*[^:]*:\*\* */, ""); print; exit}' "$WEEKLY_REVIEW")
    if [ -n "$ONE_BIG_THING" ]; then
        echo "  ONE Big Thing: $ONE_BIG_THING"
    fi

    # Days since the last Weekly Review (from frontmatter)
    LAST_REVIEW_DATE=$(grep -m1 -oE '^date: [0-9]{4}-[0-9]{2}-[0-9]{2}' "$WEEKLY_REVIEW" | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}')
    if [ -n "$LAST_REVIEW_DATE" ]; then
        if date -j -f "%Y-%m-%d" "$LAST_REVIEW_DATE" +%s >/dev/null 2>&1; then
            LAST_EPOCH=$(date -j -f "%Y-%m-%d" "$LAST_REVIEW_DATE" +%s 2>/dev/null)
        else
            LAST_EPOCH=$(date -d "$LAST_REVIEW_DATE" +%s 2>/dev/null)
        fi
        NOW_EPOCH=$(date +%s)
        if [ -n "$LAST_EPOCH" ]; then
            DAYS_SINCE=$(( (NOW_EPOCH - LAST_EPOCH) / 86400 ))
            echo "  Last weekly review: $DAYS_SINCE days ago"
        fi
    fi
fi

# Active project count
PROJECTS_DIR_PATH="$VAULT_PATH/${PROJECTS_DIR:-Projects}"
if [ -d "$PROJECTS_DIR_PATH" ]; then
    PROJECT_COUNT=$(find "$PROJECTS_DIR_PATH" -maxdepth 1 -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
    if [ "$PROJECT_COUNT" -gt 0 ]; then
        echo "  Active projects: $PROJECT_COUNT"
    fi
fi

# Normalize person-name capitalization in the dailies:
# capitalize the first letter of the alias in [[People/...|name]] wiki-links,
# e.g. [[People/Alex Rivera|alex]] -> [[People/Alex Rivera|Alex]]. Idempotent.
if command -v perl >/dev/null 2>&1; then
    find "$VAULT_PATH/${DAILY_NOTES_DIR:-Daily Notes}" -name '*.md' -type f \
        -exec perl -CSD -i -pe 's{\[\[People/([^|\]]+)\|([^|\]]+)\]\]}{ "[[People/$1|" . (lc$1 eq lc$2 ? $1 : $2) . "]]" }ge' {} + 2>/dev/null
fi

# Single commit at startup: snapshots the previous session's changes.
# (Replaces a per-save commit, which made history unreadable.)
if [ -d "$VAULT_PATH/.git" ]; then
    cd "$VAULT_PATH" || exit 0
    if ! git diff --quiet || ! git diff --staged --quiet || [ -n "$(git ls-files --others --exclude-standard)" ]; then
        git add -A
        git commit -m "Session snapshot - $(date +'%Y-%m-%d %H:%M')" --quiet 2>/dev/null \
            && echo "  Git: committed previous session's changes"
    fi
fi
