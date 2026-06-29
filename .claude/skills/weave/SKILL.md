---
name: weave
description: Longitudinal analysis of the patterns emerging in the daily notes. Classifies patterns as Evolution, Interweaving, or New, writes to the Weave-Log, and updates the Themes/ files. Run with /weave.
allowed-tools: Read, Write, Edit, Glob, Grep
user-invocable: true
---

# Weave — Pattern Analysis

Longitudinal analysis of the patterns emerging in the daily notes. Run with `/weave` when you
decide — read `last_weave` in the `Weave-Log` to know where to restart from.

## Steps

1. Read `Themes/Weave-Log.md` — previous patterns, `last_weave`, `next_weave`.
2. Read all the dailies in `Daily Notes/` with date > `last_weave`. If it's the first
   activation, read the last 14 available notes.
3. Analyze across, not chronologically — thematically. Look for: recurring themes, phrases/images
   that return, unresolved tensions, connections between different areas (work, relationship,
   body, study), persistent open questions.
4. Classify each pattern:
   - **Evolution** — it was in the log, it's transformed. Describe the movement.
   - **Interweaving** — new, but born from the combination of 2+ previous patterns. Name the parents.
   - **New** — discontinuous, not traceable to anything before.

   From the second weave on, **Evolution and Interweaving are the norm, not the exception**:
   before marking a pattern as New, check it isn't the transformation or combination of
   something already in the log. "New" everywhere is the sign you're not reading the past.
5. Write the new entry at the bottom of `Themes/Weave-Log.md`. Record **all** the significant
   patterns — coverage matters more than depth, because unrecorded patterns drop out of the
   longitudinal memory and risk being classified as New in later activations. Use depth
   proportional to weight:

~~~
## [Date]
*Period analyzed: [start] → [end] · [N] notes*

**[Main pattern name]** — [Type]
[Prose, 3–6 lines. Quote real phrases. Interpret the movement, don't list events.]

**[Secondary pattern name]** — [Type]
[Prose, 1–2 lines. Even very short — what matters is that the pattern exists in the log.]
~~~

Where a thread stays open, you can close it with a question instead of a verdict — show what
you've woven and leave the next step to the user. With measure: a question where it helps, not
one per pattern. The mirror reflects and sometimes asks; it doesn't prescribe.

6. Update `last_weave` = today, `next_weave` = today + 14 days in the frontmatter of
   `Themes/Weave-Log.md`. (`next_weave` is a reminder, not a trigger: nobody runs weave for you.)
7. For each pattern written in the log: if a corresponding `Themes/[Name].md` file already
   exists, add a dated note at the bottom (1–3 lines, prose, same voice). If the pattern is new
   and deserves a file, create it with frontmatter `tags: [theme, theme/name]`. If it's minor or
   already captured in the log alone, leave `Themes/` unchanged.

8. **Living people** — For each person with new traces since the last weave: distill the
   **portrait** at the top of their `People/[Name].md` file (light, anchored to the traces — no
   invented synthesis), and if a pattern emerges, update or create `## Recurring threads`.
   Recompute `relations:` and `themes:` in the frontmatter from the traces and the dailies. The
   dated **traces** are appended by the daily, not the weave: here you only distill. Same voice
   as the Themes notes.

   **Threshold:** portrait and threads only for those with enough traces to carry them — a
   reflective passage or a meaningful exchange. Walk-on appearances stay sparse: don't inflate
   them. `## Recurring threads` is born when a pattern returns at least twice; if a thread hasn't
   recurred for several weaves, lighten it or remove it.

9. **Vault hygiene** — a light tail, outside the log and the Themes: broken wiki-links
   (`/check-links` style), root folders missing from CLAUDE.md's structure table, obvious
   leftovers (backups, orphan files). Report anomalies in chat and propose fixes — don't fix
   on your own.

## Tone

Prose, **second person** — speak to the user: "you have", "you feel", "you notice", "you see a
thread". Never third person: write "you see the same thing is missing", not "the user sees the
same thing is missing". This holds for the Weave-Log, the `Themes/` notes, and the portraits in
`People/`. The voice is the companion who observes with you, not the narrator describing you from
outside. Quote real phrases from the dailies — don't paraphrase. Respect the user's writing
language.
