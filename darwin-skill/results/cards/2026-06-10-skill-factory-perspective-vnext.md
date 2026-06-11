# Darwin Recheck: skill-factory perspective vNext

Timestamp: 2026-06-10T17:14:04+08:00

Mode: single / full_test

Target: `.claude/skills/skill-factory`

Git state: repository present, dirty

## Score

Before: 92.0 / 100

After: 93.0 / 100

Status: keep

| Dimension | Score | Note |
|---|---:|---|
| Frontmatter quality | 9.0 | Existing frontmatter remains valid and trigger scope still matches skill creation, update, validation, and retirement. |
| Workflow clarity | 9.2 | Person-perspective workflow now explicitly requires reasoning-only defaults, triggers/non-triggers, style-overreach tests, and extraction-framework alignment. |
| Failure-mode encoding | 9.3 | Added fixed-algorithm, expression-DNA drift, and adjacent-person confusion failure modes. |
| Checkpoint design | 9.0 | Existing confirmation gates for new skills, index edits, and retirements remain intact. |
| Actionable specificity | 9.3 | vNext rules are concrete enough to change generated `SKILL.md` and `test-prompts.json` shape without forcing one answer algorithm. |
| Resource integration | 9.4 | Detailed person-perspective rules live in `perspective-library/references/extraction-framework.md`; `skill-factory/SKILL.md` keeps only the entrypoint summary. |
| Overall architecture | 9.2 | Keeps skill-factory as the production entrypoint and extraction-framework as the detailed perspective standard. |
| Tested performance against prompts | 9.4 | `test-prompts.json` now covers reasoning-only, non-triggers, style-overreach, identity confusion, and forced-algorithm requests. |
| Anti-pattern and high-risk action blacklist | 9.4 | Explicitly blocks default style imitation and compulsory mental-model answer sequences. |

## Verification

- Parsed `skill-factory/test-prompts.json` successfully: 15 tests.
- Checked required keywords and sections in `skill-factory/SKILL.md` and `perspective-library/references/extraction-framework.md`.
- Confirmed no reference to a concrete sample perspective was introduced in the upgraded rules.
- Ran skill-creator review for context cost and reduced duplicated vNext detail in `skill-factory/SKILL.md`; detailed rules remain in `extraction-framework.md`.

## Residual Risk

The tests are prompt-level expectations rather than an automated scorer. This is acceptable for the current local skill system, but future Darwin automation could add executable prompt replay.
