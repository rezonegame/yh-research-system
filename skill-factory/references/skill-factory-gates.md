# Skill Factory Gates and Failure Modes

Use this reference when creating, upgrading, retiring, or validating skills through `skill-factory`.

## Person Perspective Publish-Ready Gates

Person perspectives are governed by `perspective-library/references/extraction-framework.md`.

Mandatory publish-ready workflow:

1. Run six research lanes in parallel: writings, conversations, expression DNA, external views, decisions, and timeline.
2. Save each lane under `references/research/` as `01-writings.md` through `06-timeline.md`.
3. Promote a claim into a mental model only when it passes triple validation: cross-domain recurrence, predictive power, and exclusivity.
4. Build `SKILL.md` from validated material: exact triggers / non-triggers, default `reasoning_only` mode, 3-7 mental-model tools, 5-10 decision heuristics, optional expression DNA, values and anti-patterns, honest boundaries, failure modes, and local tests.
5. Build a stronger bibliography in the research references.
6. Validate with public replay, unknown-topic uncertainty, adjacent-person confusion, reasoning-only, style-overreach, and edge-case prompts.
7. Run independent fresh-context forward-testing when available; otherwise keep status below publish-ready.
8. Run `darwin-skill`; publish-ready requires Darwin score >= 90.

Default to publish-ready unless the user explicitly requests stable or lightweight draft. Do not call a draft stable, and do not call a stable perspective publish-ready without forward-testing or an explicit recorded substitute.

## Person Perspective vNext Rules

- Default to `reasoning_only`; do not make style imitation the normal response mode.
- Keep expression DNA optional and activated only by explicit style/voice/imitation requests.
- Treat mental models as flexible, evidence-owned reasoning tools, not compulsory algorithms.
- Generate explicit `triggers` and confusion-preventing `non_triggers` when adjacent people or concepts may route incorrectly.
- Test against identity confusion, modern-topic uncertainty, fact dependence, reasoning-only requests, style-overreach, and edge cases.

## Perspective Retirement

Deletion requests default to retirement by archive. Do not hard-delete perspective files.

1. Parse the requested name and match it against `perspective-library/INDEX.md` aliases/triggers and active directories.
2. Confirm the target directory exists under `perspective-library/`.
3. Prepare a confirmation summary with source directory, archive target, exact index row, and aliases/triggers that will stop routing.
4. Stop for user confirmation before moving files or editing the index.
5. Move the directory to `_archive/deprecated/perspectives/`.
6. Remove its whole row from `perspective-library/INDEX.md`.
7. Leave the archived directory self-contained.
8. Verify source removal, archive existence, index cleanup, and alias cleanup.
9. For multiple perspectives, retire them sequentially.

Use `_shared/scripts/retire-perspective.ps1` for repeatable retirement on Windows.

## Checkpoints and Failure Modes

| Situation | Required behavior |
|---|---|
| Duplicate active skill or alias found | Stop and ask whether to update existing skill, choose a new name, or cancel. |
| `_system/INDEX.md`, `_system/ROUTING.md`, or `perspective-library/INDEX.md` is missing | Stop; do not create orphaned skills. |
| Request mixes a general workflow and person perspective | Ask the user to choose one deliverable first. |
| Person perspective lacks six research lanes | Mark as lightweight draft or stop. |
| Proposed mental model fails triple validation | Keep it as a note; do not put it in mental models. |
| Perspective becomes a fixed persona algorithm | Rewrite as flexible mental-model tools. |
| Expression DNA controls normal analysis | Move style rules into an optional module. |
| Adjacent figures or concepts can be confused | Add `non_triggers` and confusion tests before stable status. |
| Public replay tests fail | Repair or keep draft. |
| Publish-ready lacks forward-test or edge-case tests | Keep stable and record missing gate. |
| User requests delete/remove/disable for a perspective | Treat as archive retirement and wait. |
| Archive target already exists | Stop and ask whether to merge, rename, restore, or cancel. |
| Move or index update fails during retirement | Stop and report failed validation. |
| Batch retirement partially succeeds | Audit and complete cleanup sequentially. |
| `test-prompts.json` is missing or invalid | Fix before Darwin evaluation. |
| Darwin score is below requested gate | Enter repair loop focused on weakest dimension. |
| New skill plan lacks strategy philosophy, minimal toolset, necessary facts, or degree-of-freedom split | Add these before confirmation. |
| Sub-agent prompt anchors on avoidable tool path | Rewrite as target outcome, success criteria, and boundaries. |
| New general skill lacks canonical eval coverage | Add trigger, non-trigger/handoff, failure-mode, and holdout examples. |
| Candidate skill changes trigger scope or handoff boundaries | Treat as semantic drift; stop for approval. |
| Holdout examples were used during drafting | Mark run contaminated and rebuild/reseed holdout. |
| Self-play loop produces no improvement over v0 | Keep v0 and record null result. |
| Cross-Time Replay selects a version with 0 hard-probe passes | Flag for human review. |
| User rejects self-play selected version | Offer diff, manual edit/replay, or keep v0. |
| `_evolution/` already exists | Archive previous `_evolution/` before starting a new run. |
| Self-play offered for a person perspective | Skip; use person perspective extraction pipeline. |
