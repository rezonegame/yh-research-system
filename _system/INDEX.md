# Skills System Index

## Active Entrypoints

- `research-workflow`
- `analysis-workflow`
- `evaluation-workflow`
- `skill-factory`
- `darwin-skill`
- `perspective-library`
- `lecture-slides`
- `boardgame-design-methodology`
- `gamified-urban-renewal-design`

## Perspective Production Standard

- Person/style perspectives are created through `skill-factory`.
- Default target is publish-ready unless the user explicitly requests stable or lightweight draft.
- Publish-ready requires six research lanes, triple-validated mental models, stronger bibliography, replay tests, unknown-topic tests, edge-case tests, independent fresh-context validation, and Darwin score >= 90.
- Perspective research methodology is stored in `perspective-library/references/extraction-framework.md`.
- Darwin evaluation records are stored in `darwin-skill/results.tsv` and `darwin-skill/results/cards/`.

## Module Containers

- `research-workflow/modules`: former research, literature, hypothesis, publication, and database skills.
- `analysis-workflow/modules`: former analysis, statistics, and R review skills.
- `evaluation-workflow/modules`: former review, QA, proofreading, rigor, and audit skills.
- `lecture-slides/modules`: former Beamer, Quarto, TikZ, bibliography, and deployment skills.
- `boardgame-design-methodology/references/methodology`: complete board game design lifecycle references from inspiration and mechanisms through prototyping, art, publishing, marketing, and cases.
- `gamified-urban-renewal-design`: complete gamification-based urban renewal, urban design, participatory planning, cultural-tourism activation, Minecraft/Block-by-Block, serious-game, and playable-city methodology.

## Archives

- `_archive/deprecated`: superseded generators and old entrypoints.
- `_archive/deprecated/perspectives`: retired person/style perspectives.
- `_archive/examples`: examples that should not act as active triggers.
- `_archive/legacy-skills`: useful old utility skills that are not part of the research core.

## Update Rules

When a new skill is created:

1. Add it to this index.
2. Add a `test-prompts.json`.
3. Keep all scripts, templates, and references inside its own directory unless they are truly shared.
4. If it is a person perspective, also follow `perspective-library/references/extraction-framework.md` and update `perspective-library/INDEX.md`.
5. If it is publish-ready, record fresh-context validation and Darwin score >= 90.

When a perspective is retired:

1. Move it to `_archive/deprecated/perspectives/`.
2. Remove its row from `perspective-library/INDEX.md`.
3. Verify the active router no longer points to it.
4. Keep the archived perspective self-contained so it can be restored later if needed.
