# Perspective Retirement Protocol

Use this protocol when the user no longer needs a person/style perspective, wants to disable it, or wants to remove it from recommendations.

## Default Action

Archive first. Do not delete directly. In this system, delete/remove/disable for a perspective means removing it from the active `perspective-library` router and preserving its files under `_archive`.

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

Removing the row also removes the active aliases/triggers for that perspective.

## Required Confirmation

Before changing files, show the user:

1. The matched perspective name and active source directory.
2. The archive target directory.
3. The exact `perspective-library/INDEX.md` row that will be removed.
4. The aliases/triggers that will stop routing.

Wait for explicit confirmation before moving files or editing the index.

For batch retirement, process perspectives sequentially. Do not run retirement commands in parallel, because each retirement edits the same active `perspective-library/INDEX.md`.

## Failure Modes

| Situation | Required behavior |
|---|---|
| No active directory matches the request | Stop and show the closest index candidates, if any. |
| Multiple perspectives match the request | Ask the user to choose one exact directory name. |
| Archive target already exists | Stop; do not overwrite or merge automatically. |
| `perspective-library/INDEX.md` is missing or has no matching row | Stop and report that active trigger cleanup cannot be verified. |
| Move succeeds but index cleanup fails | Report the partial state and require manual repair before declaring success. |
| Batch retirement partially succeeds | Audit each source directory, archive directory, and index row; finish cleanup sequentially before reporting success. |
| User asks for hard deletion | Explain that archive retirement is the default and require a separate explicit hard-delete request. |

## Restore Rule

To restore a retired perspective, move it back to `perspective-library/`, then re-add its row to `perspective-library/INDEX.md`.

## Validation

1. Confirm the source directory no longer exists in `perspective-library/`.
2. Confirm the archived directory exists under `_archive/deprecated/perspectives/`.
3. Search `perspective-library/INDEX.md` for the retired directory name.
4. Search `perspective-library/INDEX.md` for the removed aliases/triggers when practical.
5. Confirm the router recommends alternatives instead of routing to the retired skill.
