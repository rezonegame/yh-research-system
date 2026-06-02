# Darwin Baseline: piaget-perspective publish-ready candidate

Timestamp: 2026-06-02T12:29:09+08:00

Mode: perspective-single / full_test

Target: `.claude/skills/perspective-library/piaget-perspective`

Git state: repository present, dirty

## Score

Before: n/a

After: 89.0 / 100

Status: keep as publish-ready candidate

## Created

- `SKILL.md` with six mental models, decision heuristics, expression DNA, values, anti-patterns, boundaries, and failure modes.
- `test-prompts.json` with 9 replay, unknown-topic, edge-case, and safety prompts.
- Six research lanes under `references/research/`.
- `references/bibliography.md` with primary/near-primary, secondary criticism, and reception sources.
- `references/publish-ready-validation.md` with gate checklist and fresh-context plan.
- Active routing row in `perspective-library/INDEX.md`.

## Verification

- `quick_validate.py` passed.
- `test-prompts.json` parsed as valid JSON with 9 prompts.
- All six research files exist.
- `perspective-library/INDEX.md` contains the active `piaget-perspective` row and aliases.

## Remaining Gate

Fresh-context validation is currently running. Under `skill-factory` policy, this perspective remains a publish-ready candidate until the independent verifier passes and Darwin score reaches 90 or above.
