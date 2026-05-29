# Routing Rules

Use the smallest active entrypoint that matches the user's intent.

| User intent | Entrypoint |
|---|---|
| Literature review, research question, study design, source search | `research-workflow` |
| Dataset analysis, regression, statistics, R analysis, APA results | `analysis-workflow` |
| Review a paper, critique rigor, find bias, QA, proofread, audit | `evaluation-workflow` |
| Create a new skill, distill a workflow, create a perspective | `skill-factory` |
| Retire, disable, archive, or remove a perspective | `skill-factory` |
| Score, optimize, evolve, or review skills | `darwin-skill` |
| Use a named thinker/person/style perspective | `perspective-library` |
| Build, compile, convert, audit, or deploy slides | `lecture-slides` |

If multiple entrypoints apply, start with the one closest to the deliverable:

- A research plan goes to `research-workflow`.
- A statistical result goes to `analysis-workflow`.
- A quality judgment goes to `evaluation-workflow`.
- A reusable capability goes to `skill-factory`.
- A perspective lifecycle change goes to `skill-factory`.
