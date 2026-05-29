# Output Path Rules

## Allowed Outputs

General skill:

```text
.claude/skills/[skill-name]/SKILL.md
```

Perspective skill:

```text
.claude/skills/perspective-library/[person-name]-perspective/SKILL.md
```

Retired perspective skill:

```text
.claude/skills/_archive/deprecated/perspectives/[person-name]-perspective/
```

Darwin logs:

```text
.claude/skills/darwin-skill/results.tsv
.claude/skills/darwin-skill/results/cards/
```

## Forbidden Outputs

Never create generated skill content in:

```text
.agents/skills/
.codex/skills/
external research folders
old generator examples folders
external absolute paths
```

## Self-Containment

Every skill must carry its own required `references/`, `scripts/`, `templates/`, and `test-prompts.json`, unless the asset is intentionally shared through `_shared/`.
