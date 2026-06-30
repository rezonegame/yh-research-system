# Evaluation Dataset Schema

This schema is the shared format for skill test prompts, Darwin holdout sets, routing regression tests, and self-evolution probes.

## Canonical JSON Shape

```json
{
  "schema_version": "1.0",
  "skill": "skill-name",
  "dataset_type": "skill-eval",
  "items": [
    {
      "id": "skill-name-001",
      "task_input": "User-facing request to test.",
      "expected_behavior": "Rubric-style description of a good response.",
      "rubric": "A single binary-verifiable pass/fail criterion.",
      "difficulty": "easy",
      "category": "triggering",
      "source": "golden",
      "split": "train"
    }
  ]
}
```

## Required Fields

| Field | Allowed values | Purpose |
|---|---|---|
| `id` | stable string | Unique example id. |
| `task_input` | non-empty string | The simulated user request. |
| `expected_behavior` | non-empty string | What a good answer should do; not exact wording. |
| `rubric` | non-empty string | One binary-verifiable criterion. |
| `difficulty` | `easy`, `medium`, `hard` | Stratified evaluation. |
| `category` | string | What capability or failure mode the item tests. |
| `source` | `golden`, `synthetic`, `session`, `routing`, `holdout`, `self-play` | Provenance. |
| `split` | `train`, `validation`, `holdout`, `routing` | How the item may be used. |

## Legacy Compatibility

Older `test-prompts.json` files may be a flat array with:

```json
[
  {
    "id": 1,
    "prompt": "User request",
    "expected": "Expected behavior"
  }
]
```

Tools must treat legacy `prompt` as `task_input`, legacy `expected` as both `expected_behavior` and `rubric`, default `difficulty` to `medium`, `category` to `legacy`, `source` to `golden`, and `split` to `holdout`.

## Split Rules

- `train`: Used to discover weaknesses and generate candidate improvements.
- `validation`: Used to choose between candidates during evolution.
- `holdout`: Used only after candidate selection. Do not inspect or tune against holdout failures until a run is complete.
- `routing`: Used to check whether entrypoint selection changed unintentionally.

## Quality Rules

- A rubric must be pass/fail, not a vague preference.
- Each active entrypoint should have at least one trigger test, one non-trigger or handoff test, and one failure-mode test.
- Publish-ready skills should have at least 10 items, including 3 holdout items.
- Skill upgrades must not delete holdout items unless the item itself is invalid and the quality report explains why.
