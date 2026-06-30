# Autoreason-Darwin Protocol

This protocol adapts Autoreason-style refinement to the local `.claude/skills` system. Use it when Darwin is asked to optimize, evolve, or materially rewrite an active skill.

## Core Principle

The current skill is a first-class candidate. Darwin must prove that a change is better before replacing an active `SKILL.md`.

## Candidate Set

Each evolution pass compares three candidates:

| Candidate | Meaning | Required artifact |
|---|---|---|
| `A` | Unchanged incumbent skill | Current `SKILL.md` |
| `B` | Targeted revision | Revision directly addressing critic findings |
| `AB` | Synthesis | Coherent version preserving A where strong and using B where it fixes proven issues |

If no concrete defect is found, produce only `A` and stop with `no_change_needed`.

## Pass Workflow

1. Load the target skill, its `test-prompts.json`, and any previous `_evolution/cross-time-replay.json`.
2. Split examples into `train`, `validation`, `holdout`, and `routing` using `_shared/schemas/eval-dataset-schema.md`.
3. Critic identifies real defects from train/validation examples only.
4. Author creates `B`; Synthesizer creates `AB`.
5. Validate `A`, `B`, and `AB` with hard constraints before judging.
6. Blind judges rank valid candidates using validation examples and the original skill purpose.
7. Aggregate rankings with Borda count; ties go to `A`.
8. If `A` wins, keep the incumbent. If `A` wins two consecutive passes, stop.
9. If `B` or `AB` wins, run holdout and routing regression tests.
10. Replace the active skill only when holdout does not regress, routing is unchanged or explicitly approved, and semantic preservation passes.

## Hard Constraints

Reject a candidate before judging if any hard constraint fails:

- Invalid YAML frontmatter or missing `name` / `description`.
- Empty body or missing `#` title.
- Growth over 20% compared with `A`, unless the user explicitly approves.
- Purpose drift: changed trigger scope, forbidden actions, output ownership, or handoff boundaries without user approval.
- Missing `test-prompts.json` for an active entrypoint.
- Any required confirmation point removed.

## Judging Rules

- Candidate labels must be anonymized for judges.
- Judges rank all valid candidates from best to worst; they should not know which is the incumbent.
- Use 3 judges for `standard`, 7 judges for `publish-ready`, and 1 judge only for `quick` exploratory checks.
- Use Borda scoring. With three candidates, first place receives 3 points, second 2, third 1.
- If the incumbent `A` ties the best score, `A` wins.

## Stop Conditions

Stop without replacing the skill when:

- `A` wins two consecutive passes.
- All revised candidates fail hard constraints.
- Holdout performance regresses.
- Routing regression appears and the user has not approved the changed routing.
- Semantic preservation fails.

## Required Artifacts

Write run artifacts under the target skill directory:

```text
_evolution/YYYYMMDD-HHMM/
  candidates/A/SKILL.md
  candidates/B/SKILL.md
  candidates/AB/SKILL.md
  constraints.json
  judge-rankings.json
  borda-result.json
  holdout-result.json
  routing-result.json
  decision.md
  traces/
```

Append a summary row to:

```text
.claude/skills/darwin-skill/results.tsv
```

For workspace-level reporting, also write:

```text
quality_reports/skill-upgrade-report_YYYYMMDD.md
```

## Modes

| Mode | Use | Default judges | Default passes |
|---|---|---:|---:|
| `quick` | exploratory, non-mutating checks | 1 | 1 |
| `standard` | normal active skill upgrade | 3 | 2 |
| `publish-ready` | public or high-risk skill upgrade | 7 | 3 |

## Failure Classifications

Every failed example or rejected candidate must be classified as one of:

- `skill_gap`
- `skill_ambiguity`
- `reasoner_error`
- `routing_regression`
- `semantic_drift`
- `constraint_failure`
- `holdout_regression`
- `judge_noise`

These labels are used to decide whether to edit the skill, improve the eval set, or stop.
