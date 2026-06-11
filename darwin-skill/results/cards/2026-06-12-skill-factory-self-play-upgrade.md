# Darwin Recheck: skill-factory self-play upgrade

Timestamp: 2026-06-12T00:00:00+08:00

Mode: single / full_test

Target: `.claude/skills/skill-factory`

Git state: no git

## Score

Before: 93.0 / 100

After: 91.0 / 100

Status: keep (self-play architecture is sound; minor workflow-clarity regression from added complexity is expected and acceptable)

| Dimension | Score | Note |
|---|---:|---|
| Frontmatter quality | 9.0 | 有效 YAML、触发范围仍涵盖技能创建/更新/验证/退役。自博弈相关触发词（"精炼""进化""迭代"）未在 description 中体现，为微小遗漏。 |
| Workflow clarity | 8.8 | 三阶段流水线（Scaffold→Self-Play→Gate）架构清晰，每条路径有显式门控。但步骤编号（6a-6d 与 7-8 交错）首次阅读时可能困惑，需子标题分组改进。 |
| Failure-mode encoding | 9.0 | 自博弈失败场景覆盖全面：无改进、零硬探针、用户拒绝、`_evolution/` 已存在、人物视角误触发。缺少"`_creation-context.md` 未生成"场景。 |
| Checkpoint design | 8.8 | 自博弈前后各有确认检查点（A/B）。缺少步骤 6a 后的检查点——用户应在 `_creation-context.md` 写入后、自博弈启动前审阅。UI 模板在协议中但不在 SKILL.md 中。 |
| Actionable specificity | 9.3 | 协议中角色提示极其具体，JSON Schema 约束输出格式，占位符现已完整定义。SKILL.md 通过渐进披露委托细节，模式正确。 |
| Resource integration | 9.4 | 所有引用存活：self-play-protocol.md、5 个 JSON Schema、creation-context.md 模板、extraction-framework.md、retire-perspective.ps1。`agents/openai.yaml` 仍为孤立文件。 |
| Overall architecture | 9.2 | 三阶段设计优雅：自博弈优化任务表现，Darwin 评估架构质量，两者互补。Cross-Time Replay 防止对抗性崩溃。Person 管道未受影响。提示深度在各角色间不对称（Challenger/Judge+Proposer ~100行，Reasoner ~30行）。 |
| Tested performance against prompts | 9.0 | test-prompts.json 现有 21 条，6 条涵盖自博弈。全部为预期描述而非自动重放——与之前的局限性相同。自博弈协议本身无测试提示。 |
| Anti-pattern and high-risk action blacklist | 9.5 | 22 条 Do Not 规则，其中 5 条保护自博弈完整性。全面覆盖：不跳过确认、不丢弃 `_evolution/`、不默认末轮版本、不对人物视角提供自博弈。 |

## Verification

- 解析 `skill-factory/SKILL.md` 通过：所有章节、检查点、失败模式、Do Not 列表完整。
- 交叉验证 4 个 JSON Schema + 新增 generator-outputs.json 为有效 JSON。
- Reasoner 输出格式已与 Schema 对齐（HTML 注释 → 结构化 JSON）。
- 占位符定义已新增至 self-play-protocol.md。
- `templates/creation-context.md` 已创建并交叉引用。
- `openai.yaml` 已解释——跨 Agent 兼容性约定，新增"Agent Compatibility"章节说明。

## Key Changes Since Last Evaluation

1. 新增 ~60 行：步骤 6a-6d、通用技能自博弈章节、5 个检查点行、5 个 Do Not 条目。
2. 新增 `references/self-play-protocol.md`（~470 行角色提示与算法）。
3. 新增 4 个 JSON Schema（challenger、reasoner、judge、cross-time-replay）。
4. Darwin 排除列表新增 `_evolution` 目录。
5. Reasoner 输出格式从自然语言修正为结构化 JSON。
6. 占位符定义章节已新增。

## Residual Risk

自博弈协议从未在真实技能上端到端执行过——所有角色提示均为"冷"写的，未经经验调优。首次实战可能揭示提示措辞、Schema 约束或占位符填充方面的问题。建议在非关键技能上先进行一次试运行，然后将经验教训反哺给协议。
