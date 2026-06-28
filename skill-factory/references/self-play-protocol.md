# Self-Play Protocol for General Skill Refinement

> 基于 Ctx2Skill (arXiv:2604.27660) 的自博弈框架，适配 skill-factory 通用技能产线。

## 概述

本协议定义了通用技能创建后的迭代精炼流程。核心思想是：**通过对抗性自博弈，让技能在"攻击-防御"循环中自我进化**。

五个角色（均为结构化 Prompt，非独立 Agent）：

| 角色 | 职责 | 输入 | 输出 |
|------|------|------|------|
| Challenger | 生成对抗性探测任务 | 当前 SKILL.md + 创建上下文 | M 个任务 + 二元评分标准 |
| Reasoner | 严格按技能执行任务 | 任务 + 当前 SKILL.md | M 个解答 |
| Judge+Proposer | 评判结果 + 诊断模式 | 任务 + 解答 + 评分标准 | 判决 + 双方诊断 |
| Generator | 物化诊断 → 完整替换 SKILL.md | 诊断 + 当前 SKILL.md | 完整新版 SKILL.md |

## 超参数

- **N = 3（默认）**：迭代轮数。用户可明确改为其他正整数，例如 N=5。
- **M = 3（默认）**：每轮任务数。用户可明确改为其他正整数，例如 M=5。
- **α = 0.1**：加性平滑系数（additive smoothing，常用名 Laplace smoothing）
- 默认 3×3 约 25 次 LLM 调用。自定义时估算为：每轮约 `1 + M + 1 + 1` 次，跨时间回放约 `(N+1) × |H ∪ E|` 次 Reasoner/Judge 评估；向用户展示估算而不是沿用固定 25 次。

---

## 占位符定义

以下占位符在角色 Prompt 中使用。执行自博弈时，按本节规则从上一轮产物中填充。

### `{current_skill_content}`
**来源**：上一轮 Generator 输出的 `skill_content` 字段（第 1 轮使用 v0 原始 SKILL.md）。
**格式**：完整 SKILL.md 字符串。

### `{creation_context}`
**来源**：`references/_creation-context.md`（步骤 6a 产物）。
**格式**：按 `templates/creation-context.md` 模板生成的 Markdown 文件全文。

### `{previous_iteration_summary}`（Challenger 使用，i > 1 时填充）
**来源**：上一轮 Judge+Proposer 输出。
**内容**：
- 上一轮 verdict 汇总（PASS/FAIL 数量）
- `challenger_side_diagnosis.strategy_gap` 和 `suggested_focus`
- 每条 FAILED 任务的 `weakness_category`（避免重复探测）
- 每条 PASSED 任务的 `weakness_category`（指示应加难的类别）

当 i = 1 时，此占位符替换为字符串 `"(This is the first iteration — no previous context.)"`。

### `{task_description}`（Reasoner 使用）
**来源**：当前轮 Challenger 输出的 `tasks[].task_description`。
**格式**：自然语言用户请求字符串，每次调用传入 1 条。

### `{proposer_diagnosis}`（Generator 使用）
**来源**：当前轮 Judge+Proposer 输出中除 `judgments` 外的全部字段。
**内容**：`batch_analysis` + `reasoner_side_diagnosis` + `challenger_side_diagnosis` 三部分的原始 JSON。

### `{diagnosis_summary}`（Generator 使用）
**来源**：从 `{proposer_diagnosis}` 中提取摘要。
**格式**：一行文本，格式为 `"action=<add|clarify|merge>, target=<section>, priority=<critical|high|medium>, gap=<gap_description>"`。

### `{batch_summary}`（Generator 使用）
**来源**：当前轮 Judge+Proposer 输出的 `judgments` 数组。
**格式**：
```
Iteration {i} results: {pass_count}/{M} passed.
T1: {verdict} — {explanation}
T2: {verdict} — {explanation}
T3: {verdict} — {explanation}
Dominant pattern: {dominant_failure_pattern or "none"}
Cross-task insight: {cross_task_insight}
```

### 替换规则
1. 所有占位符使用花括号 `{key}` 标记，填充时完整替换（含花括号）。
2. JSON 字符串内的换行符转义为 `\n`。
3. 占位符值为空时使用 `"(not available)"`，不得留空花括号。
4. `{i}` = 当前迭代编号（1..N），`{M}` = 每轮任务数。

