---
name: boardgame-design-methodology
description: |
  This skill should be used when the user asks to design, diagnose, prototype, test, balance, visually direct, publish, crowdfund, market, or teach a board game/tabletop game. Trigger on phrases such as 桌游设计, 设计一个桌游, 桌游机制, 卡牌机制, 工人放置, 原型测试, 平衡性调整, 桌游美术, 桌游出版, Kickstarter众筹, BGG运营, 桌游设计课, or 桌游从0到出版.
version: 0.1.0
---

# Boardgame Design Methodology

Use this skill as the complete board game design workflow from first concept to publication. It is based on the local methodology library under `references/methodology/`, distilled from BoardGameGeek designer logs and organized across inspiration, mechanisms, prototyping, visual design, publishing, marketing, and case studies.

## Operating Principle

Start from the user's actual design bottleneck, not from the full lifecycle by default. Route to the smallest relevant reference set, extract the method, then return an actionable artifact the designer can use in the next iteration.

Default stance:

1. Treat board game design as iterative craft: concept, prototype, test, simplify, retest.
2. Preserve theme-mechanism coherence: actions should happen where their effects make sense.
3. Diagnose player decisions before adding more content.
4. Separate signal from noisy feedback, especially when playtesters disagree.
5. Prefer fast, low-fidelity prototypes until the core loop is proven.
6. Keep publication, art, and marketing advice tied to the current maturity of the design.

## Stage Map

Use the lifecycle as a stage router, not as a required lecture sequence:

| Stage | Focus | Primary output | Continue when |
|---|---|---|---|
| 01 Concept and Experience | Audience, table situation, fantasy, emotion, design pillars, core loop | Concept brief or experience hypotheses | Player promise, target situation, complexity limit, and core loop are explicit. |
| 02 Mechanics and Systems | Decision engine, turn flow, scoring, interaction, information, end condition | Playable rules skeleton or mechanism variants | The rules can be operated with physical components and tested at the table. |
| 03 Prototype and Test | Prototype scope, test question, playtest ladder, balance, iteration log | Playtest plan, observation sheet, change log | The test answers a specific question and produces evidence for the next change. |
| 04 Art and Production | Readability, component function, graphic hierarchy, artist brief, production constraints | Component manifest, art brief, production spec | Rules are stable enough that visual/production work will not be invalidated immediately. |
| 05 Publishing and Marketing | Publisher path, crowdfunding, convention, BGG, reviewers, community, distribution | Publishing roadmap or launch readiness audit | Stable blind-tested game, sell sheet, cost estimate, audience proof, and capacity are present. |

Do not force a user through all stages. Start at the stage implied by the bottleneck, then name upstream assumptions and downstream gates.

## Guided Coaching

When the user's input is incomplete, ask 1-3 focused questions and still provide a provisional artifact in the same response. The artifact may be a concept card, mechanism candidate matrix, prototype plan, test protocol, component brief, or publishing readiness table. Treat the artifact as editable scaffolding, not as a final answer.

Convert vague taste words into tabletop constraints:

- "轻松" -> target duration, rule teach time, decision count, punishment severity.
- "策略" -> planning horizon, hidden information, scoring incentives, interaction pressure.
- "沉浸" -> action-theme mapping, table presence, narrative feedback, component affordance.
- "适合新人" -> setup time, icon load, turn options, player aid needs, first-round comprehension.

## Convergence Criteria

Use these gates before moving advice to the next stage:

| Move | Required evidence |
|---|---|
| Concept -> Mechanics | Target audience, play situation, emotional promise, design pillars, and one-sentence core loop are clear. |
| Mechanics -> Prototype | Legal actions, turn structure, win/end condition, information state, and minimum components are playable without designer improvisation. |
| Prototype -> Balance | The core loop is fun or at least promising; balance work is not compensating for a broken decision engine. |
| Prototype -> Art/Production | Rules and component taxonomy are stable enough that layout and art will not be reworked every test. |
| Stable Game -> Publishing/Marketing | Blind-test evidence, teachability, sell sheet, cost awareness, and audience proof exist. |

If a gate is missing, deliver the current-stage artifact and explicitly list what must be proven next.

## Tabletop Operability Gate

Every mechanism, component, or production recommendation must pass a physical tabletop check:

