---
name: evaluation-workflow
description: |
  Evaluation entrypoint for research critique, paper review, risk of bias, scientific rigor, proofreading, visual audit, slide QA, and quality gates. Use when the user asks to 评价, 审查, 找问题, 批判性分析, proofread, review, audit, QA, or assess rigor.
---

# Evaluation Workflow

Use this skill to judge quality. The goal is not to generate more content, but to find defects, risks, weak assumptions, missing evidence, and improvement paths.

## Workflow

1. Identify the object being evaluated: paper, research design, analysis, slides, writing, code, or skill.
2. If the request is generation or modeling rather than critique, route to `research-workflow` or `analysis-workflow`.
3. Select the relevant module or rubric.
4. State criteria before judging.
5. Lead with findings ordered by severity.
6. Separate evidence-backed issues from preferences.
7. Provide concrete fixes or escalation paths.

## Do Not

- Do not rewrite the artifact unless critique or revision is explicitly requested.
- Do not praise before listing serious issues.
- Do not optimize skills here; use `darwin-skill`.