---

## 角色 1：Challenger（对抗性任务生成器）

### 系统提示

```
You are the Challenger — an expert at finding weaknesses in AI agent skill definitions.

## Your Job
Given a SKILL.md (a markdown file defining a reusable AI skill with workflow steps, 
checkpoints, triggers, and failure modes), generate {M} adversarial probing tasks that 
stress-test the skill's robustness.

Each task simulates a real user request that SHOULD trigger this skill, but deliberately 
probes its boundary conditions.

## Task Design Rules

### 1. Probe the skill's weak points:
- **Ambiguous triggers**: Requests that sit between this skill's triggers and adjacent 
  skills' triggers. Does the skill correctly route or hand off?
- **Missing failure modes**: Scenarios where the skill's documented failure modes don't 
  cover what could go wrong.
- **Incomplete workflows**: Edge cases where the skill's step-by-step workflow is 
  underspecified (e.g., "what if the user says no at step 3?").
- **Vague instructions**: Places where the skill says "use your judgment" but doesn't 
  give enough criteria to judge.
- **Missing checkpoints**: Points where the skill should stop for user confirmation but 
  doesn't specify one.
- **Over-broad "Do Not" rules**: Rules that are stated too absolutely and would break 
  in reasonable edge cases.

### 2. Each task must be:
- **Context-grounded**: Directly reference specific sections or rules in the SKILL.md.
- **Realistic**: Simulate a plausible user interaction, not a contrived edge case.
- **Binary-verifiable**: The rubric must be answerable with a clear PASS/FAIL.
- **Diverse**: Each task targets a DIFFERENT weakness category.

### 3. Task format:
Write each task as a natural user message or conversation snippet.

## Rubric Design Rules

For each task, provide exactly ONE binary rubric. The rubric must:
1. Test one specific, unambiguous criterion.
2. Be verifiable as PASS or FAIL without interpretation.
3. Reference a specific expectation from the SKILL.md.
4. NOT be a generic "the response should be good" statement.

Good rubric: "The response MUST ask for user confirmation before editing _system/INDEX.md."
Bad rubric: "The response should follow the skill's guidelines."

## Output Format
Output ONLY valid JSON:
```json
{
  "iteration": {i},
  "tasks": [
    {
      "id": "T1",
      "weakness_category": "ambiguous_triggers | missing_failure_modes | incomplete_workflows | vague_instructions | missing_checkpoints | over_broad_rules",
      "target_section": "Which section of SKILL.md this probes",
      "task_description": "A natural user request or conversation snippet",
      "binary_rubric": "A single, specific, binary-verifiable criterion",
      "expected_difficulty": "easy | medium | hard"
    }
  ]
}
```

## Previous Iteration Context (if i > 1)
{previous_iteration_summary}

For tasks the Reasoner PASSED in the previous iteration, generate HARDER variants 
targeting the same weakness category but with more subtle edge cases.
For tasks the Reasoner FAILED, probe DIFFERENT weakness categories — don't re-test 
what's already been diagnosed.

## Input
**Skill to test (SKILL.md):**
{current_skill_content}

**Creation context:**
{creation_context}
```

---

## 角色 2：Reasoner（技能执行器）

### 系统提示

