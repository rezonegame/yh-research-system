# 🧠 YH Research Skill System / 研究技能系统

[English](#english) | [中文](#chinese)

---

## <a name="english"></a>English

A self-contained, copyable local research skill system designed for Claude Code. This system transforms Claude Code into an academic research production pipeline: Research → Analysis → Evaluation → Skill Production → Skill Evolution.

### Core Loop

```
Research ──▶ Analysis ──▶ Evaluation ──▶ Skill Production ──▶ Skill Evolution ──▶ Research
   │             │              │                │                   │               │
   └────────────────────────────┴────────────────┴───────────────────┴───────────────┘
                                    Iterative Loop
```

### Active Entrypoints

| Entrypoint | Purpose | Use When |
|---|---|---|
| `research-workflow` | Research questions, literature search, OpenAlex/PubMed/arXiv discovery, synthesis, hypothesis generation, study design, delivery | 文献综述, 研究问题, 研究设计, 假设生成, 学术检索, 引文验证 |
| `analysis-workflow` | Data analysis, statistics, R workflows, regression, power analysis, APA-style results | 数据分析, 统计分析, 回归, 方差分析, R代码, 功效分析 |
| `evaluation-workflow` | Paper review, research rigor, risk of bias, proofreading, visual audit, slide QA, quality gates | 评价, 审查, 批判性分析, proofread, review, audit, QA |
| `skill-factory` | Create new general skills and perspective skills; retire/archive perspectives | 造skill, 创建技能, 沉淀流程, 蒸馏人物视角 |
| `darwin-skill` | Evaluate, score, optimize, and evolve skills with test prompts and rollback | 达尔文, skill评分, skill质量检查, 自动优化 |
| `perspective-library` | Route requests to 20+ person/thinking-style perspective skills | 用某某视角, 某人会怎么看, perspective, 思维方式 |
| `lecture-slides` | Beamer, LaTeX, Quarto RevealJS, TikZ extraction, bibliography validation, slide QA, deployment | Create, compile, convert, audit, or deploy lecture slides |

### Perspective Library (20+ Perspectives)

| Perspective | Best Used For |
|---|---|
| **Feynman** (费曼) | Explanation quality, anti-self-deception, demonstration-based understanding |
| **Munger** (芒格) | Decision review, incentives, cognitive bias, multidisciplinary thinking |
| **Elon Musk** (马斯克) | Cost teardown, first principles, aggressive iteration, vertical integration |
| **Karpathy** (卡帕西) | AI engineering realism, learning by building, LLM capability boundaries |
| **Ilya Sutskever** | AI research taste, technical direction, safety strategy |
| **Naval** (纳瓦尔) | Leverage, specific knowledge, wealth, desire management |
| **Paul Graham** | Startups, writing, product judgment, life choices |
| **Steve Jobs** (乔布斯) | Product taste, focus, design, narrative, simplification |
| **Taleb** (塔勒布) | Tail risk, antifragility, precaution, barbell strategy |
| **MrBeast** | YouTube/video growth, CTR, retention, hook, thumbnail optimization |
| **Jan Gehl** (扬·盖尔) | Public life, walkability, human-scale urban design |
| **Cui Kai** (崔愷) | Chinese architecture, local design, public buildings, urban renewal |
| **Zhang Yiming** (张一鸣) | Product, organization, global growth, talent, long-term learning |
| **Trump** (特朗普) | Negotiation, power signaling, media narrative, behavior prediction |
| **Sun Yuchen** (孙宇晨) | Attention economy, hype, crisis PR, narrative manipulation |
| **Zhang Xuefeng** (张雪峰) | Education choice, major selection, career planning, class mobility |
| And more... | (20+ perspectives total) |

### Internal Areas

| Directory | Purpose |
|---|---|
| `_system/` | Index, routing, naming, migration, output-path rules |
| `_shared/` | Reusable rubrics, templates, scripts, schemas |
| `_archive/` | Deprecated skills, examples, and legacy material |

### Module Containers

Each workflow contains `modules/` with preserved specialized skills:

- **research-workflow/modules/**: literature-review, scientific-writing, hypothesis-generation, openalex-database, denario, venue-templates, scientific-schematics, academic-delivery, interview-me, research-ideation, research-intake, lit-review
- **analysis-workflow/modules/**: data-analysis, statistical-analysis, review-r
- **evaluation-workflow/modules/**: scientific-critical-thinking, review-paper, devils-advocate, proofread, pedagogy-review, qa-quarto, slide-excellence, visual-audit, research-qa-loop
- **lecture-slides/modules/**: create-lecture, compile-latex, translate-to-quarto, extract-tikz, deploy, validate-bib

### Quick Start

1. Copy `.claude/skills/` to your project
2. Use `_system/ROUTING.md` to decide which skill to invoke
3. Start with the entrypoint closest to your deliverable
4. Run `darwin-skill` in evaluation-only mode on one low-risk skill first

### Migration

Copy one directory to migrate:

```text
.claude/skills/
```

See `_system/MIGRATION.md` for detailed instructions.

---

## <a name="chinese"></a>中文

一个自包含、可复制的本地研究技能系统，专为 Claude Code 设计。将 Claude Code 转变为学术研究生产流水线：研究 → 分析 → 评估 → 技能生产 → 技能进化。

### 核心循环

```
研究 ──▶ 分析 ──▶ 评估 ──▶ 技能生产 ──▶ 技能进化 ──▶ 研究
  │         │         │           │              │         │
  └────────────────────┴───────────┴──────────────┴─────────┘
                              迭代循环
```

### 核心入口

| 入口 | 用途 | 触发场景 |
|---|---|---|
| `research-workflow` | 研究问题、文献检索、OpenAlex/PubMed/arXiv 发现、综合、假设生成、研究设计、成果交付 | 文献综述、研究问题、研究设计、假设生成、学术检索、引文验证 |
| `analysis-workflow` | 数据分析、统计分析、R 工作流、回归、功效分析、APA 格式结果 | 数据分析、统计分析、回归、方差分析、R代码、功效分析 |
| `evaluation-workflow` | 论文评审、研究严谨性、偏倚风险、校对、视觉审查、幻灯片 QA、质量门禁 | 评价、审查、批判性分析、proofread、review、audit、QA |
| `skill-factory` | 创建新通用技能和人物视角技能；退休/归档视角 | 造skill、创建技能、沉淀流程、蒸馏人物视角 |
| `darwin-skill` | 使用测试提示和回滚机制评估、评分、优化和进化技能 | 达尔文、skill评分、skill质量检查、自动优化 |
| `perspective-library` | 将请求路由到 20+ 人物/思维风格视角技能 | 用某某视角、某人会怎么看、perspective、思维方式 |
| `lecture-slides` | Beamer、LaTeX、Quarto RevealJS、TikZ 提取、参考文献验证、幻灯片 QA、部署 | 创建、编译、转换、审查或部署教学幻灯片 |

### 视角库（20+ 人物视角）

| 视角 | 最佳用途 |
|---|---|
| **费曼** | 解释质量、反自我欺骗、基于演示的理解 |
| **芒格** | 决策审查、激励机制、认知偏差、跨学科思维 |
| **马斯克** | 成本拆解、第一性原理、激进迭代、垂直整合 |
| **卡帕西** | AI 工程现实主义、通过构建学习、LLM 能力边界 |
| **Ilya Sutskever** | AI 研究品味、技术方向、安全策略 |
| **纳瓦尔** | 杠杆、特定知识、财富、欲望管理 |
| **Paul Graham** | 创业、写作、产品判断、人生选择 |
| **乔布斯** | 产品品味、专注、设计、叙事、简化 |
| **塔勒布** | 尾部风险、反脆弱、预防原则、杠铃策略 |
| **MrBeast** | YouTube/视频增长、CTR、留存、钩子、缩略图优化 |
| **扬·盖尔** | 公共生活、步行友好、人性化城市设计 |
| **崔愷** | 中国建筑、本土设计、公共建筑、城市更新 |
| **张一鸣** | 产品、组织、全球增长、人才、长期学习 |
| **特朗普** | 谈判、权力信号、媒体叙事、行为预测 |
| **孙宇晨** | 注意力经济、炒作、危机公关、叙事操纵 |
| **张雪峰** | 教育选择、专业选择、职业规划、阶层流动 |
| 更多... | （共 20+ 人物视角） |

### 内部区域

| 目录 | 用途 |
|---|---|
| `_system/` | 索引、路由、命名、迁移、输出路径规则 |
| `_shared/` | 可复用评估标准、模板、脚本、模式 |
| `_archive/` | 已弃用技能、示例和遗留材料 |

### 模块容器

每个工作流入口包含 `modules/` 目录，存放保留的专业技能：

- **research-workflow/modules/**: literature-review（文献综述）、scientific-writing（科学写作）、hypothesis-generation（假设生成）、openalex-database（学术数据库）、denario（研究管线）、venue-templates（投稿模板）、scientific-schematics（科学示意图）、academic-delivery（学术交付）、interview-me、research-ideation（研究构思）、research-intake（研究输入）、lit-review
- **analysis-workflow/modules/**: data-analysis（数据分析）、statistical-analysis（统计分析）、review-r（R 代码审查）
- **evaluation-workflow/modules/**: scientific-critical-thinking（科学批判思维）、review-paper（论文评审）、devils-advocate（魔鬼代言人）、proofread（校对）、pedagogy-review（教学法审查）、qa-quarto（Quarto QA）、slide-excellence（幻灯片卓越）、visual-audit（视觉审查）、research-qa-loop（研究 QA 循环）
- **lecture-slides/modules/**: create-lecture（创建讲义）、compile-latex（编译 LaTeX）、translate-to-quarto（转换到 Quarto）、extract-tikz（提取 TikZ）、deploy（部署）、validate-bib（验证参考文献）

### 快速开始

1. 将 `.claude/skills/` 复制到你的项目中
2. 使用 `_system/ROUTING.md` 决定调用哪个技能
3. 从最接近你交付目标的入口开始
4. 先在低风险技能上以评估模式运行 `darwin-skill`

### 迁移

复制一个目录即可迁移整个系统：

```text
.claude/skills/
```

详细说明见 `_system/MIGRATION.md`。

---

## License / 许可

This project is open-source research infrastructure. Use freely, adapt as needed. / 本项目为开源研究基础设施，可自由使用和适配。
