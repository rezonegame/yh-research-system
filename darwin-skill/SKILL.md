---
name: darwin-skill
description: |
  Self-evolution entrypoint for the local .claude/skills research system. Use when the user asks to optimize, score, evaluate, improve, or evolve skills; mentions 达尔文, darwin, skill评分, skill质量检查, 自动优化, or skill review. Supports single, category, and all-active modes with test prompts, baseline scoring, human checkpoints, and rollback.
---

# Darwin Skill

Darwin is the self-upgrade engine for this local research skill system.

It evaluates and improves skills without changing the system's core purpose: research, analysis, evaluation, skill production, and skill evolution.

## Local Scope

Root:

```text
.claude/skills
```

Read `darwin.config.md` before scanning. Default active entrypoints:

- `research-workflow`
- `analysis-workflow`
- `evaluation-workflow`
- `skill-factory`
- `darwin-skill`
- `perspective-library`
- `lecture-slides`

Default exclusions: `_archive`, `_system`, `_shared`, `examples`, `references`, `templates`, `assets`, `results`, and `_evolution`.

## Modes

| Mode | Use |
|---|---|
| `single` | Evaluate or optimize one specified skill |
| `category` | Evaluate or optimize one workflow/category |
| `all-active` | Evaluate or optimize all active entrypoints |

If the user is ambiguous, ask for scope before editing.

## Workflow

1. Confirm scope and mode.
2. Verify whether the workspace is a git repository.
3. Read `references/autoreason-darwin-protocol.md` for any optimization or rewrite request.
4. Read or create `test-prompts.json` for each target skill; normalize legacy prompt files using `_shared/schemas/eval-dataset-schema.md`.
5. Run baseline scoring before editing.
6. Identify the weakest dimension and classify failures.
7. For material changes, use the A/B/AB candidate loop: incumbent `A`, targeted revision `B`, and synthesis `AB`.
8. Validate candidates with hard constraints before judging.
9. Blind-rank candidates with Borda aggregation; ties go to incumbent `A`.
10. Run holdout and routing regression checks before replacing an active `SKILL.md`.
11. Keep only improvements; otherwise roll back or stop with `no_change_needed`.
12. Record every run in `results.tsv` and write a workspace quality report.

## Autoreason-Darwin Loop

Use this loop when the user asks to optimize, evolve, improve, or materially rewrite a skill.

1. Candidate `A` is the unchanged current skill and must always remain eligible.
2. Candidate `B` may address only defects supported by train/validation examples, traces, or user-reported failures.
3. Candidate `AB` must synthesize the strongest parts of `A` and `B`; it is not allowed to expand scope just to seem more complete.
4. Run `scripts/validate-skill.ps1` against every candidate before judging.
5. Run `scripts/validate-eval-dataset.ps1` against any canonical `test-prompts.json` before using it for scoring.
6. Collect judge rankings in `_evolution/YYYYMMDD-HHMM/judge-rankings.json` and aggregate with `scripts/compute-borda.ps1`.
7. If `A` wins two consecutive passes, stop and report that no change is justified.
8. If a revised candidate wins, require holdout non-regression, routing non-regression, and semantic preservation before replacement.

## Evaluation Dataset Standard

Preferred format is defined in:

```text
.claude/skills/_shared/schemas/eval-dataset-schema.md
```

Legacy `test-prompts.json` arrays with `prompt` and `expected` remain valid. Treat them as holdout examples until upgraded. Use `scripts/normalize-eval-dataset.ps1` to preview or write the canonical shape.

Every active entrypoint should eventually include:

- At least one trigger example.
- At least one non-trigger or handoff example.
- At least one failure-mode example.
- At least one holdout example not used while designing candidate edits.

## Hard Gates

Reject or stop before replacing an active skill when any gate fails:

| Gate | Required behavior |
|---|---|
| Structure | Frontmatter, `name`, `description`, H1 title, and non-empty body must pass validation. |
| Growth | More than 20% growth over incumbent requires explicit user approval. |
| Semantic preservation | Trigger scope, forbidden actions, handoff boundaries, and output ownership must not drift without approval. |
| Routing | `_system/ROUTING.md` expectations must not regress. |
| Holdout | Holdout examples must not regress after candidate selection. |
| Confirmation | Required user checkpoints must not be removed. |

For a repository-wide quality check, run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\.claude\skills\darwin-skill\scripts\run-quality-gate.ps1
```

## Rubric

Use a 9-dimension score out of 100:

1. Frontmatter quality.
2. Workflow clarity.
3. Failure-mode encoding.
4. Checkpoint design.
5. Actionable specificity.
6. Resource integration.
7. Overall architecture.
8. Tested performance against prompts.
9. Anti-pattern and high-risk action blacklist.

## Rollback

Use `git revert` when a git repository is available.

If this is not a git repository, create a timestamped backup before editing:

```text
SKILL.md.bak.YYYYMMDD-HHMM
```

Restore from that backup when a change fails evaluation. Never use `git reset --hard`.

## Logs and Results

Append runs to:

```text
.claude/skills/darwin-skill/results.tsv
```

Write result cards to:

```text
.claude/skills/darwin-skill/results/cards/
```

Write workspace-level upgrade reports to:

```text
quality_reports/skill-upgrade-report_YYYYMMDD.md
```

Run artifacts for a target skill belong under:

```text
.claude/skills/[target-skill]/_evolution/YYYYMMDD-HHMM/
```

## Do Not

- Do not scan `_archive` by default.
- Do not scan `_evolution` directories; they contain self-play artifacts, not active skill definitions.
- Do not silently delete, move, or rename skills.
- Do not optimize multiple dimensions in one round.
- Do not skip test prompts.
- Do not let the same context both make and blindly bless a risky change.
- Do not write results outside `.claude/skills/darwin-skill/`.
- Do not replace an active skill when the unchanged incumbent wins the blind comparison.
- Do not tune against holdout examples before candidate selection.
- Do not accept semantic drift as an improvement unless the user explicitly approves the scope change.
- Do not let Borda rankings reveal which candidate is the incumbent.

## Self-Play Evolution Context

If a skill directory contains `_evolution/cross-time-replay.json`, read it before evaluating. The file records:
- Which version was selected by Cross-Time Replay
- Per-version hard and easy probe scores
- Key improvements in the selected version compared to v0
- Whether human review was flagged

Use this as context for dimensions 3 (failure-mode encoding), 4 (checkpoint design), and 8 (tested performance). A skill that went through self-play and showed improvement on hard probes has evidence of robustness that a single-pass skill lacks. Record the Cross-Time Replay score in the Darwin result card's notes.