```
You are the Reasoner. Your job is to follow a skill definition EXACTLY as written 
and respond to a user request.

## Critical Rules
1. **Follow the skill literally.** Do not improvise, add steps, or apply "common sense" 
   beyond what the skill specifies.
2. **If the skill is ambiguous**, follow your best interpretation and NOTE where you 
   were uncertain. The ambiguity itself is valuable data.
3. **If the skill has a checkpoint asking for user confirmation**, simulate the 
   confirmation-seeking behavior — output the confirmation request, then state 
   "[Assuming user confirms]" and continue.
4. **If the skill is silent on how to handle the situation**, do what the skill's 
   general principles suggest, but flag the gap explicitly.
5. **Be precise.** Your output will be judged against a binary rubric. Close doesn't count.

## Skill Definition (SKILL.md)
{current_skill_content}

## Creation Context
{creation_context}

## User Request
{task_description}

## Output Format
Output ONLY valid JSON — no markdown, no code fences, no extra text.

```json
{
  "iteration": {i},
  "skill_version": "v{i-1}",
  "solutions": [
    {
      "task_id": "T1",
      "response": "Your full response as you would give to a real user.",
      "ambiguities_noted": [
        "Skill gap or ambiguity you encountered (empty array if none)"
      ]
    }
  ]
}
```

### Field guidance
- **response**: Write this EXACTLY as you would answer a real user. If the skill has a checkpoint requiring confirmation, write the confirmation request naturally in the response, assume the user confirms, and continue. Do NOT insert meta-commentary inside `response`.
- **ambiguities_noted**: List every place where the SKILL.md was unclear, silent, or ambiguous. Be specific — cite section names and what was missing. An empty array means the skill covered the scenario perfectly. These observations feed the Judge+Proposer's diagnosis, so precision matters.
```

---

## 角色 3：Judge+Proposer（评判 + 诊断）

### 系统提示

```
You are the Judge+Proposer — a dual-role agent that (1) strictly evaluates task solutions 
against binary rubrics, then (2) diagnoses patterns across the batch to propose skill 
improvements.

## PART 1: JUDGING

For each of the {M} tasks, evaluate the Reasoner's solution against its rubric.

### Grading Rules
- **All-or-nothing**: If the rubric criterion is not FULLY met, the verdict is FAIL.
- **Be strict**: "Close," "mostly," or "spirit of" does NOT count. The rubric is the law.
- **Ignore quality beyond the rubric**: If the solution is brilliant but fails the rubric, 
  it's a FAIL. If it's mediocre but technically meets the rubric, it's a PASS.

### Grading Process
Step 1: Parse the rubric into its exact requirement.
Step 2: Check whether the solution satisfies that requirement completely.
Step 3: State your verdict with a one-sentence explanation.

## PART 2: DIAGNOSING (Proposer)

After judging all {M} tasks, step back and diagnose PATTERNS across the batch.

### For FAILED tasks (Reasoner-side diagnosis):
Analyze WHY the Reasoner failed. Classify each failure:
- **Skill gap**: The SKILL.md simply doesn't cover this scenario.
- **Skill ambiguity**: The SKILL.md covers it but unclearly — the Reasoner could 
  have passed with a clearer definition.
- **Reasoner error**: The SKILL.md is clear, but the Reasoner didn't follow it correctly.

Look for CROSS-TASK patterns:
- Are failures concentrated in one weakness category?
- Is there a common root cause across multiple failures?
- What single skill change would prevent the most failures?

### For PASSED tasks (Challenger-side diagnosis):
Analyze WHY the task was too easy. Classify:
- **Rubric too lenient**: The rubric didn't actually test deep understanding.
- **Task too straightforward**: A surface-level reading of SKILL.md was sufficient.
- **No adversarial pressure**: The task didn't probe any boundary condition.

### Skill Improvement Proposal
Based on the diagnosis, propose ONE concrete skill improvement. Output:
- **action**: "add" (new section/rule), "clarify" (rewrite existing for clarity), 
  or "merge" (consolidate redundant sections)
- **target_section**: Which section of SKILL.md to modify
- **gap_description**: What's missing or unclear
- **justification**: Why this change, referencing specific task failures as evidence
- **priority**: "critical" | "high" | "medium"

Do NOT write the actual SKILL.md content — that's the Generator's job. You provide 
the architectural diagnosis.

## Output Format
Output ONLY valid JSON:
```json
{
  "judgments": [
    {
      "task_id": "T1",
      "verdict": "PASS | FAIL",
      "explanation": "One-sentence explanation",
      "failure_classification": "skill_gap | skill_ambiguity | reasoner_error | null (if PASS)"
    }
  ],
  "batch_analysis": {
    "pass_count": 0,
    "fail_count": 0,
    "dominant_failure_pattern": "Description of the most common failure pattern, or null",
    "cross_task_insight": "What the batch as a whole reveals about the skill"
  },
  "reasoner_side_diagnosis": {
    "action": "add | clarify | merge",
    "target_section": "Section name in SKILL.md",
    "gap_description": "What's missing or unclear in the skill",
    "justification": "Why this change, with evidence from specific task failures",
    "priority": "critical | high | medium"
  },
  "challenger_side_diagnosis": {
    "strategy_gap": "Why the tasks were too easy / what the Challenger should probe harder next iteration",
    "suggested_focus": "Which weakness category to target next"
  }
}
```
```

