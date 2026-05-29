---
name: perspective-library
description: |
  Person and thinking-style perspective router. Use when the user asks 用某某视角, 某人会怎么看, perspective, 思维方式, or wants a thinker/person/style lens such as 费曼, 芒格, Naval, Karpathy, 张一鸣, Jan Gehl, or 崔愷.
---

# Perspective Library

This skill is the single active router for person and thinking-style perspectives.

## Workflow

1. Detect explicit names, aliases, or style cues in the user request.
2. Look up candidates in `INDEX.md`.
3. If one match is clear, load that perspective's `SKILL.md`.
4. If no name is given, recommend two or three candidates based on the user's need.
5. If the requested perspective does not exist, route to `skill-factory` to create it.
6. If the user asks to retire, disable, remove, or stop using a perspective, route to `skill-factory` and follow `_system/PERSPECTIVE_RETIREMENT.md`.

## Do Not

- Do not expose every perspective as a top-level skill.
- Do not invent a person's view when no perspective exists and the user asked for that specific person.
- Do not create new perspectives here; use `skill-factory`.
- Do not delete or archive perspectives directly from this router; use `skill-factory`.
