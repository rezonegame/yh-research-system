# Darwin Recheck: skill-factory design methodology upgrade

Timestamp: 2026-06-28T10:42:46+08:00

Mode: single / full_test

Target: `.claude/skills/skill-factory`

Git state: no git

## Score

Before: 91.0 / 100

After: 93.6 / 100

Status: keep (publish-ready; parameterized self-play and design-methodology gates are validated)

| Dimension | Score | Note |
|---|---:|---|
| Frontmatter quality | 9.2 | Frontmatter remains valid and trigger coverage still matches skill creation, updating, perspective creation, and retirement. |
| Workflow clarity | 9.3 | Added a clear Skill Design Standard before production steps, so plans now include strategy philosophy, toolset, facts, and degree-of-freedom split. |
| Failure-mode encoding | 9.4 | Added failure modes for missing design-methodology elements, tool-anchored sub-agent prompts, and stale fixed-N/M self-play schemas. |
| Checkpoint design | 9.2 | Existing confirmation gates remain intact; self-play accepts skip, default, custom N/M, and post-replay confirmation paths. |
| Actionable specificity | 9.5 | The new design standard is operational: it tells agents what to record, how to classify freedom levels, and how to prompt sub-agents. |
| Resource integration | 9.6 | `creation-context.md`, five evolution schemas, test prompts, and self-play protocol are synchronized around v0-vN and custom N/M behavior. |
| Overall architecture | 9.4 | The skill now combines production workflow, design methodology, self-play evolution, perspective extraction, and Darwin gating without changing scope. |
| Tested performance against prompts | 9.2 | `test-prompts.json` expanded from 21 to 24 prompts; JSON parsing, quick validation, and N=5/M=5 schema samples all passed. No live end-to-end self-play run was performed. |
| Anti-pattern and high-risk action blacklist | 9.7 | Added explicit prohibitions against undocumented skill design, unnecessary tool anchoring in sub-agent prompts, skipped confirmation, and stale fixed-version self-play assumptions. |

## Verification

- `quick_validate.py` passed with `PYTHONUTF8=1`.
- `test-prompts.json` and all `templates/evolution/*.json` parse as JSON.
- `test-prompts.json` has 24 unique prompt ids, including new ids 22-24.
- Static scan found no remaining fixed schema constraints such as `^v[0-3]`, `"maxItems": 3`, `"maximum": 3`, or v0-v3 assumptions.
- `jsonschema` validation passed for synthetic N=5/M=5 outputs across Challenger, Reasoner, Judge, Generator, and Cross-Time Replay schemas.
- `_system/INDEX.md`, `_system/ROUTING.md`, `perspective-library/INDEX.md`, and `.claude/skills/README.md` still reference `skill-factory`.

## Key Changes Since Last Evaluation

1. Added `Skill Design Standard`: strategy philosophy, minimal complete toolset, and necessary factual notes.
2. Added degree-of-freedom rules for high, medium, and low freedom skill sections.
3. Added experience capture and sub-agent goal-prompting guidance.
4. Parameterized self-play protocol from default 3x3 to customizable N/M with `v0` through `vN`.
5. Relaxed evolution schemas for custom task counts, version counts, and probe totals.
6. Fixed `judge-verdicts.json` so `failure_classification` can be `null` when verdict is PASS.
7. Expanded tests with three prompts covering design methodology, freedom split, and multi-agent prompting.

## Residual Risk

The upgrade validates structure and schema behavior, including a synthetic N=5/M=5 run shape, but it does not execute a real multi-iteration self-play loop against a new skill. The first live custom-N/M self-play run should be treated as a forward test and may reveal prompt-tuning opportunities.
