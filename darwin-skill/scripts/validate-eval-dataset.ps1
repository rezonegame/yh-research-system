param(
  [Parameter(Mandatory=$true)]
  [string]$DatasetPath
)

$ErrorActionPreference = "Stop"

function Result($passed, $name, $message, $itemId = "") {
  [PSCustomObject]@{
    passed = [bool]$passed
    check = $name
    item_id = $itemId
    message = $message
  }
}

if (-not (Test-Path -LiteralPath $DatasetPath)) {
  [PSCustomObject]@{
    passed = $false
    check = "exists"
    item_id = ""
    message = "Dataset file does not exist: $DatasetPath"
  } | ConvertTo-Json -Depth 5
  exit 1
}

$results = New-Object System.Collections.Generic.List[object]
$data = Get-Content -LiteralPath $DatasetPath -Raw -Encoding UTF8 | ConvertFrom-Json
$props = @($data.PSObject.Properties.Name)

$results.Add((Result ($props -contains "schema_version") "schema_version" "Dataset declares schema_version"))
$results.Add((Result ($props -contains "skill") "skill" "Dataset declares target skill"))
$results.Add((Result ($props -contains "dataset_type") "dataset_type" "Dataset declares dataset_type"))
$results.Add((Result ($props -contains "items") "items" "Dataset declares items array"))

if (-not ($props -contains "items")) {
  $results | ConvertTo-Json -Depth 5
  exit 1
}

$allowedDifficulty = @("easy", "medium", "hard")
$allowedSource = @("golden", "synthetic", "session", "routing", "holdout", "self-play")
$allowedSplit = @("train", "validation", "holdout", "routing")
$required = @("id", "task_input", "expected_behavior", "rubric", "difficulty", "category", "source", "split")
$ids = @{}

foreach ($item in @($data.items)) {
  $itemProps = @($item.PSObject.Properties.Name)
  $itemId = if ($itemProps -contains "id") { [string]$item.id } else { "" }

  foreach ($field in $required) {
    $hasField = $itemProps -contains $field
    $hasValue = $false
    if ($hasField) {
      $value = [string]$item.$field
      $hasValue = -not [string]::IsNullOrWhiteSpace($value)
    }
    $results.Add((Result ($hasField -and $hasValue) "required_field:$field" "Required field `$field` is present and non-empty" $itemId))
  }

  if ($itemId) {
    $isUnique = -not $ids.ContainsKey($itemId)
    $results.Add((Result $isUnique "unique_id" "Item id is unique" $itemId))
    $ids[$itemId] = $true
  }

  if ($itemProps -contains "difficulty") {
    $results.Add((Result ($allowedDifficulty -contains [string]$item.difficulty) "allowed_difficulty" "Difficulty is easy, medium, or hard" $itemId))
  }
  if ($itemProps -contains "source") {
    $results.Add((Result ($allowedSource -contains [string]$item.source) "allowed_source" "Source is allowed by shared schema" $itemId))
  }
  if ($itemProps -contains "split") {
    $results.Add((Result ($allowedSplit -contains [string]$item.split) "allowed_split" "Split is train, validation, holdout, or routing" $itemId))
  }
}

$splits = @($data.items | ForEach-Object { [string]$_.split })
$results.Add((Result ($splits -contains "holdout") "has_holdout" "Dataset contains at least one holdout item"))

$failed = @($results | Where-Object { -not $_.passed })
$results | ConvertTo-Json -Depth 6
if ($failed.Count -gt 0) { exit 1 }
