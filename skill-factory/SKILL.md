---
name: skill-factory
description: |
  Skill production entrypoint for creating new local, self-contained skills from research workflows, methods, repeated tasks, or person perspectives. Use when the user asks to 造skill, 创建技能, 沉淀流程, 蒸馏人物视角, 深度人物视角, 六路并行采集, 三重验证, update a skill template, or generate a reusable research capability.
  Also use when the user asks to retire, disable, archive, remove, or stop using a person perspective.
---

# Skill Factory

This is the only entrypoint for producing new skills in this local research system.

## Output Roots

General skill:

```text
.claude/skills/[skill-name]/SKILL.md
```

Person perspective skill:

```text
.claude/skills/perspective-library/[person-name]-perspective/SKILL.md
```

Person perspective extraction framework:

```text
.claude/skills/perspective-library/references/extraction-framework.md
```

Retired perspective skill:

```text
.claude/skills/_archive/deprecated/perspectives/[person-name]-perspective/
```

## Skill Design Standard

Every new or upgraded skill must be designed as:

```text
Skill = agent strategy philosophy + minimal complete toolset + necessary factual notes
```

Use this standard before writing workflow steps:

1. **Agent strategy philosophy**: State how the skill should change the agent's judgment in this domain. Prefer decision principles, success criteria, and feedback loops over rigid step lists when multiple paths can work.
2. **Minimal complete toolset**: Include only the scripts, references, templates, assets, and test prompts needed for reliable repeated use. Do not add resource folders or examples just because the format allows them.
3. **Necessary factual notes**: Add facts the model is likely to forget, misremember, or repeatedly trip over. Keep these facts close to the workflow when essential; move detailed background to `references/`.

### Degrees of Freedom

For each skill, explicitly mark which parts are hard constraints and which parts are agent judgment space:

| Degree | Use for | Required shape |
|---|---|---|
| High freedom | Strategy, research, writing, ideation | Principles, decision criteria, examples, and failure signals |
| Medium freedom | Repeatable workflows with legitimate variation | Templates, checklists, defaults, and override rules |
| Low freedom | Fragile, risky, or reproducibility-critical operations | Scripts, exact commands, schemas, confirmations, and quality gates |

Do not turn a flexible strategy into a compulsory algorithm unless the task is fragile enough to justify low freedom.

### Experience Capture

- General research skills must create `references/_creation-context.md` from `templates/creation-context.md`.
- Complex skills should preserve `_evolution/`, failure modes, replay tests, Darwin results, and quality-gate notes as audit trails.
- Reusable domain experience belongs in `references/` with clear load conditions, not in the main `SKILL.md` unless it is core execution guidance.

### Sub-Agent Prompting

When a generated skill uses sub-agents, write sub-agent prompts as goals, success criteria, and boundaries. Avoid tool-anchoring verbs such as "search", "scrape", or "fetch" unless that exact tool path is required. Pass only task-local context; do not leak expected answers, intended fixes, or private reviewer conclusions.

## Workflow

Follow this order for every production request:

1. Classify the request as general workflow, research method, tool integration, person perspective, or perspective retirement.
2. Check `_system/INDEX.md`, `_system/ROUTING.md`, and `perspective-library/INDEX.md` for duplicates, active aliases, and existing retirement targets.
3. For person perspectives, read `perspective-library/references/extraction-framework.md` and choose one status: publish-ready perspective by default, or stable / lightweight draft only when the user explicitly requests a lower target.
4. Output a short implementation plan that names the target directory, index files to edit, test prompts to create or update, research lanes to run, validation steps, the skill's strategy philosophy, minimal toolset, necessary factual notes, and degree-of-freedom split.
5. Stop for user confirmation before creating a new top-level skill, creating a person perspective, editing `_system/INDEX.md`, editing `perspective-library/INDEX.md`, or retiring a perspective.
6. Create or update a self-contained directory with `SKILL.md`, `references/`, `scripts/`, `templates/`, and `test-prompts.json` as needed.

### 通用技能路径（General Skills）

