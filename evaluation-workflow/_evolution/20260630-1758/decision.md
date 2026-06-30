# Darwin Decision: evaluation-workflow

Run: `20260630-1758`

## Decision

Replace incumbent `A` with candidate `AB`.

## Evidence

- All candidates passed structural validation.
- Candidate `AB` growth: 16.3%, within the 20% hard gate.
- Borda result: `AB=8`, `B=7`, `A=3`; `AB` wins with 2 first-place votes.
- Holdout result: pass.
- Routing result: pass.
- Semantic preservation: pass. Candidate AB preserves the evaluation/critique role while adding a non-trigger handoff for generation and modeling requests.

## Change Summary

Candidate AB adds one minimal routing rule: if the request is generation or modeling rather than critique, route to `research-workflow` or `analysis-workflow`.
