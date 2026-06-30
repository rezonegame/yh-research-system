# Darwin Decision: lecture-slides

Run: `20260630-1731`

## Decision

Replace incumbent `A` with candidate `B`.

## Evidence

- All candidates passed structural validation.
- Revised candidates originally exceeded the 20% growth gate; they were compressed and revalidated.
- Final candidate `B` growth: 17.3%, within the hard gate.
- Active replacement growth after file write: 19.3%, within the hard gate.
- Borda result: `B=8`, `AB=7`, `A=3`; `B` wins with 2 first-place votes.
- Holdout result: pass.
- Routing result: pass.
- Semantic preservation: pass. Candidate B preserves the lecture/slide production scope and only clarifies handoff for pure critique plus intake for new lecture decks.

## Change Summary

Candidate B adds two minimal rules:

1. Pure critique, visual review, or pedagogy review should hand off to `evaluation-workflow`.
2. New decks should define goals, audience, duration, and learner output before slide structure.
