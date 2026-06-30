# Critic Trace

Target: `evaluation-workflow`

Evidence from `test-prompts.json`:

- `evaluation-workflow-003` expects literature synthesis generation to route to `research-workflow`. The incumbent does not explicitly handle non-critique generation requests.
- `evaluation-workflow-004` expects model running and statistical interpretation to route to `analysis-workflow`.
- `evaluation-workflow-006` expects evaluation-workflow not to rewrite directly unless reframed or explicitly requested.

Proposed change: add one compact routing step for generation/modeling non-triggers and tighten the rewrite prohibition.
