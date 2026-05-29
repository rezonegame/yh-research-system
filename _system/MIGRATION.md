# Migration Guide

This system is designed to migrate by copying one directory:

```text
.claude/skills/
```

## Before Copying

1. Verify active entrypoints exist.
2. Verify `_system/INDEX.md` and `perspective-library/INDEX.md` are current.
3. Verify generated paths do not point outside `.claude/skills`.
4. Verify `_archive` is present if historical examples are needed.

## After Copying

1. Use `README.md` as the first entry.
2. Use `_system/ROUTING.md` to decide which skill to invoke.
3. Run `darwin-skill` in evaluation-only mode on one low-risk skill before optimizing anything.
4. Validate the active skill folders with the local `skill-creator` validator when available:

```powershell
$validator = "$env:USERPROFILE\.codex\skills\.system\skill-creator\scripts\quick_validate.py"
foreach ($skill in "research-workflow","analysis-workflow","evaluation-workflow","skill-factory","darwin-skill","perspective-library","lecture-slides") {
  python $validator ".claude\skills\$skill"
}
```

## Mirror Directories

`.agents/skills` and `.codex/skills` are not part of this system. They may exist as runtime mirrors, but they are not the source of truth.
