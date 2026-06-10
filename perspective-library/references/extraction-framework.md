# Perspective Extraction Framework

Source basis: adapted from the public Nuwa Skill extraction framework and this local research system's six-agent perspective methodology.

Reference URL: https://github.com/alchaincyf/nuwa-skill/blob/main/references/extraction-framework.md

## Purpose

Use this framework whenever creating or upgrading a person/style perspective skill.

A perspective skill is not a summary of a person's biography. It is an operational model that can:

1. Predict how the person would likely reason about new problems.
2. Reproduce the person's characteristic reasoning moves without defaulting to style imitation.
3. State honest boundaries when evidence is missing or the person never addressed the topic.

Default mode: `reasoning_only`. Use the person's cognitive frame, value ordering, judgment boundaries, and mental-model tools. Do not imitate the person's voice, catchphrases, prose structure, or stylized endings unless the user explicitly asks for expressive output.

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

- Frontmatter with exact `triggers`, relevant `non_triggers`, and status.
- A default `reasoning_only` mode declaration.
- Role activation and exit rules.
- Guidance for fact-dependent, pure-framework, and mixed questions without forcing every answer through one fixed sequence.
- 3-7 validated mental-model tools.
- 5-10 decision heuristics.
- Optional expression DNA, including vocabulary, rhythm, metaphors, stance markers, and forbidden imitations; use it only when the user asks for voice, style, imitation, prose feel, captioning, or another expressive form.
- Values, revealed preferences, and anti-patterns.
- Honest boundaries, including topics the person did not address and places where model inference is low-confidence.
- Failure modes and fallback behavior.
- Local `test-prompts.json`.

Keep `SKILL.md` operational. Put evidence, quotes, source summaries, and long analysis in `references/`.

## Mental Model Ownership and Flexibility

Promote a mental model only when it belongs to the target person strongly enough to distinguish the perspective from adjacent figures. For each model, make the evidence basis visible: writings, decisions, interviews, actions, or stable external views.

Write mental models as a toolbox, not a mandatory algorithm:

- Use: model name, core meaning, evidence basis, suitable situations, useful diagnostic questions, and misuse risk.
- Avoid: "always start with A, then B, then C" unless that sequence is directly evidenced and central to the person.
- Allow models to combine, conflict, or be temporarily down-weighted when the question requires it.
- Keep generic traits, famous quotes, and style markers in references unless they pass triple validation.

## Trigger and Non-Trigger Design

Every perspective needs explicit `triggers`. Add `non_triggers` whenever routing could confuse the target with:

- Teachers, students, collaborators, friends, rivals, or biographical neighbors.
- Same-field figures with overlapping concepts.
- Stylistic or cultural influences.
- Adjacent concepts that should route to a different perspective or normal analysis.

Use non-triggers to prevent identity drift, not to block legitimate comparative questions.

## Optional Expression Mode

Expression DNA is a capability, not the default operating mode.

- Default requests such as "use X's perspective" or "how would X analyze this" should produce reasoning-only analysis.
- Expressive mode activates only for explicit requests such as "use X's voice", "write in X's style", "imitate", "make it prose-like", or "write a caption/title in X's manner".
- In expressive mode, preserve factual accuracy, reasoning clarity, and honest boundaries. If style conflicts with accuracy, downshift style.

## Quality Validation

Default target: publish-ready. Use stable or lightweight draft only when the user explicitly asks for a lower target or when a publish-ready gate cannot be completed.

Before treating a perspective as stable:

1. Select three public questions the person actually answered or clearly addressed.
2. Test whether the skill's answer direction matches the public record.
3. Select one relevant question the person did not clearly address.
4. Confirm the skill shows appropriate uncertainty and inference boundaries instead of inventing certainty.
5. Test one adjacent-person or adjacent-concept confusion case.
6. Test one default reasoning-only request where style imitation should not appear.
7. Run `darwin-skill` and record the result.

Before treating a perspective as publish-ready:

1. Satisfy all stable requirements.
2. Add a stronger bibliography: primary sources, external criticism, and modern secondary sources when available.
3. Add edge-case tests for emotional situations, direct-answer override, fact-dependent questions, identity confusion, and style-overreach risk.
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
- Do not make style imitation the default response mode.
- Do not turn mental models into a compulsory answer algorithm when they are only validated as flexible reasoning tools.
- Do not invent positions for topics the person never addressed.
- Do not hide missing evidence by omitting a research lane.
- Do not call a lightweight draft stable.
- Do not call a stable perspective publish-ready without fresh-context validation and Darwin score >= 90.
