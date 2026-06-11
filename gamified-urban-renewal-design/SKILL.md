---
name: gamified-urban-renewal-design
description: |
  Strong-guidance methodology skill for designing complete gamification-based urban renewal, urban design, public-space regeneration, heritage-block revitalization, 15-minute neighbourhood, playful participation, Minecraft/Block-by-Block workshop, serious-game planning, co-creation, or playable city projects. Use this skill whenever the user asks for 游戏化城市更新, 游戏化城市设计, 严肃游戏规划, Minecraft参与式设计, 城市更新共创, 可玩城市, 历史街区活化, 公共空间改造, 15分钟社区共创, 城市设计工作坊, 居民参与方案, or any complete project plan that uses game/play as a methodology rather than decoration.
version: 0.2.0
---

# Gamified Urban Renewal Design

Use this skill as a complete scheme factory for gamification-based urban renewal and urban design. It converts fragmented site information, policy goals, community needs, cultural-tourism assets, operational constraints, and research materials into a guided set of classified documents and one integrated master proposal.

This skill is intentionally strong-guidance: do not merely give advice. Lead the user through diagnosis, method selection, document production, implementation planning, and quality gates.

## Operating Principle

Treat gamification as a planning method, not as a cosmetic engagement trick.

The game layer must help participants:

1. understand a place and its constraints;
2. express needs without needing professional drawing language;
3. test scenarios safely and cheaply;
4. negotiate conflicts among roles, resources, values, and spatial trade-offs;
5. generate evidence that planners can translate into feasible design, governance, budget, and phasing decisions.

Every output should connect play to implementation. A proposal that ends at "fun workshop ideas" is incomplete.

v0.2 adds a stricter evidence-to-action chain:

1. evidence gate: separate official facts, field observations, resident memory, platform data, and design assumptions;
2. game gate: only choose mechanics that answer a planning or operation question;
3. translation gate: convert every game output into spatial, governance, budget, heritage, or operation decisions;
4. return gate: show how residents, local merchants, cultural stewards, and visitors benefit without over-commercializing the place;
5. verification gate: score the proposal and name missing materials before calling it complete.

## Default Interaction Mode

When the user's input is incomplete, ask up to 3 focused questions, then still produce a provisional scaffold with assumptions clearly marked.

Default questions:

1. What site type is this: historic block, public space, waterfront, campus, village, industrial reuse, informal settlement, mobility corridor, or neighbourhood?
2. What is the main project goal: participation, design generation, heritage interpretation, conflict mediation, implementation prioritization, education, tourism activation, or governance capacity?
3. What delivery depth is needed: quick concept, workshop package, full project proposal, funding-ready report, or implementation manual?

If the user asks for a full方案, produce the full classified document set by default.

## Evidence Routing

Read `references/methodology.md` when the task is broad, strategic, or asks for a complete plan.

Read `references/source-map.md` when the user asks for research basis, citations, material provenance, or when making a high-stakes methodological claim.

Read `references/evidence-matrix.md` when the task involves academic grounding, source triage, or when the user asks whether the skill has internalized the chunk corpus.

Read `references/lightweight-local-ops.md` when the user asks for low-staff, low-equipment, cultural-tourism, merchant-linked, route-based, or resident-memory-oriented implementation.

Use templates when creating formal deliverables:

- `templates/project-brief.md`
- `templates/stakeholder-map.md`
- `templates/game-design-canvas.md`
- `templates/workshop-protocol.md`
- `templates/design-translation-matrix.md`
- `templates/final-masterplan-report.md`
- `templates/material-request-list.md`
- `templates/resident-memory-protocol.md`
- `templates/lightweight-operations-plan.md`
- `templates/quality-gate-report.md`

## Project Typology Router

Choose one primary type, then add secondary layers as needed.

