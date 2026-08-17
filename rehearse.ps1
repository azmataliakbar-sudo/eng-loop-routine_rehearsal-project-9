Write-Output "===== Rehearse both runs ====="
Write-Output ""

Write-Output "--- SUCCESS run ---"
& "C:\Projects\eng_loop\routine_rehearsal\run.ps1" -Mode success

Write-Output ""
Write-Output "--- FAILURE run ---"
& "C:\Projects\eng_loop\routine_rehearsal\run.ps1" -Mode failure

Write-Output ""
Write-Output "===== Both transcripts ====="
Write-Output ""
Get-ChildItem "C:\Projects\eng_loop\routine_rehearsal" -Filter "transcript.txt" | ForEach-Object {
    Write-Output "File: $($_.FullName)"
    Get-Content $_.FullName
    Write-Output ""
}
