---
name: lecture-slides
description: |
  Lecture and slide production entrypoint for Beamer, LaTeX, Quarto RevealJS, TikZ extraction, bibliography validation, visual QA, and deployment. Use when the user asks to create, compile, convert, audit, or deploy lecture slides.
---

# Lecture Slides

Use this skill when research output needs to become lectures, slides, diagrams, or deployable teaching material.

## Workflow

1. Determine target format: Beamer, Quarto RevealJS, PDF, HTML, or deployed site.
2. Select the relevant module from `modules/`.
3. Preserve notation, bibliography, and diagram consistency.
4. Compile or convert.
5. Run QA through `evaluation-workflow` when quality matters.
6. Deploy only when explicitly requested.

## Do Not

- Do not treat slide generation as a landing page task.
- Do not skip compilation or visual QA when the user asks for a final deck.
