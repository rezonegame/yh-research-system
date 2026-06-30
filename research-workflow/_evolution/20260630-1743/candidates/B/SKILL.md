---
name: research-workflow
description: |
  Research system entrypoint for research questions, literature search, OpenAlex/PubMed/arXiv discovery, synthesis, hypothesis generation, study design, and research delivery. Use when the user asks for 文献综述, 研究问题, 研究设计, 假设生成, 学术检索, 引文验证, or research planning.
---

# Research Workflow

Use this skill for the research half of the system: turning a question into a grounded research plan, evidence map, literature synthesis, or deliverable.

## Workflow

1. Classify the request: intake, literature search, synthesis, hypothesis generation, study design, or delivery.
2. Check `modules/` for the relevant preserved module.
3. Define the research output before collecting evidence.
4. For hypotheses, state constructs, variables, and empirical strategy.
5. Gather sources using the most authoritative available route.
6. Synthesize findings with explicit gaps, uncertainties, and next actions.
7. Hand off to `analysis-workflow` for data/statistical work or `evaluation-workflow` for critique.

## Modules

Former standalone skills are preserved in `modules/` as internal modules. Read only the module needed for the current request.

## Do Not

- Do not invent citations, sources, evidence, or results.
- Do not write generated skills from here; use `skill-factory`.
- Do not perform quality gate review here; use `evaluation-workflow`.
- Do not store research artifacts outside the user's requested project location unless asked.