| User context | Primary mode | Emphasis |
|---|---|---|
| Historic district, old town, heritage street, cultural tourism | Heritage Renewal Game | Historic layering, authenticity, resident memory, visitor pressure, conservation boundary |
| Park, square, street, waterfront, market, playground | Public Space Co-Design Game | Access, safety, comfort, activity mix, inclusive participation, maintenance |
| 15-minute city, neighbourhood services, mobility transition | Neighbourhood Trade-off Game | Daily needs, walkability, mobility hub, land-use mix, persona conflicts |
| Smart city, digital twin, GIS, 3D model, game engine | Digital Twin Simulation Game | Data layer, model resolution, scenario testing, co-evaluation, privacy |
| Informal settlement, youth participation, marginalized residents | Low-Barrier Participation Game | Accessibility, trust, non-professional expression, representative sampling |
| Culture-led regeneration, tourism, creative district | Cultural Activation Game | Place identity, local enterprise, interpretation, risk of commodification |
| Security, resilience, climate adaptation, disaster risk | Scenario Stress-Test Game | Role-play, constraints, shocks, preparedness, governance response |
| Early research or teaching | Methodology Explainer | Framework, cases, evidence map, limitations |

## Full Scheme Workflow

Use this workflow for medium or complex tasks. Keep the user moving; do not wait for perfect data.

### 1. Project Specification

Produce a project brief with:

- site and boundary;
- current problems;
- target groups;
- planning status;
- policy or funding context;
- hard constraints: land ownership, heritage protection, budget, schedule, permissions, accessibility, data/privacy, political conflicts;
- desired deliverables;
- assumptions and missing information.

Always create a missing-material ledger for real projects. Put official maps/floorplans, merchant lists, heritage boundaries, resident memories, policy approvals, image permissions, and field photos into separate rows. Mark each row as `verified`, `public-source only`, `working assumption`, or `must request`.

### 2. Place Diagnosis

Diagnose the place through five lenses:

1. Spatial: morphology, access, public/private edges, land use, mobility, ecological conditions.
2. Social: resident groups, vulnerable users, everyday routines, conflict, trust, memory.
3. Cultural/Historic: tangible heritage, intangible practices, identity, authenticity, tourism pressure.
4. Economic/Governance: owners, operators, local businesses, funding, maintenance, regulatory authority.
5. Playability: what can be safely simplified into roles, maps, tokens, cards, rules, scenarios, or digital models.

For projects with cultural tourism potential, add a sixth lens:

6. Cultural-tourism fit: visitor journey, interpretive assets, local business capacity, seasonal flow, night economy, carrying capacity, benefit-sharing, and risk of displacing everyday life.

For projects in historic blocks or lived-in neighbourhoods, add a seventh lens:

7. Memory and everyday-life fit: what memories can be publicly shared, what should remain private, which routines must not be displaced, and how visitors can learn without turning residents into exhibits.

### 3. Method Selection

Select one or more game forms:

| Game form | Best for | Avoid when |
|---|---|---|
| Analogue board/map game | Low-cost co-design, workshops, mixed digital literacy | Real-time 3D spatial perception is essential |
| Minecraft/voxel co-design | Non-professional spatial expression, youth, public-space visualization | Licenses, hardware, facilitation, or technical prep are unavailable |
| Digital twin/game-engine walkthrough | Scenario visualization, expert-public co-evaluation | Data accuracy, privacy, cost, or maintenance cannot be managed |
| Role-play negotiation | Stakeholder conflict, governance, funding, trade-offs | Roles would expose or inflame sensitive identities |
| Card-based value and intervention game | Quick ideation, prioritization, values clarification | Final design needs detailed geometry |
| Location-based heritage game | Cultural interpretation, visitor learning, memory collection | It would turn living heritage into superficial tourism spectacle |
| Scenario stress-test game | Resilience, safety, climate, mobility transition | The problem is already solved technically and needs implementation management |

Use the smallest adequate medium:

- If the decision is about values, conflicts, or priorities, prefer cards, maps, tokens, and facilitated debriefing.
- If the decision is about spatial imagination by non-professionals, consider Minecraft/voxel tools only when hardware, facilitation, and translation capacity exist.
- If the decision is about scenario comparison or operational simulation, consider GIS/digital twin/game engines only when data quality, privacy, maintenance, and cost are credible.
- If the project asks for lightweight cultural-tourism operation, prefer paper passports, route cards, stamps, QR explanation pages, and merchant task cards before proposing apps, sensors, AR, or custom devices.

### 4. Game System Design

Design the game as a planning instrument:

- purpose: what planning decision the game informs;
- players: residents, youth, elders, merchants, visitors, officials, planners, operators;
- roles/personas: real participants when possible; personas only when actual users are unavailable or as empathy aids;
- board/world: real map, abstract grid, site model, Minecraft world, digital twin, or hybrid;
- objects: intervention cards, value cards, budget tokens, risk cards, service tiles, mobility pieces, heritage markers;
- rules: turn order, negotiation, placement/removal, resource constraint, voting, scenario shocks;
- feedback: scores, heat maps, satisfaction, conflict logs, facilitator notes, before/during/after surveys;
- debrief: what participants explain after play and how planners interpret it.

