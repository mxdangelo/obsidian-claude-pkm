---
name: senso-tracking
description: Coherence mirror between Senso and lived life. Use when the user wants to check whether their Direzione and Pratiche match what they actually write and do — "am I following my practices?", "am I aligned with my Direzione?", declared vs alive, gaps, recurring loops.
allowed-tools: Read, Glob, Grep
---

# Senso Tracking

Triangulates the three layers of the system: **declared** (`Direzione`, `Pratiche`, `Mese`, the
weekly ONE Big Things), **lived** (the daily notes), and **emerged** (the patterns `/weave` has
distilled into `Themes/Weave-Log.md`). Surfaces alignment and gaps in both directions: is the
declared being lived, and is the emerged being declared? **It's not a tracker, it's a mirror.**

## Steps

1. **Read** `Senso/Direzione.md`. Extract main themes (who I want to be, where I want to go).
2. **Read** `Senso/Pratiche.md`. Extract the practices (1–2 word names) and their intended frequency.
3. **Glob** `Senso/Mese *.md`. **Read** the current month's intention and the previous one —
   including the `Open loops` and `How it went` sections.
4. **Glob** `Senso/Weekly Review *.md`. **Read** the last 2–3. These are **operational**
   documents (planning, not reflection): extract the ONE Big Thing, the open loops, the critical
   deadlines. Don't expect reflective content there.
5. **Read** `Themes/Weave-Log.md` — the last 2 entries (≈ one month of distilled patterns) plus
   the frontmatter. If `last_weave` is more than 14 days old, note it in the report: the
   reflective layer is stale.
6. **Glob** `Daily Notes/*.md`. **Read** the most recent ~14 dailies.
7. **Analyze**:
   - **Pratiche**: for each practice, how many times is it mentioned/referenced in the recent
     dailies? Implicit frequency vs declared.
   - **Direzione ↔ lived**: do the Direzione themes recur in daily writing? Or are they declared
     but absent?
   - **Direzione ↔ emerged**: cross the Direzione themes with the weave patterns, in both directions —
     - patterns that *embody* a Direzione theme (convergence: name both);
     - Direzione themes no pattern touches (declared but not emerging);
     - patterns alive in the weave with no anchor in Direzione or Pratiche — **life is ahead of the
       page**. Surface them as candidates for updating Direzione/Pratiche; the decision belongs to the user.
   - **ONE Big Things**: are the last 2–3 aligned with Direzione? And were they *lived* — is there
     evidence in the dailies that the commitment happened?
   - **Open loops**: loops recurring across reviews and the Mese file — are they connected to
     Direzione, or are they "noise"?
8. **Output** a report:

```markdown
## Senso Tracking — <today's date>

### Direzione: alive vs declared
- "<theme 1>": appears in N of the last 14 dailies. **Alive.**
- "<theme 2>": declared but missing. **Gap.**

### Direzione ↔ Emerged (weave)
- "<weave pattern>" embodies "<Direzione theme>". **Convergence.**
- "<Direzione theme>": no pattern has touched it for N weaves. **Declared, not emerged.**
- "<weave pattern>": alive for N weeks, with no anchor in Direzione or Pratiche. **Life is ahead of the page.**

### Pratiche: cultivated vs intended
| Practice | Intended | Last 14 days | Status |
|----------|----------|--------------|--------|
| ...      | ...      | N times      | Alive / Sparse / Absent |

### ONE Big Thing: declared vs lived
- W<n> "<one thing>": aligned with "<theme>"; lived / stayed on the page (evidence).

### Recurring open loops
- "<loop>": present in N reviews. Not connected to Direzione.

### Note
[1–2 lines of synthesis: where is the system reflecting Senso, where is it drifting? If patterns
emerged without anchor, name them here as possible updates to Direzione/Pratiche — descriptively,
no prescription.]
```

## Division of labor with /weave

`/weave` derives patterns bottom-up from the dailies; senso-tracking does **not** re-derive them.
For the reflective layer, use the patterns the weave has already named — cite them by name and
quote them. The dailies serve mainly for the Pratiche frequency counts and for what happened
*after* the last weave.

## Tone

- It's a mirror, not a judgment. Descriptive, not prescriptive.
- If a practice has been "Absent" for 14+ days, don't suggest "do it more" — just surface the gap.
  Decisions belong to the user.
- Don't call `TaskCreate`.
- Respect the user's writing language.
- **Second person ("you")** — this is the reflective layer, same voice convention as Themes/,
  People/ and the Weave-Log: speak to the user ("you see", "you declare", "you notice"), never about them.
