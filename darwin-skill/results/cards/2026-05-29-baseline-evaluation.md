# Darwin Baseline Evaluation

Timestamp: 2026-05-29T11:19:55+08:00

Mode: `all-active` plus `perspective-category`

Workspace state: not a git repository; use timestamped `.bak` rollback for future optimization.

## Summary

The local research skills system is structurally sound. All 7 active entrypoints validate successfully, all active `test-prompts.json` files parse, no archived/module `SKILL.md` files remain, and no broken relative Markdown links were found.

Main weaknesses are concentrated in the perspective library:

- 6 perspective skills contain a UTF-8 BOM that makes `quick_validate.py` report `No YAML frontmatter found`.
- Individual perspective skills do not have local `test-prompts.json` files.
- 8 perspective skills exceed 400 lines; `sun-yuchen-perspective` is closest to the 500-line limit.

## Scores

| Skill | Score | Status | Primary issue |
|---|---:|---|---|
| `skill-factory` | 90 | Strong | Add automated scaffolding later |
| `darwin-skill` | 89 | Strong | Needs scoring helper scripts |
| `research-workflow` | 88 | Strong | More failure/checkpoint guidance |
| `analysis-workflow` | 87 | Strong | More diagnostic routing detail |
| `evaluation-workflow` | 86 | Good | Rubric/resource integration can improve |
| `lecture-slides` | 86 | Good | Compile/QA failure modes can improve |
| `perspective-library` | 84 | Good | Router strong, child skills uneven |
| Most valid perspectives | 81-84 | Good | No local test prompts; long bodies |
| BOM-affected perspectives | 75-79 | Needs fix | Frontmatter validation failure |

## Highest Priority Fixes

1. Remove UTF-8 BOM from:
   - `aleksandr-vlasov-perspective`
   - `cui-kai-perspective`
   - `jan-gehl-perspective`
   - `kakei-yusuke-perspective`
   - `ryo-yamazaki-perspective`
   - `sun-yuchen-perspective`
2. Add minimal `test-prompts.json` to each perspective or define a shared `perspective-library/references/test-prompt-template.md`.
3. Split the longest perspectives by moving examples and long source notes into `references/`.
4. Add a small Darwin scoring helper script so future baseline evaluations are repeatable.

## Verification Evidence

- `quick_validate.py`: all 7 active entrypoints valid.
- Relative Markdown links: no broken links found.
- Active `test-prompts.json`: all parse successfully.
- Top-level active entrypoints: 7.
- Archived/module `SKILL.md`: 0.

