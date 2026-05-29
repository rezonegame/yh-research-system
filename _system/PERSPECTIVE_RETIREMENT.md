# Perspective Retirement Protocol

Use this protocol when the user no longer needs a person/style perspective, wants to disable it, or wants to remove it from recommendations.

## Default Action

Archive first. Do not delete directly.

Move:

```text
.claude/skills/perspective-library/[person-name]-perspective/
```

to:

```text
.claude/skills/_archive/deprecated/perspectives/[person-name]-perspective/
```

Then remove the matching row from:

```text
.claude/skills/perspective-library/INDEX.md
```

## Restore Rule

To restore a retired perspective, move it back to `perspective-library/`, then re-add its row to `perspective-library/INDEX.md`.

## Validation

1. Confirm the source directory no longer exists in `perspective-library/`.
2. Confirm the archived directory exists under `_archive/deprecated/perspectives/`.
3. Search `perspective-library/INDEX.md` for the retired directory name.
4. Confirm the router recommends alternatives instead of routing to the retired skill.
