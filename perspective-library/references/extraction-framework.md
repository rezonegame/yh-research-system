# Perspective Extraction Framework

Source basis: adapted from the public Nuwa Skill extraction framework and this local research system's six-agent perspective methodology.

Reference URL: https://github.com/alchaincyf/nuwa-skill/blob/main/references/extraction-framework.md

## Purpose

Use this framework whenever creating or upgrading a person/style perspective skill.

A perspective skill is not a summary of a person's biography. It is an operational model that can:

1. Predict how the person would likely reason about new problems.
2. Reproduce the person's characteristic reasoning moves and expression style.
3. State honest boundaries when evidence is missing or the person never addressed the topic.

## Mandatory Six-Lane Collection

Before writing a stable person perspective `SKILL.md`, run six parallel research lanes and save each lane as an archive file.

Required output path:

```text
.claude/skills/perspective-library/[person-name]-perspective/references/research/
```

Required files:

```text
01-writings.md
02-conversations.md
03-expression-dna.md
04-external-views.md
05-decisions.md
06-timeline.md
```

Lane definitions:

| Lane | Evidence to collect | Required extraction |
|---|---|---|
| Writings | Books, essays, papers, letters, official posts, long-form public writing | Repeated claims, conceptual vocabulary, favorite examples, explicit principles |
| Conversations | Podcasts, interviews, lectures, Q&A, debates, transcripts | Spontaneous reasoning patterns, uncertainty handling, conversational moves |
| Expression DNA | Speeches, short posts, repeated phrasings, metaphors, rhetorical habits | Sentence rhythm, favorite contrasts, emotional register, taboo phrases |
| External views | Critics, collaborators, biographers, competitors, historians | Blind spots, contradictions, outside corrections, reputation vs reality |
| Decisions | Major life, product, research, business, or public decisions | Revealed preferences, tradeoffs, risk posture, action under constraints |
| Timeline | Life chronology, career stages, failures, pivots, late revisions | Phase changes, stable vs evolved beliefs, context for contradictions |

If a lane has weak evidence, keep the file and mark the evidence gap explicitly. Do not silently skip the lane.

## Triple Validation for Mental Models

A claim can enter `SKILL.md` as a mental model only if it passes all three tests:

1. **Cross-domain recurrence**: The pattern appears in at least two domains, contexts, or life phases. A single quote or isolated anecdote is not enough.
2. **Predictive power**: The model helps infer how the person would reason about a new problem, not merely describe what they once said.
3. **Exclusivity**: The model is not generic wisdom that most smart people would endorse. It must distinguish this perspective from adjacent thinkers.

If a claim fails any test, place it in references as a note, example, limitation, or expression pattern instead of promoting it to a mental model.

## Skill Construction Requirements

A stable person perspective `SKILL.md` must include:

- Frontmatter with exact triggers and non-trigger guidance.
- Role activation and exit rules.
- A decision workflow for fact-dependent, pure-framework, and mixed questions.
- 3-7 validated mental models.
- 5-10 decision heuristics.
- Expression DNA, including vocabulary, rhythm, metaphors, stance markers, and forbidden imitations.
- Values, revealed preferences, and anti-patterns.
- Honest boundaries, including topics the person did not address and places where model inference is low-confidence.
- Failure modes and fallback behavior.
- Local `test-prompts.json`.

Keep `SKILL.md` operational. Put evidence, quotes, source summaries, and long analysis in `references/`.

## Quality Validation

Default target: publish-ready. Use stable or lightweight draft only when the user explicitly asks for a lower target or when a publish-ready gate cannot be completed.

Before treating a perspective as stable:

1. Select three public questions the person actually answered or clearly addressed.
2. Test whether the skill's answer direction matches the public record.
3. Select one relevant question the person did not clearly address.
4. Confirm the skill shows appropriate uncertainty and inference boundaries instead of inventing certainty.
5. Run `darwin-skill` and record the result.

Before treating a perspective as publish-ready:

1. Satisfy all stable requirements.
2. Add a stronger bibliography: primary sources, external criticism, and modern secondary sources when available.
3. Add edge-case tests for emotional situations, direct-answer override, fact-dependent questions, and style-overreach risk.
4. Run independent forward-testing with fresh context when available. If unavailable, record the substitute validation and keep status below publish-ready unless the user explicitly accepts the limitation.
5. Reach Darwin score >= 90.

Minimum gates:

| State | Required evidence | Allowed status |
|---|---|---|
| Lightweight draft | `SKILL.md`, index row, local tests | Draft only; do not call deep or stable |
| Stable perspective | Six research files, triple-validated models, replay tests, Darwin score >= 80 | Active stable |
| Publish-ready perspective | Stable evidence plus strong bibliography, edge-case tests, fresh-context forward-test, Darwin score >= 90 | Publish-ready |

## Handling Contradictions

Do not flatten contradictions into a single clean doctrine.

When evidence conflicts:

1. Separate early, middle, and late phases when timeline evidence supports it.
2. Distinguish public rhetoric from revealed decisions.
3. Use external views to identify blind spots.
4. Mark low-confidence inferences explicitly.

## Forbidden Shortcuts

- Do not create a stable person perspective from general knowledge alone.
- Do not promote famous quotes into mental models without triple validation.
- Do not imitate style so strongly that reasoning quality drops.
- Do not invent positions for topics the person never addressed.
- Do not hide missing evidence by omitting a research lane.
- Do not call a lightweight draft stable.
- Do not call a stable perspective publish-ready without fresh-context validation and Darwin score >= 90.
