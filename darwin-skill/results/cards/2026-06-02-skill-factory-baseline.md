# Darwin Baseline Evaluation: skill-factory

Timestamp: 2026-06-02T10:56:00+08:00

Mode: single / evaluation-only

Target: `.claude/skills/skill-factory`

Git state: repository present, dirty (`?? .claude/`, `?? sync.sh`)

## Score

Overall: 76.5 / 100

| Dimension | Score | Note |
|---|---:|---|
| Frontmatter quality | 8.5 | Clear name and bilingual trigger coverage; description is long but usable. |
| Workflow clarity | 7.5 | Main creation and retirement paths are clear, but lifecycle branches are compressed. |
| Failure-mode encoding | 5.5 | Duplicate, missing index, failed move, naming collision, and invalid template cases are not encoded. |
| Checkpoint design | 5.0 | Non-trivial changes such as creating directories, editing indexes, or retiring perspectives lack explicit user checkpoints. |
| Actionable specificity | 8.0 | Output roots and required files are concrete. |
| Resource integration | 7.0 | Uses system and perspective indexes plus retire script; does not mention templates or validation helpers. |
| Overall architecture | 8.0 | Good single entrypoint design for skill production and perspective retirement. |
| Tested performance against prompts | 8.0 | Three prompts cover general creation, perspective creation, and retirement. |
| Anti-pattern and high-risk action blacklist | 7.0 | Has forbidden outputs and delete prohibition; lacks blacklist for unsafe index edits and duplicate aliases. |

## Weakest Dimension

Checkpoint design is the weakest dimension, closely followed by failure-mode encoding.

## Recommended Single Change

Add a compact "Checkpoints and Failure Modes" section after the workflow:

- Require confirmation before creating a new active top-level skill, editing `_system/INDEX.md`, editing `perspective-library/INDEX.md`, or retiring a perspective.
- Add an if-then fallback table for duplicate names, missing indexes, failed archive moves, invalid `test-prompts.json`, and requests that mix general workflow and person perspective creation.

Expected impact: raise checkpoint design and failure-mode encoding enough to move the skill toward 82-85 without changing its architecture.
