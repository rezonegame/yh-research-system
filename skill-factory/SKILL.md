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

## Person Perspective Extraction

Person perspectives are governed by `perspective-library/references/extraction-framework.md`.

Mandatory publish-ready workflow:

1. Run six research lanes in parallel: writings, conversations, expression DNA, external views, decisions, and timeline.
2. Save each lane under `references/research/` as `01-writings.md` through `06-timeline.md`.
3. Promote a claim into a mental model only when it passes all triple-validation tests: cross-domain recurrence, predictive power, and exclusivity.
4. Build `SKILL.md` from validated material: exact triggers / non-triggers, default `reasoning_only` mode, 3-7 mental-model tools, 5-10 decision heuristics, optional expression DNA, values and anti-patterns, honest boundaries, failure modes with fallback behavior, and local tests.
5. Build a stronger bibliography in the research references: include primary sources, external criticism, and modern secondary sources when available.
6. Validate with three public replay questions, one unknown-topic uncertainty test, one adjacent-person confusion test, one reasoning-only test, one style-overreach test, and at least two edge-case prompts.
7. Run independent forward-testing with a fresh context when available; otherwise record why it could not be done and keep the status below publish-ready.
8. Run `darwin-skill` and record the result. Publish-ready requires Darwin score >= 90.

If the user requests a person perspective and does not explicitly choose stable or lightweight draft status, default to publish-ready. Do not call a draft stable, and do not call a stable perspective publish-ready without forward-testing or an explicit recorded substitute.

### Person Perspective vNext Rules

For every new or upgraded person perspective, apply the detailed rules in `perspective-library/references/extraction-framework.md`. The non-negotiable summary is:

- Default to `reasoning_only`; do not make style imitation the normal response mode.
- Keep expression DNA as an optional module activated only by explicit style/voice/imitation requests.
- Treat mental models as flexible, evidence-owned reasoning tools, not compulsory answer algorithms.
- Generate explicit `triggers` and confusion-preventing `non_triggers` when adjacent people or concepts may route incorrectly.
- Test against drift: identity confusion, modern-topic uncertainty, fact dependence, reasoning-only requests, style-overreach, and edge cases.

## General Skill Self-Play Refinement

General research skills (workflows, research methods, tool integrations) go through an optional self-play refinement loop after the initial scaffold is created. The full protocol, role prompts, and output schemas are in `references/self-play-protocol.md`.

### When to Use

Self-play is offered for **general research skills only** — NOT for person perspectives (which already have their own six-lane extraction + triple validation + replay testing pipeline).

### Core Mechanism (adapted from Ctx2Skill)

Five roles operate through structured prompts (not separate agents):

| Role | What it does |
|------|-------------|
| **Challenger** | Generates 3 adversarial probing tasks per iteration, each with a binary rubric, targeting skill weaknesses |
| **Reasoner** | Solves each task by following the current skill version exactly as written |
| **Judge+Proposer** | Evaluates all 3 solutions (strict all-or-nothing), then diagnoses cross-task failure/success patterns |
| **Generator** | Materializes the Proposer's diagnosis into a complete replacement SKILL.md |

The default loop runs N=3 iterations × M=3 tasks. If the user customizes N or M, use those values consistently in prompts, output schemas, folder names, version labels, cost estimates, and Cross-Time Replay. Failed tasks route to Reasoner-side skill improvement; passed tasks route to Challenger-side strategy tightening. Both sides co-evolve.

### Cross-Time Replay

After N iterations, there are N+1 skill versions (`v0` through `vN`). Cross-Time Replay selects the best:

1. **Hard Probe Set**: At most one closest-to-passing failure from each iteration. If an iteration has no failures, use its closest-to-boundary PASS.
2. **Easy Probe Set**: At most one most decisive success from each iteration. If an iteration has no successes, skip that iteration for E.
3. **Scoring**: Each version v is tested against all probes in H ∪ E.
   - score(v) = (hard_pass_rate + 0.1) × (easy_pass_rate + 0.1)
   - Multiplicative form penalizes versions that sacrifice easy tasks for hard ones
4. **Selection**: v* = argmax score(v); ties go to later version

### User Checkpoints

- **Before self-play**: Present plan with iteration count, task count, and estimated cost. User may accept, skip, or customize.
- **After Cross-Time Replay**: Present score table with selected version and key improvements. User may accept, view diff, edit manually, or keep v0.

### Failure Modes