1. Can players teach it from a rulebook or player aid?
2. Can players execute it manually without excessive bookkeeping?
3. Does it fit table space, viewing distance, handling frequency, and component count?
4. Does it avoid unnecessary downtime, memory burden, and hidden state tracking?
5. Can the next prototype test it with cheap components before visual polish?

## Reference Routing

Read `references/methodology/设计方法.md` first when the task is broad, ambiguous, or asks for a complete process. Otherwise, route directly:

| User need | Read |
|---|---|
| Inspiration, concept, USP, no idea | `references/methodology/01-设计灵感与创意来源/` |
| Mechanism selection or mechanism design | `references/methodology/02-核心机制设计/` |
| Card systems, hand management, combos | `references/methodology/02-核心机制设计/01-卡牌机制.md` |
| Dice, probability, risk, push-your-luck | `references/methodology/02-核心机制设计/02-骰子机制.md`, `08-推手气机制.md` |
| Worker placement | `references/methodology/02-核心机制设计/03-工人放置.md` |
| Area control | `references/methodology/02-核心机制设计/04-区域控制.md` |
| Deck building | `references/methodology/02-核心机制设计/05-牌库构筑.md` |
| Cooperative games | `references/methodology/02-核心机制设计/06-合作机制.md` |
| Auction systems | `references/methodology/02-核心机制设计/07-拍卖机制.md` |
| Prototype, self-test, external test, iteration | `references/methodology/03-原型制作与测试/` |
| Balance and tuning | `references/methodology/03-原型制作与测试/05-平衡调整技巧.md` |
| Art direction, cards, icons, board, packaging | `references/methodology/04-美术与视觉设计/` |
| Publisher pitch, self-publishing, Kickstarter, fairs, distribution | `references/methodology/05-出版与发行/` |
| BGG, social media, reviews, fans, co-creation | `references/methodology/06-营销与社区/` |
| Designer precedents | `references/methodology/07-设计师案例库/` |
| Artist precedents | `references/methodology/08-艺术家案例库/` |
| Publisher precedents | `references/methodology/09-出版商案例库/` |

## Diagnostic Routing

When the user describes a problem rather than a known category, route by symptom:

| Symptom | Diagnosis path |
|---|---|
| "游戏无聊 / 单调 / 没有决策感" | Check core loop, interaction, constraints, and comparable designer cases. Read `02-核心机制设计/`, `01-设计灵感与创意来源/04-限制驱动创新.md`, and relevant `07-设计师案例库/` files. |
| "规则太复杂 / 教不动新人" | Read `03-原型制作与测试/04-迭代优化流程.md`; identify removable rules, edge cases, and non-core subsystems. |
| "机制和主题割裂 / 玩家出戏" | Read `01-设计灵感与创意来源/03-主题驱动设计.md`; map every major action to thematic cause and effect. |
| "游戏时长控不住" | Read `01-设计灵感与创意来源/04-限制驱动创新.md` and `03-原型制作与测试/05-平衡调整技巧.md`; diagnose turn count, action count, scoring tempo, and downtime. |
| "平衡性有问题 / 某策略太强" | Read `03-原型制作与测试/05-平衡调整技巧.md` and `03-原型制作与测试/03-外部测试策略.md`; separate math imbalance from learnability and table meta. |
| "测试反馈互相矛盾" | Read `03-原型制作与测试/03-外部测试策略.md`; classify feedback by player profile, repeated pattern, and observed behavior. |
| "美术方向不清楚" | Read `04-美术与视觉设计/01-风格确定与方向.md`, `04-美术与视觉设计/06-与艺术家协作.md`, and relevant artist cases. |
| "准备出版 / 众筹 / 展会" | Read `05-出版与发行/` plus `09-出版商案例库/`; match advice to prototype maturity and production capacity. |

## Workflow Modes

Choose one mode from the user's deliverable.

### Concept-to-Prototype Mode

Use when the user wants to design a new game.

1. Capture constraints: player count, target duration, audience, theme, desired tension, mechanism candidates, component limits, production ambition.
2. Choose design driver: personal experience, mechanism-first, theme-first, constraint-first, or fusion/improvement.
3. Define the core loop in one sentence.
4. Define the smallest playable prototype: components, turn structure, win condition, end condition, and testable question.
5. Identify the first three playtests and what each should prove or falsify.
6. Output a design brief and first prototype plan.

### Mechanism Design Mode

