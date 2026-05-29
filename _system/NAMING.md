# Naming Rules

## Skill Names

- Use kebab-case.
- Use workflow names for broad entrypoints: `research-workflow`, `analysis-workflow`.
- Use `[person-name]-perspective` for person/style skills.
- Avoid duplicate names and aliases as separate active skills.

## File Roles

- `SKILL.md`: active skill entrypoint.
- `MODULE.md`: preserved former skill used as an internal module, not an active entrypoint.
- `INDEX.md`: routing or library index.
- `test-prompts.json`: prompts used by `darwin-skill` for evaluation.

## Deprecated Material

Deprecated skills keep their original directory names under `_archive`, but their old `SKILL.md` files should be renamed to `MODULE.md` when they should not be active.