Balance complexity and playability. If participants cannot learn the rules quickly, the game becomes another expert barrier.

For each mechanic, write the planning reason:

| Mechanic | Must answer |
|---|---|
| Points or scores | What trade-off, priority, or feasibility signal do scores reveal? |
| Badges/stamps | What route completion, learning, or return behaviour do they support? |
| Leaderboards | Why competition will not exclude elders, children, merchants, or vulnerable groups |
| Quests | Which site asset, memory, service gap, or spatial issue they reveal |
| Role cards | Which real stakeholder conflict they safely surface |
| Budget/space tokens | Which scarcity and implementation constraint they make visible |
| Scenario shocks | Which resilience, safety, crowding, or governance risk they test |

### 5. Participation and Workshop Protocol

Create a workshop package:

- stakeholder map and recruitment logic;
- representative sample target;
- accessibility and inclusion plan;
- consent, photo/video, data protection, and civility rules;
- agenda and facilitator roles;
- site walk or observation protocol;
- game learning activity;
- co-design session;
- group presentation;
- prioritization;
- debrief and post-workshop survey;
- documentation plan.

If resident memory is used, include:

- consent level: private note, anonymized quote, public display, or no use;
- memory sensitivity: everyday, commercial, conflict-related, displacement-related, or heritage-related;
- verification: one-person memory, multiple memories, archival support, or field-observation support;
- transformation rule: what can become a route prompt, game card, exhibition text, design requirement, or governance issue.

### 6. Design Translation

Translate game outputs into planning language:

| Game output | Translate into |
|---|---|
| Frequently placed elements | Program demand, spatial priority, service gap |
| Removed or rejected elements | Conflict, low desirability, maintenance concern, cultural mismatch |
| Role/persona satisfaction | Equity and user-group impact |
| Negotiation alliances | Shared value clusters and possible coalition |
| Repeated conflict | Design trade-off requiring policy or governance decision |
| Map clusters | Spatial zoning, activity node, route, edge, buffer, or heritage layer |
| Scenario failure | resilience gap, operational risk, cost risk |
| Participant narrative | intangible heritage, memory, fear, aspiration, identity |

Never treat game votes as final design authority by themselves. Use them as structured evidence to be checked against feasibility, equity, heritage, environment, budget, and governance.

Add an operation translation for lightweight cultural-tourism schemes:

| Gameplay/visit signal | Translate into |
|---|---|
| Unfinished routes | Route too long, unclear signage, weak reward, or poor comfort |
| Repeated merchant drop-off | Bad task fit, staff burden, poor location, or weak benefit |
| High photo-taking but low learning | Interpretation too superficial |
| High visitor use near heritage boundary | Carrying-capacity, queue, privacy, and conservation risk |
| Resident complaints | Governance issue, timing/noise problem, privacy breach, or benefit imbalance |
| Repeat participation | Viable return-loop content, membership, seasonal program, or community stewardship |

### 7. Integrated Master Proposal

For a full方案, produce:

1. Executive summary.
2. Background and site diagnosis.
3. Methodology and evidence basis.
4. Stakeholder and participation strategy.
5. Game system design.
6. Workshop and engagement plan.
7. Spatial design strategy.
8. Program and activity strategy.
9. Heritage/culture strategy where relevant.
10. Digital/analogue tool strategy.
11. Implementation phasing.
12. Budget and resource logic.
13. Governance, operation, and maintenance.
14. Monitoring and evaluation.
15. Risks, ethics, and mitigation.
16. Appendices: templates, workshop sheets, game cards, scoring rubric, translation matrix.

If the project has 文旅属性, add:

17. Cultural-tourism activation strategy: storylines, routes, participatory interpretation, local enterprise links, event/game operations, visitor-resident balance, carrying capacity, revenue/benefit logic, and anti-over-commercialization safeguards.

## Classified Document Outputs

When the user asks for complete functionality, produce or offer to produce this document set:

