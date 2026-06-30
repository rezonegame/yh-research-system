# Critic Trace

Target: `lecture-slides`

Evidence from `test-prompts.json`:

- `lecture-slides-003` expects pure audit/critique to route to `evaluation-workflow`; incumbent A says "audit" in description and only says QA through evaluation-workflow when quality matters, so pure audit routing is underspecified.
- `lecture-slides-004` expects learning objectives and timing before slide production details; incumbent A does not state learning objective, audience, duration, or learner output intake.
- `lecture-slides-001` expects conversion plus QA; incumbent A covers conversion and QA but the final-deck condition can be clearer.

Proposed change: add minimal routing and intake language without expanding the skill beyond the 20% growth gate.
