# Source Map

This file maps the local chunk corpus into method components for this skill. It is not a full bibliography; it is a practical evidence guide for when to read source chunks.

Source root:

```text
C:\AgentTest\Anything2Ontology\output\chunks
```

Index:

```text
C:\AgentTest\Anything2Ontology\output\chunks\chunks_index.json
```

Corpus scale observed during creation:

- 466 indexed chunks observed in the v0.2 learning pass.
- About 2.3M estimated tokens.
- Topics include serious games, gamification, Minecraft/Block by Block, participatory planning, playable cities, public space, urban regeneration, cultural heritage, digital twin, tourism, and 15-minute neighbourhoods.

## Primary Method Sources

| Method component | Key sources | Use for |
|---|---|---|
| Serious games in spatial planning | `Sousa_2022_Serious_Games_in_Spatial_Planning_IJSG_*`, `Sousa_2024_Analog_Serious_Games_Sustainable_Collaborative_Planning_MDPI_*`, `Ampatzidou_et_al_2018_Work_and_No_Play_*` | Strengths, limitations, frameworks, debriefing, MDA/DPE/PLEX-CIVIC, analogue vs digital |
| Minecraft participatory design | `UNHabitat_Block_by_Block_Playbook_2021_*`, `UN_Block_by_Block_Methodology_Report_*`, `Delaney_2022_Minecraft_and_Playful_Public_Participation_*`, `Johansen_Pedersen_2019_Gamified_Participation_Minecraft_Aalborg_*` | Three-phase workshop, 16 activities, representative sampling, site walk, Minecraft co-design, expert design studio, validation |
| Low-cost digital twin workflow | `Low_Cost_Gamified_Urban_Planning_Methodology_2023_MDPI_*` | Data layer, design layer, game layer, pilot/evaluation layer, OSM/GIS/Blender/game-engine workflow |
| Playable city and participatory systems | `Playable_City_Design_Framework_Frontiers_2020_*`, `Sena_et_al_2025_Playful_Participatory_Planning_System_MDPI_*`, `Opening_up_Smart_Cities_Citizen_Centric_GIScience_MDPI_*` | Inclusive city-making, player-generated spatial data, participation systems |
| 15-minute neighbourhood games | `Garritsen_et_al_2025_15_Minute_Neighbourhood_Serious_Game_*` | Persona cards, service tiles, action dice, satisfaction scoring, neighbourhood trade-off games |
| Heritage and conservation constraints | `UNESCO_2011_Historic_Urban_Landscape_Recommendation_*`, `ICOMOS_2011_Valletta_Principles_Historic_Cities_*`, `Getty_2015_Principles_for_Conservation_of_Heritage_Sites_in_China_*`, `HUB_IN_2025_Historic_Urban_Areas_Leadership_Guide_*` | Historic layering, tangible/intangible values, civic engagement, knowledge tools, regulatory/financial tools |
| Heritage/culture-led regeneration cases | `Lei_2021_Datong_Heritage_Tourism_Led_Urban_Renewal_PhD_Thesis_*`, `Lei_et_al_2022_Heritage_Tourism_Led_Urban_Renewal_Datong_MDPI_*`, `Martins_2022_Culture_led_Urban_Regeneration_Marvila_ROCK_*`, `Benghida_2024_Viaduc_des_Arts_Adaptive_Reuse_Placemaking_*` | Renewal cases, tourism pressure, adaptive reuse, culture-led regeneration |
| Cultural heritage gamification | `Marques_et_al_2023_Gamification_Cultural_Heritage_SLR_MDPI_*`, `Serious_Games_Cultural_Heritage_Location_Based_Games_2023_MDPI_*`, `VR_Games_Cultural_Heritage_2022_MDPI_*`, `Wang_et_al_2024_Gamifying_Cultural_Heritage_Immersive_Virtual_Exhibitions_*` | Heritage interpretation, location-based games, VR/immersive exhibitions, visitor learning |

## Evidence Patterns Internalized

### Serious Games

Repeated pattern:

- Strengths: experimentation, engagement, collaboration, complexity.
- Limitations: inconsistency, oversimplification, distrust, cost.
- Practical implication: always include a feasibility and ethics gate; do not let gameplay substitute for planning judgment.

### Block by Block

Repeated pattern:

- Planning: site selection, finance, technical prerequisites, operations.
- Workshop: opening, site walk, shared vision, Minecraft learning, co-creation, presentation, prioritization, closing.
- Implementation: expert design studio, validation meeting, inclusive implementation, monitoring/evaluation.

