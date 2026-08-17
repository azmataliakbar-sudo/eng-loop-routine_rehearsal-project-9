param(
    [ValidateSet("success", "failure")]
    [string]$Mode = "success"
)

$transcriptFile = "transcript.txt"
$summaryFile = "commit-summary.md"
$startedAt = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Actual task: summarize commits.
if ($Mode -eq "failure") {
    # Sabotage: read a file that does not exist, but catch the error.
    try {
        $null = Get-Content "does-not-exist.txt" -ErrorAction Stop
        $result = "unexpected: file existed"
    } catch {
        $result = "FAILED: $($_.Exception.Message)"
    }
} else {
    $commits = git log --pretty=format:"%h %s" 2>&1
    $content = @("# Commit Summary", "") + @($commits)
    Set-Content -Path $summaryFile -Value $content
    $result = "commit-summary.md written on branch '$branch' with $((@($commits)).Count) commit(s)"
}

# Write the full transcript (the truth).
$transcript = @(
    "Run started: $startedAt"
    "Mode: $Mode"
    "Result: $result"
) -join "`n"
Set-Content -Path $transcriptFile -Value $transcript

# Status column: always GREEN if the session completed (infrastructure ok).
Set-Content -Path "status.txt" -Value "GREEN (session completed)"

$now = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# task-done.txt
$doneCount = 0
if (Test-Path "task-done.txt") {
    $doneCount = (Get-Content "task-done.txt" | Where-Object { $_ -match '^DONE-' }).Count
}
$nextDone = $doneCount + 1

if ($Mode -eq "failure") {
    "DONE-$nextDone at $now : FAIL (task failed)" | Add-Content "task-done.txt"
} else {
    "DONE-$nextDone at $now : SUCCESS" | Add-Content "task-done.txt"
}

# SUMMARY
$summaryCount = (Get-ChildItem -Filter "SUMMARY*.md" -ErrorAction SilentlyContinue).Count
$nextSummary = $summaryCount + 1
$summaryLines = @(
    "Run: $nextSummary"
    "Started: $startedAt"
    "Finished: $now"
    "Mode: $Mode"
    "Status column: GREEN (session completed)"
    "Transcript truth:"
    (Get-Content $transcriptFile | ForEach-Object { "  $_" })
)
Set-Content -Path "SUMMARY$nextSummary.md" -Value $summaryLines

# Console output.
Write-Output "===== Routine Rehearsal ====="
Write-Output "Run: $nextSummary"
Write-Output "Status column: GREEN (session completed)"
Write-Output "Transcript truth:"
Get-Content $transcriptFile | ForEach-Object { Write-Output "  $_" }
Write-Output "Wrote task-done.txt -> DONE-$nextDone"
Write-Output "Wrote SUMMARY$nextSummary.md"
Write-Output "=============================="
