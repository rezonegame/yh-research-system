param(
  [Parameter(Mandatory=$true)]
  [string]$InputPath,

  [string]$SkillName = "",

  [string]$OutputPath = ""
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $InputPath)) {
  throw "Input file does not exist: $InputPath"
}

$raw = Get-Content -LiteralPath $InputPath -Raw -Encoding UTF8 | ConvertFrom-Json

$hasItemsProperty = $false
if ($raw -and -not ($raw -is [System.Array])) {
  $hasItemsProperty = @($raw.PSObject.Properties.Name) -contains "items"
}

if ($hasItemsProperty) {
  $canonical = $raw
} else {
  $items = @()
  foreach ($item in @($raw)) {
    $id = if ($item.id) { [string]$item.id } else { [guid]::NewGuid().ToString("N") }
    $task = if ($item.task_input) { $item.task_input } else { $item.prompt }
    $expected = if ($item.expected_behavior) { $item.expected_behavior } else { $item.expected }
    $rubric = if ($item.rubric) { $item.rubric } else { $expected }
    $items += [PSCustomObject]@{
      id = $id
      task_input = [string]$task
      expected_behavior = [string]$expected
      rubric = [string]$rubric
      difficulty = if ($item.difficulty) { [string]$item.difficulty } else { "medium" }
      category = if ($item.category) { [string]$item.category } else { "legacy" }
      source = if ($item.source) { [string]$item.source } else { "golden" }
      split = if ($item.split) { [string]$item.split } else { "holdout" }
    }
  }
  $canonical = [PSCustomObject]@{
    schema_version = "1.0"
    skill = $SkillName
    dataset_type = "skill-eval"
    items = $items
  }
}

$json = $canonical | ConvertTo-Json -Depth 8
if ($OutputPath) {
  $json | Set-Content -LiteralPath $OutputPath -Encoding UTF8
} else {
  $json
}
