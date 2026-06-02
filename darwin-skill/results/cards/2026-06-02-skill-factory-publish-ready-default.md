# Darwin Recheck: skill-factory publish-ready default

Timestamp: 2026-06-02T11:58:59+08:00

Mode: single / full_test

Target: `.claude/skills/skill-factory`

Git state: repository present, dirty

## Score

Before: 91.0 / 100

After: 92.0 / 100

Status: keep

## Changes

- Person perspective creation now defaults to publish-ready.
- Stable and lightweight draft are explicit lower targets only.
- Publish-ready now requires:
  - stable six-lane extraction,
  - stronger bibliography,
  - public replay tests,
  - unknown-topic uncertainty test,
  - edge-case tests,
  - fresh-context forward-test or recorded substitute,
  - Darwin score >= 90.
- Added test prompts for default publish-ready behavior and refusing premature publish-ready labeling.

## Verification

- `skill-factory/test-prompts.json` parsed as valid JSON.
- `quick_validate.py` passed for `skill-factory`.
- Search confirmed publish-ready default, stronger bibliography, edge-case tests, fresh-context validation, and Darwin >= 90 gates.

## Residual Risk

The policy is publish-ready by default, but actual publish-ready status still depends on executing forward-tests for each new perspective.
