# Darwin Decision: analysis-workflow

Run: `20260630-1803`

## Decision

Replace incumbent `A` with candidate `AB`.

## Evidence

- All candidates passed structural validation.
- Candidate `AB` growth: 17.8%, within the 20% hard gate.
- Active replacement growth after file write: 19.7%, within the hard gate.
- Borda result: `AB=8`, `B=7`, `A=3`; `AB` wins with 2 first-place votes.
- Holdout result: pass.
- Routing result: pass.
- Semantic preservation: pass. Candidate AB preserves the empirical-analysis scope while adding literature handoff and explicit power-analysis assumptions.

## Change Summary

Candidate AB adds two minimal rules:

1. Literature search or synthesis routes to `research-workflow`.
2. Power analysis must state design, effect size, alpha, power, and sample assumptions.
