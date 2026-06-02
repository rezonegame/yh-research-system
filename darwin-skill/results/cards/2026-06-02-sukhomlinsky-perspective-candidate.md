# Darwin Baseline: sukhomlinsky-perspective publish-ready candidate

Timestamp: 2026-06-02T12:17:00+08:00

Mode: perspective-single / full_test

Target: `.claude/skills/perspective-library/sukhomlinsky-perspective`

Git state: repository present, dirty

## Score

Before: n/a

After: 89.0 / 100

Status: keep as publish-ready candidate

## Created

- `SKILL.md` with six mental models, decision heuristics, expression DNA, boundaries, anti-patterns, and validation protocol.
- `test-prompts.json` with 7 replay, unknown-topic, and edge-case prompts.
- Six research lanes under `references/research/`:
  - writings,
  - conversations/interviews equivalent,
  - expression DNA,
  - external views,
  - decision record,
  - life timeline.
- `references/bibliography.md` with primary, near-primary, secondary, and Chinese reception sources.
- `references/publish-ready-validation.md` with gate checklist, triple-validation record, replay expectations, and forward-test plan.
- Active routing row in `perspective-library/INDEX.md` with aliases/triggers.

## Verification

- `SKILL.md` passed `quick_validate.py`.
- `test-prompts.json` parsed as valid JSON with 7 prompts.
- All six research files exist.
- `perspective-library/INDEX.md` contains the active `sukhomlinsky-perspective` row and aliases.

## Remaining Gate

Fresh-context subagent validation has not been run for this perspective. Under the current `skill-factory` policy, this perspective should remain a publish-ready candidate until the independent forward-test is explicitly authorized and completed.