| Self-play yields no improvement | Keep v0, record null result in _evolution/, proceed to Darwin. |
| All versions have 0 hard-probe passes | Flag for human review, select version with highest easy-probe score. |
| User rejects selected version | Offer: edit manually / re-run Cross-Time / keep v0. |
| _evolution/ already exists | Archive previous as _evolution.bak.{N} before creating new. |
| Custom N/M conflicts with a schema, prompt, or template | Treat the schema/prompt/template as stale; update it to parameterized `v数字` and N/M before running self-play. |

## Retire a Perspective

Deletion requests default to retirement by archive. Do not hard-delete perspective files.

1. Parse the requested name and match it against `perspective-library/INDEX.md` aliases/triggers and active directories.
2. Confirm the target directory exists under `perspective-library/`.
3. Prepare a confirmation summary with the source directory, archive target, exact index row to remove, and aliases/triggers that will stop routing.
4. Stop for user confirmation before moving files or editing the index.
5. Move the directory to `_archive/deprecated/perspectives/`.
6. Remove its whole row from `perspective-library/INDEX.md`; this is the trigger cleanup for active routing.
7. Leave the archived directory self-contained.
8. Verify the source directory no longer exists, the archive directory exists, the active index no longer contains the retired directory name, and aliases no longer route to the retired skill.
9. For multiple perspectives, retire them sequentially. Do not run concurrent retire commands against the same `perspective-library/INDEX.md`.

Use `_shared/scripts/retire-perspective.ps1` for repeatable retirement on Windows.

## Agent Compatibility

The `agents/openai.yaml` file in this and other active skill directories provides a display-name and default-prompt mapping for external agent runtimes (e.g. OpenAI-compatible routers). It is maintained for cross-platform compatibility and does not affect local Claude Code skill execution. When creating a new general skill or person perspective, include an `agents/openai.yaml` stub.

## Checkpoints and Failure Modes

| Situation | Required behavior |
|---|---|
| Duplicate active skill or alias found | Stop and ask whether to update the existing skill, choose a new name, or cancel. |
| `_system/INDEX.md`, `_system/ROUTING.md`, or `perspective-library/INDEX.md` is missing | Stop and report the missing source of truth; do not create orphaned skills. |
| Request mixes a general workflow and person perspective | Ask the user to choose one deliverable first; do not create both in one implicit pass. |
| Person perspective lacks six research lanes | Mark it as lightweight draft or stop; do not call it stable. |
| Proposed mental model fails triple validation | Keep it in references as a note or limitation; do not put it in the mental-model section. |
| Person perspective would be driven by a fixed step-by-step persona algorithm | Rewrite the section as a flexible mental-model toolbox before validation. |
| Expression DNA starts controlling normal analysis | Move style rules into an optional expressive module and keep the default mode `reasoning_only`. |
| Adjacent person, teacher, collaborator, or stylistic neighbor can be confused with the target | Add `non_triggers` and confusion tests before marking the perspective stable. |
| Public replay tests fail | Repair the perspective or keep it draft; do not mark it stable or publish-ready. |
| Publish-ready lacks forward-test or edge-case tests | Keep it stable and record the missing gate; do not mark it publish-ready. |
| User requests delete/remove/disable for a perspective | Treat it as archive retirement, show the confirmation summary, then wait. |
| Archive target already exists | Stop and ask whether to merge manually, rename the retirement target, restore the archived copy, or cancel. |
| Move or index update fails during retirement | Stop, report which validation failed, and do not claim the perspective is retired. |
| Batch retirement partially succeeds | Audit every requested perspective, then complete directory and index cleanup sequentially. |
| `test-prompts.json` is missing or invalid | Fix or create it before Darwin evaluation; do not mark the skill stable. |
| Darwin score is below the requested quality gate | Enter a repair loop focused on the weakest dimension before delivery. |
| New skill plan lacks strategy philosophy, minimal toolset, necessary facts, or degree-of-freedom split | Add those design elements before asking for creation confirmation. |
| Sub-agent prompt anchors on an avoidable tool path | Rewrite it as target outcome, success criteria, and boundaries before delegation. |
| Self-play loop produces no improvement over v0 | Keep v0, record the null result in `_evolution/`, and proceed to Darwin evaluation. |
| Cross-Time Replay selects a version with 0 hard-probe passes | Flag the skill for human review, present the easy-probe score, and ask the user to decide. |
| User rejects the self-play selected version | Offer: view structured diff, edit manually and re-run Cross-Time, or keep v0. |
| `_evolution/` directory already exists (re-running self-play) | Archive previous `_evolution/` as `_evolution.bak.{N}` before starting new run. |
| Self-play offered for a person perspective | Skip self-play; person perspectives use their own extraction pipeline. Do not offer self-play for perspectives. |

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