Use when the user asks about a specific mechanism.

1. Read the mechanism reference.
2. Explain the mechanism's promise, required tension, common failure modes, and design parameters.
3. Match the mechanism to the user's theme, audience, duration, and interaction needs.
4. Propose 2-4 concrete variants rather than one abstract answer.
5. Add a test checklist for the mechanism's likely failure points.

### Design Diagnosis Mode

Use when the user reports a failing prototype.

1. Restate the observed symptom and ask whether it is a playtest observation, a designer worry, or a repeated pattern.
2. Map the issue to decision density, rules overhead, theme coherence, pacing, balance, downtime, or production constraint.
3. Read only the matching diagnostic references.
4. Return likely causes ranked by evidence, then propose small experiments.
5. Avoid full redesign unless the core loop itself is unsupported.

### Playtest and Balance Mode

Use when the user needs testing or tuning.

1. Define current prototype maturity: concept, mechanism, balance, blind-test, pitch, or production prototype.
2. Specify the test question before specifying testers.
3. Separate self-test, guided external test, blind test, and stress test.
4. Define metrics: duration, rule questions, AP moments, dominant strategy, comeback frequency, score spread, emotional high points, and quit points.
5. Convert feedback into a change log with hypothesis, change, expected effect, observed result, and decision.

### Art and Production Mode

Use when the user needs visual direction or artist collaboration.

1. Identify what the art must do functionally: readability, theme, information hierarchy, component recognition, market signal, or mood.
2. Decide style direction only after mechanism and audience are clear.
3. Create a component priority list: board, cards, icons, player aids, cover, packaging.
4. Separate art brief, graphic design brief, and production specification.
5. Include collaboration risks: copyright, revision scope, file handoff, icon consistency, and production deadlines.

### Publishing and Marketing Mode

Use when the user asks about publishing, Kickstarter, fairs, distribution, BGG, reviews, or community.

1. Determine path: traditional publishing, self-publishing, crowdfunding, convention-first, or community-first.
2. Assess readiness: stable rules, blind-test record, sell sheet, prototype quality, cost estimate, fulfillment capacity, and audience proof.
3. Use publishing references for path-specific steps.
4. Output a staged roadmap with prerequisites, risks, and next actions.

### Teaching Mode

Use when the user asks for a board game design class, workshop, lesson, or training material.

1. Identify learner profile and session duration.
2. Choose one design problem rather than covering the entire lifecycle.
3. Convert methodology into activities: teardown, mechanism remix, paper prototype, playtest, critique, or pitch.
4. Include a concrete student output and assessment rubric.
5. Reuse examples from designer, artist, and publisher case references only when they directly support the learning goal.

## Output Templates

Use templates in `templates/` when the user asks for a document-like artifact:

- `templates/game-design-brief.md` for new game concepts.
- `templates/mechanism-diagnosis.md` for mechanism or prototype diagnosis.
- `templates/playtest-plan.md` for testing and balance plans.
- `templates/publishing-roadmap.md` for publication, Kickstarter, fair, and distribution planning.

If a template is not needed, still structure answers with: diagnosis, evidence from references, concrete actions, next test.

## Quality Gates

Before final delivery, self-check against these gates:

1. Reference fit: The answer used the smallest relevant reference set.
2. Lifecycle fit: Advice matches the design maturity, not an imagined finished product.
3. Actionability: The user has a concrete next playtest, design change, brief, or roadmap.
4. Evidence discipline: Claims from the methodology are tied to named files or case examples when specificity matters.
5. Risk handling: Major risks are surfaced, especially rules complexity, test validity, cost, art scope, and publication readiness.

For full Skill maintenance, `test-prompts.json` must cover concept, diagnosis, balance, art, publishing, and teaching scenarios.

## Do Not

- Do not answer broad board game design requests from general knowledge alone when a local reference file applies.
- Do not prescribe final art, manufacturing, or publishing steps before the game has a stable tested core.
- Do not treat every tester suggestion as a feature request.
- Do not add more mechanisms before diagnosing whether the core loop already creates meaningful decisions.
- Do not confuse article-writing tasks with this skill; route公众号/长文写作 tasks to `boardgame-writer` when the user's deliverable is prose publication rather than game design work.
- Do not hard-code absolute source paths in outputs; use this skill's local `references/methodology/` paths.
