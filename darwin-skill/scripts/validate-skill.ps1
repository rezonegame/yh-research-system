param(
  [Parameter(Mandatory=$true)]
  [string]$SkillPath,

  [string]$BaselinePath,

  [double]$MaxGrowth = 0.20
)

$ErrorActionPreference = "Stop"

function Result($passed, $name, $message) {
  [PSCustomObject]@{
    passed = [bool]$passed
    constraint = $name
    message = $message
  }
}

$results = New-Object System.Collections.Generic.List[object]

if (-not (Test-Path -LiteralPath $SkillPath)) {
  $results.Add((Result $false "exists" "Skill file does not exist: $SkillPath"))
  $results | ConvertTo-Json -Depth 5
  exit 1
}

$text = Get-Content -LiteralPath $SkillPath -Raw -Encoding UTF8
$trimmed = $text.TrimStart()

$results.Add((Result ($trimmed.StartsWith("---")) "frontmatter_start" "Skill starts with YAML frontmatter"))
$results.Add((Result ($text -match "(?m)^name:\s*\S+") "name_field" "Frontmatter contains name"))
$results.Add((Result ($text -match "(?m)^description:\s*") "description_field" "Frontmatter contains description"))
$results.Add((Result ($text -match "(?m)^#\s+") "title" "Markdown body contains an H1 title"))
$results.Add((Result ([bool]$text.Trim()) "non_empty" "Skill text is non-empty"))

if ($BaselinePath -and (Test-Path -LiteralPath $BaselinePath)) {
  $baseline = Get-Content -LiteralPath $BaselinePath -Raw -Encoding UTF8
  $growth = ($text.Length - $baseline.Length) / [Math]::Max(1, $baseline.Length)
  $ok = $growth -le $MaxGrowth
  $results.Add((Result $ok "growth_limit" ("Growth {0:P1}; max {1:P1}" -f $growth, $MaxGrowth)))
}

$failed = @($results | Where-Object { -not $_.passed })
$results | ConvertTo-Json -Depth 5
if ($failed.Count -gt 0) { exit 1 }