| Document | Purpose |
|---|---|
| `01-project-brief.md` | Scope, goals, constraints, assumptions |
| `02-site-diagnosis.md` | Spatial/social/cultural/economic/playability diagnosis |
| `03-stakeholder-map.md` | Actors, recruitment, power-interest matrix, inclusion risks |
| `04-game-design-canvas.md` | Game purpose, rules, roles, components, feedback |
| `05-workshop-protocol.md` | Agenda, facilitation, materials, consent, records |
| `06-game-materials.md` | Cards, tokens, boards, persona sheets, score sheets |
| `07-design-translation-matrix.md` | Convert gameplay evidence into design actions |
| `08-masterplan-strategy.md` | Spatial, cultural, mobility, ecology, program, governance strategy |
| `09-implementation-roadmap.md` | Phasing, budget bands, responsible parties, dependencies |
| `10-monitoring-evaluation.md` | Before/during/after indicators and learning loop |
| `11-risk-ethics-checklist.md` | Participation, privacy, equity, heritage, feasibility risks |
| `12-final-masterplan-report.md` | Polished integrated proposal |
| `13-cultural-tourism-activation.md` | Optional but recommended for 文旅 projects: routes, stories, operations, local business, visitor management |
| `14-material-request-list.md` | Official maps, merchant lists, heritage boundaries, resident memory, image permissions, data, approvals |
| `15-resident-memory-protocol.md` | Interview plan, consent, memory cards, public/private boundary, transformation rules |
| `16-lightweight-operations-plan.md` | Low-staff, low-equipment operating model, route/passport/stamp/QR system, merchant burden, return loops |
| `17-quality-gate-report.md` | Scores, evidence gaps, repair loop, release decision |

If writing files, use these names unless the user requests another naming scheme.

## Quality Gates

Score every complete proposal on five 0-100 dimensions:

1. Research rigor: uses relevant method and source evidence; avoids unsupported claims.
2. Planning coherence: site diagnosis, game system, design strategy, and implementation align.
3. Participation integrity: representative, accessible, ethical, and not tokenistic.
4. Design implementability: feasible phasing, budget logic, ownership/governance, maintenance.
5. Delivery usability: classified documents are complete enough for the next real meeting.

For local cultural-tourism projects, add a sixth scored dimension:

6. Local cultural-tourism fit: the proposal uses site-specific stories, local actors, visitor journeys, resident benefit, authenticity protection, operational feasibility, and avoids generic scenic-spot packaging.

For lightweight operation projects, add a seventh scored dimension:

7. Operational lightness: the scheme minimizes staff load, device dependency, merchant friction, maintenance cost, and data burden while preserving meaningful participation and return-loop value.

Default gate:

- 60: exploratory concept only.
- 80: commit-ready internal proposal.
- 90: publish/funding-ready proposal.
- 95: excellent, with strong evidence, tested tools, and polished deliverables.

If below the requested gate, enter a repair loop: name the weakest dimensions, propose fixes, and revise the relevant sections.

Release labels:

- `exploratory`: public evidence is thin, but the concept can guide research.
- `internal-ready`: sufficient for team discussion and material requests.
- `co-creation-ready`: includes workshop protocol, consent, recruitment, and translation plan.
- `pilot-ready`: includes tested route/game materials, operations owner, merchant commitment, and risk controls.
- `publish-ready`: includes verified sources, permissions, visual assets, resident-memory consent, and quality score >= 90.

## Red Flags

Stop and ask for clarification or add a warning when:

- participation is promised but no implementation path exists;
- the game asks residents for unpaid labor without influence;
- vulnerable groups are represented only by imagined personas when direct engagement is possible;
- heritage is reduced to tourism decoration;
- a digital twin is proposed without data, budget, privacy, or maintenance capacity;
- game scores are treated as objective public preference;
- conflict is hidden instead of documented and mediated;
- the scheme cannot explain how game outputs become design decisions.
- cultural tourism is added only as slogans, photo spots, IP packaging, or visitor traffic without resident benefit and heritage safeguards.

## Do Not

- Do not answer with generic gamification advice when the user needs a project scheme.
- Do not use points, badges, leaderboards, or competitions unless they serve a planning purpose.
- Do not call a workshop participatory if residents only validate pre-decided options.
- Do not recommend digital tools just because they are impressive; justify them through accessibility, cost, and decision value.
- Do not let playfulness override heritage conservation, equity, safety, or implementation constraints.
- Do not claim all source chunks are clean; `references/source-map.md` notes known noisy material.