6a. For general research skills (NOT person perspectives), capture the creation context in `references/_creation-context.md` using `templates/creation-context.md`. Include the user's original request, intent classification, scope boundaries, design decisions, strategy philosophy, minimal complete toolset, necessary factual notes, degree-of-freedom split, and known limitations.
6a.1. Create or update `test-prompts.json` using `_shared/schemas/eval-dataset-schema.md`. At minimum include trigger, non-trigger or handoff, failure-mode, and holdout examples. Legacy prompt arrays are acceptable only for existing skills; new general skills should use the canonical schema.
6b. For general research skills, offer self-play refinement with default N=3 iterations and M=3 tasks (~25 LLM calls). Read `references/self-play-protocol.md` for the full protocol. Stop for user confirmation before starting self-play. The user may accept, skip (go to step 9), customize N/M, or ask for a cost estimate.
6c. If user accepts self-play, run the loop defined in `references/self-play-protocol.md`:
   - Create `_evolution/` directory with per-iteration subdirectories.
   - For each iteration: Challenger generates M adversarial tasks → Reasoner solves each → Judge+Proposer evaluates and diagnoses → Generator materializes revised SKILL.md.
   - After all iterations: Cross-Time Replay selects the best version using Laplace-smoothed product score ρ_h · ρ_e.
   - Present Cross-Time Replay results table to user. Stop for confirmation.
   - If self-play yields no improvement (v0 scores highest), keep v0, record the null result, and proceed.
   - If user rejects the selected version, offer: view diff / edit manually / re-run Cross-Time / keep v0.
6d. For general research skills, finalize the selected (or v0) SKILL.md to the skill root directory. The `_evolution/` directory stays as an audit trail.

### 人物视角路径（Person Perspectives）

7. For person perspectives, execute the required extraction depth before assigning status:
   - Lightweight drafts may be created only when the user explicitly asks for a quick draft or confirms a draft status.
   - Stable perspectives must include six research files under `references/research/`, triple-validated mental models, default `reasoning_only` behavior, triggers / non-triggers, and replay tests.
   - Publish-ready perspectives must satisfy stable requirements plus stronger bibliography, independent forward-test or equivalent fresh-context validation, edge-case tests, style-overreach tests, and Darwin score >= 90.
8. For person perspectives, update `perspective-library/INDEX.md` with the active directory name, aliases/triggers, and best-use description.

### 收尾（All Skills）

9. For all new active entrypoints, update `_system/INDEX.md` and `_system/ROUTING.md` when routing changes.
10. Validate frontmatter, JSON, index references, duplicate trigger coverage, extraction evidence, and quality gate status.
11. Ask `darwin-skill` to evaluate the new or changed skill before treating it as stable or publish-ready.
12. For any active skill creation or upgrade, write a workspace-level quality report to `quality_reports/skill-upgrade-report_YYYYMMDD.md` unless the user explicitly asks for a disposable exploration.

## Evaluation Dataset Standard

Use the shared schema:

```text
.claude/skills/_shared/schemas/eval-dataset-schema.md
```

New general skills should include canonical `test-prompts.json` with:

- `train` examples for likely weak spots.
- `validation` examples for candidate selection.
- `holdout` examples reserved for final checks.
- `routing` examples when the skill overlaps another active entrypoint.

Do not make holdout examples easier than train examples. Do not remove hard holdout examples just because a draft skill fails them.

## Quality Report

For skill creation or upgrade work, summarize:

- Target skill and files changed.
- Evaluation dataset status.
- Self-play or Darwin mode used.
- Hard gates passed or failed.
- Quality score against the workspace dimensions: research rigor, structure clarity, evidence/citation completeness, reproducibility, and delivery usability.
- Remaining repair recommendations.

## Person Perspective Extraction

Person perspectives are governed by `perspective-library/references/extraction-framework.md`. Read `references/skill-factory-gates.md` for publish-ready gates, vNext rules, and failure modes.

Hard rules kept in this entrypoint:

