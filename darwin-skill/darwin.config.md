# Darwin Local Config

## Root

```text
SKILLS_ROOT=.claude/skills
```

## Modes

- `single`: evaluate or optimize one specified skill.
- `category`: evaluate or optimize one workflow/category.
- `all-active`: evaluate or optimize active entrypoints.

## Active Entrypoints

- `research-workflow`
- `analysis-workflow`
- `evaluation-workflow`
- `skill-factory`
- `darwin-skill`
- `perspective-library`
- `lecture-slides`
- `boardgame-design-methodology`

## Default Exclusions

- `_archive`
- `_system`
- `_shared`
- `examples`
- `references`
- `templates`
- `assets`
- `results`

## Perspective Policy

By default, evaluate `perspective-library/SKILL.md` as the router. Evaluate individual person perspectives only when the user explicitly names a perspective or requests category mode for perspectives.

## Rollback Policy

Use git revert when the workspace is in a git repository. If there is no git repository, create timestamped `.bak` files before edits and restore from backup on failed evaluation. Never use `git reset --hard`.

