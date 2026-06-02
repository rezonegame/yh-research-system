# Darwin Recheck: skill-factory extraction framework

Timestamp: 2026-06-02T11:31:32+08:00

Mode: single / full_test

Target: `.claude/skills/skill-factory`

Git state: repository present, dirty

## Score

Before: 87.0 / 100

After: 91.0 / 100

Status: keep

## Changes

- Added `perspective-library/references/extraction-framework.md`.
- Required person perspectives to read the framework before planning.
- Made stable perspective creation default to six research lanes, triple validation, replay tests, and Darwin scoring.
- Added explicit draft/stable/publish-ready gates.
- Expanded `skill-factory/test-prompts.json` with deep perspective, draft-only, and quote-validation tests.
- Marked `socrates-perspective` as a lightweight draft because it lacks six-lane evidence.

## Verification

- `skill-factory/test-prompts.json` parsed as valid JSON.
- `skill-factory/SKILL.md` frontmatter matched expected structure.
- Search confirmed framework references, six-lane extraction, triple validation, draft gates, and stable/publish-ready statuses are present.

## Score Rationale

The main weakness from the previous version was that person perspective creation could still degrade into a quick template. The new framework makes extraction depth an explicit gate and prevents single quotes or general knowledge from being promoted into stable mental models.
