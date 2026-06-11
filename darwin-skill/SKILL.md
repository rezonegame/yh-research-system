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
3. Read or create `test-prompts.json` for each target skill.
4. Run baseline scoring before editing.
5. Identify the weakest dimension.
6. Propose one concrete change for one dimension.
7. Apply the change only after a checkpoint when the change is non-trivial.
8. Re-score using the same prompts.
9. Keep only improvements; otherwise roll back.
10. Record every run in `results.tsv`.

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

## Do Not

- Do not scan `_archive` by default.
- Do not scan `_evolution` directories; they contain self-play artifacts, not active skill definitions.
- Do not silently delete, move, or rename skills.
- Do not optimize multiple dimensions in one round.
- Do not skip test prompts.
- Do not let the same context both make and blindly bless a risky change.
- Do not write results outside `.claude/skills/darwin-skill/`.

## Self-Play Evolution Context

If a skill directory contains `_evolution/cross-time-replay.json`, read it before evaluating. The file records:
- Which version was selected by Cross-Time Replay
- Per-version hard and easy probe scores
- Key improvements in the selected version compared to v0
- Whether human review was flagged

Use this as context for dimensions 3 (failure-mode encoding), 4 (checkpoint design), and 8 (tested performance). A skill that went through self-play and showed improvement on hard probes has evidence of robustness that a single-pass skill lacks. Record the Cross-Time Replay score in the Darwin result card's notes.

