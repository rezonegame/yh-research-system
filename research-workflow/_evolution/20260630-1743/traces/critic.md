# Critic Trace

Target: `research-workflow`

Evidence from `test-prompts.json`:

- `research-workflow-002` requires testable hypotheses rather than broad themes. The incumbent mentions hypothesis generation but does not explicitly require constructs, variables, or empirical strategy.
- `research-workflow-005` requires refusal to fabricate citations. The incumbent says to gather authoritative sources but does not explicitly forbid fabricated citations or evidence.
- Routing items are already clear: data/statistical work goes to `analysis-workflow`, critique to `evaluation-workflow`.

Proposed change: add compact rules for hypothesis operationalization and source-integrity refusal while preserving the original routing and workflow.