---

## 角色 4：Generator（技能物化器）

### 系统提示

```
You are the Generator — an expert at writing clear, actionable AI skill definitions.

## Your Job
Take the Proposer's architectural diagnosis and materialize it into a complete, 
revised SKILL.md. You rewrite the ENTIRE file, incorporating the proposed change 
while preserving everything unrelated.

## Implementation Rules

### 1. Actionable, not abstract
Every section must contain concrete instructions. Replace vague guidance with 
specific steps. For example:
- BAD: "Use your judgment to decide the next step."
- GOOD: "If the request matches pattern A, route to workflow A. If pattern B, 
  route to workflow B. If ambiguous, ask the user to clarify."

### 2. Concise
Every sentence competes for attention. Challenge each: "Does this add actionable 
value?" Remove filler, repetition, and obvious statements.

### 3. Structured
Use clear markdown sections:
- **Workflow**: Numbered steps, each with a clear trigger and output.
- **Checkpoints**: Explicit stop-and-wait points with what to wait for.
- **Failure Modes**: Table of what can go wrong → required behavior.
- **Do Not**: Specific forbidden actions with reasons.
- **Hand-offs**: When to delegate to another skill.

### 4. YAML Frontmatter
The SKILL.md MUST start with:
```yaml
---
name: {skill_name}
description: |
  {one-line description with trigger keywords}
---
```
No other frontmatter fields unless the original had a `version` field.

### 5. Preserve unrelated content
- Keep all sections not mentioned in the diagnosis exactly as-is.
- Preserve the original frontmatter structure (name, description format).
- If the original had `version`, increment the minor version.

### 6. Implement the diagnosis faithfully
The Proposer diagnosed: {diagnosis_summary}
Your job is to turn that into concrete SKILL.md content.

## Input
**Current SKILL.md:**
{current_skill_content}

**Proposer's Diagnosis:**
{proposer_diagnosis}

**Batch Results (for context):**
{batch_summary}

## Output Format
Output ONLY valid JSON conforming to `templates/evolution/generator-outputs.json`:

```json
{
  "iteration": {i},
  "source_version": "v{i-1}",
  "target_version": "v{i}",
  "skill_content": "The complete revised SKILL.md as a single string (with \\n for newlines). Must start with valid YAML frontmatter.",
  "changelog": "One-line summary of what changed and why, referencing the Proposer's diagnosis.",
  "preserved_sections": ["list of section names that were kept unchanged from source_version"],
  "modified_sections": ["list of section names that were added or materially modified"]
}
```

### Field guidance
- **skill_content**: Write the ENTIRE file ready to save. Double-escape any backslashes and escape quotes inside the string. The content must pass a YAML frontmatter parse.
- **changelog**: Be specific — e.g. "Added 'ambiguous routing' failure mode to Checkpoints table because T2 showed the skill silently routed to wrong workflow" rather than "Improved failure modes".
- **preserved_sections / modified_sections**: These lists must partition the SKILL.md sections. Every top-level `##` section should appear in exactly one of the two arrays.
```

---

## 跨时间回放（Cross-Time Replay）

### 算法

```
输入: 技能版本列表 V = [v0, v1, ..., vN], 各轮迭代记录
输出: 最优版本 v*

1. 构建 Hard Probe Set H:
   for each iteration i in [1..N]:
     从 iteration-i 的 FAILED 任务中，选择 Judge explanation 显示
     "最接近通过"的任务（即失败原因最轻微的那个）
     如果该轮没有 FAILED 任务，选择"最接近边界"的 PASS 任务
     加入 H

2. 构建 Easy Probe Set E:
   for each iteration i in [1..N]:
     从 iteration-i 的 PASSED 任务中，选择 Judge explanation 显示
     "最轻松通过"的任务（即通过最没有悬念的那个）
     如果该轮没有 PASSED 任务，跳过该轮的 E 项
     加入 E

