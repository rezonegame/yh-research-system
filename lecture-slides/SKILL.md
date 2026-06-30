---
name: lecture-slides
description: |
  Lecture and slide production entrypoint for Beamer, LaTeX, Quarto RevealJS, TikZ extraction, bibliography validation, visual QA, and deployment. Use when the user asks to create, compile, convert, audit, or deploy lecture slides.
---

# Lecture Slides

Use this skill when research output needs to become lectures, slides, diagrams, or deployable teaching material.

## Workflow

1. Determine target format: Beamer, Quarto RevealJS, PDF, HTML, or site.
2. If the request is only critique, visual review, or pedagogy review, hand off to `evaluation-workflow`.
3. For new decks, define goals, audience, duration, and learner output before slide structure.
4. Select the relevant module from `modules/`.
5. Preserve notation, bibliography, and diagram consistency.
6. Compile or convert, then run QA for final.
7. Deploy only when explicitly requested.

## Do Not

- Do not treat slide generation as a landing page task.
- Do not skip compilation or visual QA when the user asks for a final deck.

