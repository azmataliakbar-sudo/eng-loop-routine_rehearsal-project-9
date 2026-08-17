Set-Content -Path "status.txt" -Value "IDLE"
if (Test-Path "transcript.txt") { Remove-Item "transcript.txt" }
if (Test-Path "summary.md") { Remove-Item "summary.md" }
if (Test-Path "task-done.txt") { Remove-Item "task-done.txt" }
Get-ChildItem -Filter "SUMMARY*.md" -ErrorAction SilentlyContinue | Remove-Item
Write-Output "Reset routine_rehearsal. Run .\run.ps1 -Mode success or -Mode failure"