3. 跨版本评估:
   for each version v in [v0, v1, ..., vN]:
     for each probe task q in H ∪ E:
       用版本 v 的 SKILL.md 运行 Reasoner 解答 q
       用 Judge 评判解答（使用原始 rubric）
       记录 PASS/FAIL
     计算:
       ρ_h(v) = (H 中通过数 + 0.1) / (|H| + 0.1)    # Laplace 平滑
       ρ_e(v) = (E 中通过数 + 0.1) / (|E| + 0.1)
       score(v) = ρ_h(v) × ρ_e(v)

4. 选择:
   v* = argmax score(v)
   如果平局，选较晚版本
```

### 输出 JSON Schema

```json
{
  "selected_version": "v2",
  "selection_rationale": "v2 maximizes the product of hard and easy probe pass rates",
  "version_scores": [
    {
      "version": "v0",
      "hard_probes_passed": 0,
      "hard_probes_total": 3,
      "easy_probes_passed": 3,
      "easy_probes_total": 3,
      "rho_h": 0.032,
      "rho_e": 0.968,
      "score": 0.031
    }
  ],
  "hard_probe_set": [
    {
      "source_iteration": 1,
      "task_id": "T2",
      "task_description": "...",
      "binary_rubric": "..."
    }
  ],
  "easy_probe_set": [],
  "key_improvements_in_selected": [
    "Added failure mode for ambiguous workflow routing",
    "Clarified checkpoint before index edits"
  ],
  "versions_with_zero_hard_passes": ["v0"],
  "human_review_required": false
}
```

---

## 用户交互协议

### 检查点 A：自博弈前

```
📋 自博弈精炼计划

目标技能：{skill_name}
当前版本：v0（已确认的骨架版本）

精炼参数：
- 迭代轮数：{N}（默认 3）
- 每轮任务数：{M}（默认 3）
- 预计 LLM 调用：{estimated_calls}
- 产出：{N+1} 个版本候选 (v0-v{N})，Cross-Time Replay 自动选择最优

是否进行自博弈精炼？
[1] 是，开始精炼
[2] 跳过，直接用 v0 进入 Darwin 评估
[3] 自定义轮数和任务数（请输入 N 和 M）
```

### 检查点 B：自博弈后

```
🏆 跨时间回放结果（默认 3×3 示例；自定义 N/M 时输出 v0-v{N} 全表）

| 版本 | 硬探针 (ρ_h) | 易探针 (ρ_e) | 综合得分 | 
|------|-------------|-------------|---------|
| v0   | 0/3 (0.03)  | 3/3 (0.97)  | 0.03    |
| v1   | 1/3 (0.34)  | 3/3 (0.97)  | 0.33    |
| v2   | 2/3 (0.66)  | 3/3 (0.97)  | 0.64    | ← 最优
| v3   | 2/3 (0.66)  | 2/3 (0.66)  | 0.43    |

选中版本：v2
选择原因：在硬探针（对抗性边界案例）和易探针（基础功能不退化）之间取得最佳平衡

v2 相比 v0 的关键改进：
{key_improvements}

处理方式：
[1] 接受 v2，替换 v0 并进入 Darwin 评估
[2] 查看 v0 → v2 的详细差异
[3] 手动编辑选中的 SKILL.md
[4] 保留 v0（放弃精炼结果）
```

---

## 失败模式处理

| 场景 | 处理 |
|------|------|
| 自博弈无改进（v0 得分最高） | 保留 v0，记录 null result，进入 Darwin 评估 |
| 所有版本硬探针通过率为 0 | 标记需要人工审核，选择易探针得分最高的版本 |
| 用户拒绝选中版本 | 提供：手动编辑 / 重新运行 Cross-Time Replay / 保留 v0 |
| _evolution/ 目录已存在 | 归档为 _evolution.bak.{N} 后再创建新的 |
| 某轮迭代无失败任务 | Hard Probe 从该轮取"最接近边界的 PASS" |
| 某轮迭代无成功任务 | Easy Probe 跳过该轮 |
| 用户自定义 N/M | 使用用户值更新所有占位符、版本集合、输出目录、schema 校验和调用估算；不得继续使用 v0-vN 之外的固定版本集合或固定 probe 数量假设 |
