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

## Perspective Lifecycle Routing

- If the user asks to create a person/style perspective, route to `skill-factory` and default to publish-ready.
- If the user asks to delete, remove, disable, or retire a person/style perspective, route to `skill-factory`; the default action is archive retirement, not hard deletion.
- If the user names a live perspective or alias, route through `perspective-library/INDEX.md`.
- If the user names a retired perspective, do not route to the archive automatically; ask whether to restore or create a new version.
