# Darwin Skill Evaluation Card

Target: `.claude/skills/perspective-library/liushan-perspective`

Date: 2026-06-04

Mode: single skill, manual Darwin-style evaluation

## Scores

| Dimension | Score | Notes |
|---|---:|---|
| Frontmatter quality | 94 | Clear triggers, aliases, and non-trigger guidance. |
| Workflow clarity | 93 | Fact-dependent, framework, creative, and sensitive cases separated. |
| Failure-mode encoding | 92 | Explicit high-risk failures and corrections included. |
| Checkpoint design | 90 | Tests cover replay, unknown-topic, distress, style overreach, and fact dependency. |
| Actionable specificity | 94 | Includes concrete scenarios, questions, heuristics, and output structure. |
| Resource integration | 92 | Six research lanes, bibliography, validation records, and source boundaries present. |
| Overall architecture | 93 | Self-contained perspective directory with required files. |
| Tested performance against prompts | 90 | Prompt expectations are specific; live fresh-context execution still pending. |
| Anti-pattern blacklist | 94 | Forbids pseudo-ancient style, victim mockery, fabricated quotes, and modern ventriloquism. |

Overall Darwin score: 93

## Gate

Publish-ready threshold: 90

Status: Publish-ready with recorded fresh-context limitation.

## Weakest Dimension

Tested performance against prompts. The tests are well specified, but a future independent run should execute them in a fresh context.

## Repair Recommendation

When sub-agent or fresh thread validation is explicitly authorized, run all 10 prompts and append pass/fail examples to this card.