Practical implication: every participatory game needs pre-work, facilitated play, expert translation, validation, and implementation closure.

### Low-Cost Digital Twin

Repeated pattern:

- Data sources: GIS, DEM/DTM, satellite, OSM, user-generated 3D assets.
- Workflow: reconstruct digital twin, import into game engine, design/navigate/evaluate, share demo for co-evaluation.
- Legal/ethics/data protection are explicit constraints.

Practical implication: recommend digital twin only when the project can support data preparation and when the model helps decision-making.

### Heritage Urban Landscape

Repeated pattern:

- Urban heritage includes social, cultural, economic, natural, built, visual, and intangible layers.
- Civic engagement, knowledge/planning tools, regulatory systems, and financial tools belong together.

Practical implication: heritage gamification must protect identity and daily life, not only create tourism experience.

### 15-Minute Neighbourhood Game

Repeated pattern:

- Analogue games can reveal service preferences and trade-offs.
- Personas, service tiles, action rules, satisfaction scoring, and facilitator observation produce analyzable data.
- Risks include oversimplified boards, overly easy consensus, and generic goals that are hard to evaluate.

Practical implication: include scarcity, clear role goals, and debriefing so the game reveals trade-offs.

## Known Corpus Issues

Some chunks contain extraction noise or irrelevant scraped pages. During creation, `Deterding_et_al_2011_From_Game_Design_Elements_to_Gamefulness_chunk_001.md` appeared to contain unrelated University of Waterloo webpage content rather than the expected paper. Treat such chunks as unusable unless manually verified.

When a source looks corrupted:

1. do not use it as evidence;
2. rely on clean adjacent sources;
3. note the limitation if the user asks for provenance.

## Recommended Reading by Task

For a complete方案:

1. `UNHabitat_Block_by_Block_Playbook_2021_chunk_001.md`
2. `Low_Cost_Gamified_Urban_Planning_Methodology_2023_MDPI_chunk_005.md`
3. `Low_Cost_Gamified_Urban_Planning_Methodology_2023_MDPI_chunk_006.md`
4. `Low_Cost_Gamified_Urban_Planning_Methodology_2023_MDPI_chunk_007.md`
5. `Sousa_2022_Serious_Games_in_Spatial_Planning_IJSG_chunk_001.md`
6. `UNESCO_2011_Historic_Urban_Landscape_Recommendation_chunk_001.md`

For Minecraft/public-space work:

1. `UNHabitat_Block_by_Block_Playbook_2021_chunk_001.md`
2. `UNHabitat_Block_by_Block_Playbook_2021_chunk_002.md`
3. `UNHabitat_Block_by_Block_Playbook_2021_chunk_003.md`
4. `UN_Block_by_Block_Methodology_Report_chunk_001.md`

For analogue games:

1. `Sousa_2024_Analog_Serious_Games_Sustainable_Collaborative_Planning_MDPI_*`
2. `Garritsen_et_al_2025_15_Minute_Neighbourhood_Serious_Game_*`
3. `Tan_2022_Network_of_Games_Urban_Planning_*`

For heritage/culture-led renewal:

1. `UNESCO_2011_Historic_Urban_Landscape_Recommendation_chunk_001.md`
2. `ICOMOS_2011_Valletta_Principles_Historic_Cities_*`
3. `Lei_et_al_2022_Heritage_Tourism_Led_Urban_Renewal_Datong_MDPI_*`
4. `Martins_2022_Culture_led_Urban_Regeneration_Marvila_ROCK_*`

## v0.2 Evidence Additions

Read `evidence-matrix.md` for the second learning pass and quantified theme coverage. The most important upgrade implications are:

1. Treat material availability as a first-class design variable. Real projects need official maps, merchant lists, heritage boundaries, resident-memory consent, image permissions, and field observations before publication.
2. Treat lightweight operation as a design discipline, not a simplified afterthought. Route cards, stamps, QR pages, merchant task cards, and monthly prompts can outperform custom apps when staffing and maintenance are limited.
3. Treat resident memory as consent-bound evidence. It may become route content, design requirement, or governance issue only after its public/private boundary is clear.
4. Treat digital tools as conditional. The corpus contains many digital references, but high mention volume does not justify AR, VR, digital twin, or sensors without data quality, budget, privacy, and maintenance capacity.
