---
name: skill-factory
description: |
  Skill production entrypoint for creating new local, self-contained skills from research workflows, methods, repeated tasks, or person perspectives. Use when the user asks to 造skill, 创建技能, 沉淀流程, 蒸馏人物视角, update a skill template, or generate a reusable research capability.
  Also use when the user asks to retire, disable, archive, remove, or stop using a person perspective.
---

# Skill Factory

This is the only entrypoint for producing new skills in this local research system.

## Output Roots

General skill:

```text
.claude/skills/[skill-name]/SKILL.md
```

Person perspective skill:

```text
.claude/skills/perspective-library/[person-name]-perspective/SKILL.md
```

Retired perspective skill:

```text
.claude/skills/_archive/deprecated/perspectives/[person-name]-perspective/
```

## Workflow

1. Classify the new skill as general workflow, research method, tool integration, or person perspective.
2. Check `_system/INDEX.md` and `perspective-library/INDEX.md` to avoid duplicates.
3. Create a self-contained directory with `SKILL.md`, `references/`, `scripts/`, `templates/`, and `test-prompts.json` as needed.
4. For person perspectives, update `perspective-library/INDEX.md`.
5. For all new skills, update `_system/INDEX.md`.
6. Ask `darwin-skill` to evaluate the new skill before treating it as stable.

## Retire a Perspective

1. Confirm the target directory exists under `perspective-library/`.
2. Move it to `_archive/deprecated/perspectives/`.
3. Remove its row from `perspective-library/INDEX.md`.
4. Leave the archived directory self-contained.
5. Verify the name no longer appears in the active perspective index.

Use `_shared/scripts/retire-perspective.ps1` for repeatable retirement on Windows.

## Forbidden Outputs

 Never write generated skills to `.agents/skills`, `.codex/skills`, external research folders, old generator examples folders, or absolute user-specific paths.

## Do Not

- Do not create duplicate active generator aliases for the same workflow.
- Do not place examples where they can be mistaken for active skills.
- Do not omit `test-prompts.json` for a reusable skill.
- Do not delete perspectives directly; archive them first.
