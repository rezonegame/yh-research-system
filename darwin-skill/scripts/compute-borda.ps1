param(
  [Parameter(Mandatory=$true)]
  [string]$RankingsPath,

  [string]$Incumbent = "A"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $RankingsPath)) {
  throw "Rankings file does not exist: $RankingsPath"
}

$data = Get-Content -LiteralPath $RankingsPath -Raw -Encoding UTF8 | ConvertFrom-Json
$rankings = @()

if ($data -is [System.Array]) {
  $rankings = $data
} elseif ($data.rankings) {
  $rankings = $data.rankings
} else {
  throw "Rankings JSON must be an array or an object with a rankings array."
}

$scores = @{}
$firstPlace = @{}
$valid = 0

foreach ($entry in $rankings) {
  $ranking = @()
  if ($entry.ranking) {
    $ranking = @($entry.ranking)
  } elseif ($entry -is [System.Array]) {
    $ranking = @($entry)
  }

  $ranking = @($ranking | ForEach-Object { [string]$_ } | Where-Object { $_ })
  if ($ranking.Count -eq 0) { continue }

  $valid += 1
  $n = $ranking.Count
  for ($i = 0; $i -lt $ranking.Count; $i++) {
    $label = $ranking[$i]
    if (-not $scores.ContainsKey($label)) {
      $scores[$label] = 0
      $firstPlace[$label] = 0
    }
    $scores[$label] += ($n - $i)
    if ($i -eq 0) { $firstPlace[$label] += 1 }
  }
}

if ($valid -eq 0) {
  throw "No valid rankings found."
}

$maxScore = ($scores.Values | Measure-Object -Maximum).Maximum
$leaders = @($scores.Keys | Where-Object { $scores[$_] -eq $maxScore } | Sort-Object)

if ($leaders -contains $Incumbent) {
  $winner = $Incumbent
} else {
  $winner = $leaders[0]
}

[PSCustomObject]@{
  winner = $winner
  incumbent = $Incumbent
  valid_judges = $valid
  scores = $scores
  first_place = $firstPlace
  tie_broken_to_incumbent = (($leaders.Count -gt 1) -and ($winner -eq $Incumbent))
} | ConvertTo-Json -Depth 6
