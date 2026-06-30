---
name: analysis-workflow
description: |
  Analysis entrypoint for data analysis, R workflows, statistics, regression, power analysis, tables, figures, and APA-style result reporting. Use when the user asks for 数据分析, 统计分析, 回归, 方差分析, 卡方, R代码, 功效分析, or APA results.
---

# Analysis Workflow

Use this skill when the user needs empirical analysis rather than literature synthesis or critique.

## Workflow

1. If the request is literature search or synthesis, hand off to `research-workflow`.
2. Identify the data source, outcome, predictors, design, and unit of analysis.
3. Select the relevant module from `modules/`.
4. Inspect data and assumptions before modeling; for power analysis, state design, effect size, alpha, power, and sample assumptions.
5. Run or plan the analysis with reproducibility in mind.
6. Produce tables, figures, and interpretation suitable for research writing.
7. Hand off to `evaluation-workflow` for robustness, bias, and quality review.

## Do Not

- Do not invent data or statistical results.
- Do not hide assumption violations.
- Do not create new reusable skills; route that to `skill-factory`.