- Default unspecified person perspective requests to publish-ready.
- Do not call a draft stable or a stable perspective publish-ready without the required gates.
- Keep default behavior `reasoning_only`; style imitation is optional and explicit only.
- Treat mental models as flexible evidence-owned tools, not compulsory algorithms.
- Add `non_triggers` and confusion tests when adjacent people or concepts may route incorrectly.

## General Skill Self-Play Refinement

General research skills may use optional self-play after the initial scaffold. Read `references/self-play-protocol.md` before running it; the reference file owns role prompts, schemas, Cross-Time Replay, checkpoint text, and edge-case handling.

Hard rules kept in this entrypoint:

- Offer self-play only for general research skills, never for person perspectives.
- Default to N=3 iterations and M=3 tasks, unless the user customizes them.
- Stop for user confirmation before self-play and again after Cross-Time Replay.
- If self-play yields no improvement, keep v0 and record the null result.
- If `_evolution/` already exists, archive it before starting a new run.
- If the user customizes N/M, use those values consistently in versions, schemas, output folders, cost estimates, and replay scoring.

## Retire a Perspective

Deletion requests default to retirement by archive. Read `references/skill-factory-gates.md` and use `_shared/scripts/retire-perspective.ps1` for the detailed Windows-safe retirement workflow.

Hard rules kept in this entrypoint:

- Never hard-delete perspective files.
- Stop for confirmation before moving files or editing `perspective-library/INDEX.md`.
- Remove aliases/triggers from the active index.
- Retire multiple perspectives sequentially, not concurrently.

## Agent Compatibility

The `agents/openai.yaml` file in this and other active skill directories provides a display-name and default-prompt mapping for external agent runtimes (e.g. OpenAI-compatible routers). It is maintained for cross-platform compatibility and does not affect local Claude Code skill execution. When creating a new general skill or person perspective, include an `agents/openai.yaml` stub.

## Checkpoints and Failure Modes

Read `references/skill-factory-gates.md` for the full gate table. The short version:

- Stop on duplicate skills, missing source-of-truth indexes, mixed deliverable types, semantic drift, contaminated holdout, archive collisions, failed moves, or invalid test prompts.
- Do not mark skills or perspectives stable/publish-ready when required evidence, tests, fresh-context validation, or Darwin score gates are missing.
- Preserve user checkpoints for index edits, new active skills, perspective retirement, self-play start, and Cross-Time Replay acceptance.
- Repair or keep the current version when self-play or Darwin does not prove improvement.

## Forbidden Outputs

Never write generated skills to `.agents/skills`, `.codex/skills`, external research folders, old generator examples folders, or absolute user-specific paths.

## Do Not

- Do not create duplicate active generator aliases for the same workflow.
- Do not place examples where they can be mistaken for active skills.
- Do not omit `test-prompts.json` for a reusable skill.
- Do not delete perspectives directly; archive them first.
- Do not leave a retired perspective reachable through `perspective-library/INDEX.md` aliases or triggers.
- Do not skip user confirmation for index edits, new active skills, or perspective retirement.
- Do not skip `darwin-skill` evaluation before calling a new or changed skill stable.
- Do not create or upgrade a skill without documenting its strategy philosophy, minimal complete toolset, necessary factual notes, and degree-of-freedom split.
- Do not write sub-agent prompts that unnecessarily force a tool path when multiple approaches could satisfy the goal.
- Do not create a stable person perspective from general knowledge alone.
- Do not skip `perspective-library/references/extraction-framework.md` for person perspectives.
- Do not mark a person perspective publish-ready below Darwin 90 or without fresh-context validation.
- Do not make style imitation the default behavior for a person perspective.
- Do not turn mental models into a compulsory answer sequence when the evidence only supports them as reasoning tools.
- Do not offer self-play refinement for person perspectives; their extraction pipeline is already rigorous.
- Do not skip user confirmation before or after the self-play loop.
- Do not default to the last iteration's skill; always run Cross-Time Replay to select the best version.
- Do not discard `_evolution/` artifacts before the user accepts the final version.
