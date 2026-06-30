# Critic Trace

Target: `analysis-workflow`

Evidence from `test-prompts.json`:

- `analysis-workflow-003` expects literature search and synthesis to route to `research-workflow`; incumbent only says analysis is not literature synthesis but does not include an explicit handoff.
- `analysis-workflow-002` expects power-analysis assumptions before reporting; incumbent mentions assumptions before modeling but not the specific power-analysis assumptions.
- `analysis-workflow-005` is already mostly covered by the design/outcome/predictors/unit step.

Proposed change: add compact handoff for literature tasks and explicit power-analysis assumptions.
