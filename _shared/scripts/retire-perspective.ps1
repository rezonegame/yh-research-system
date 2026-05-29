param(
  [Parameter(Mandatory = $true)]
  [string]$Name,

  [string]$SkillsRoot = ".claude\skills",

  [switch]$DryRun
)

$ErrorActionPreference = "Stop"

$normalized = $Name.Trim()
if (-not $normalized.EndsWith("-perspective") -and $normalized -ne "x-mastery-mentor") {
  $normalized = "$normalized-perspective"
}

$library = Join-Path $SkillsRoot "perspective-library"
$source = Join-Path $library $normalized
$archiveRoot = Join-Path $SkillsRoot "_archive\deprecated\perspectives"
$target = Join-Path $archiveRoot $normalized
$index = Join-Path $library "INDEX.md"

if (-not (Test-Path -LiteralPath $source)) {
  throw "Perspective not found: $source"
}

if (Test-Path -LiteralPath $target) {
  throw "Archive target already exists: $target"
}

if (-not (Test-Path -LiteralPath $index)) {
  throw "Perspective index not found: $index"
}

Write-Host "Retiring perspective: $normalized"
Write-Host "Move: $source"
Write-Host "To:   $target"
Write-Host "Index: $index"

if ($DryRun) {
  Write-Host "Dry run only. No files changed."
  exit 0
}

New-Item -ItemType Directory -Force -Path $archiveRoot | Out-Null
Move-Item -LiteralPath $source -Destination $target

$lines = Get-Content -LiteralPath $index -Encoding UTF8
$pattern = [regex]::Escape('`' + $normalized + '`')
$filtered = $lines | Where-Object { $_ -notmatch $pattern }
Set-Content -LiteralPath $index -Value $filtered -Encoding UTF8

if (Test-Path -LiteralPath $source) {
  throw "Retirement failed: source still exists."
}
if (-not (Test-Path -LiteralPath $target)) {
  throw "Retirement failed: archive target missing."
}
if ((Get-Content -Raw -LiteralPath $index -Encoding UTF8) -match $pattern) {
  throw "Retirement failed: index still contains $normalized."
}

Write-Host "Retired perspective: $normalized"
