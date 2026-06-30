param(
  [string]$SkillsRoot = ".\.claude\skills"
)

$ErrorActionPreference = "Stop"

$active = @(
  "research-workflow",
  "analysis-workflow",
  "evaluation-workflow",
  "skill-factory",
  "darwin-skill",
  "perspective-library",
  "lecture-slides",
  "boardgame-design-methodology",
  "gamified-urban-renewal-design"
)

$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$validateSkill = Join-Path $scriptRoot "validate-skill.ps1"
$validateDataset = Join-Path $scriptRoot "validate-eval-dataset.ps1"

$results = New-Object System.Collections.Generic.List[object]

foreach ($script in Get-ChildItem -LiteralPath $scriptRoot -Filter "*.ps1") {
  try {
    $null = [scriptblock]::Create((Get-Content -LiteralPath $script.FullName -Raw -Encoding UTF8))
    $results.Add([PSCustomObject]@{
      target = $script.Name
      check = "script_parse"
      passed = $true
      message = "Script parses"
    })
  } catch {
    $results.Add([PSCustomObject]@{
      target = $script.Name
      check = "script_parse"
      passed = $false
      message = $_.Exception.Message
    })
  }
}

foreach ($skill in $active) {
  $skillDir = Join-Path $SkillsRoot $skill
  $skillPath = Join-Path $skillDir "SKILL.md"
  $datasetPath = Join-Path $skillDir "test-prompts.json"

  & powershell -NoProfile -ExecutionPolicy Bypass -File $validateSkill -SkillPath $skillPath | Out-Null
  $results.Add([PSCustomObject]@{
    target = $skill
    check = "skill_structure"
    passed = ($LASTEXITCODE -eq 0)
    message = "SKILL.md structure validation"
  })

  & powershell -NoProfile -ExecutionPolicy Bypass -File $validateDataset -DatasetPath $datasetPath | Out-Null
  $results.Add([PSCustomObject]@{
    target = $skill
    check = "eval_dataset"
    passed = ($LASTEXITCODE -eq 0)
    message = "test-prompts.json canonical validation"
  })
}

$failed = @($results | Where-Object { -not $_.passed })

[PSCustomObject]@{
  passed = ($failed.Count -eq 0)
  active_skill_count = $active.Count
  check_count = $results.Count
  failed_count = $failed.Count
  results = $results
} | ConvertTo-Json -Depth 8

if ($failed.Count -gt 0) { exit 1 }
