$taskName = "RoutineRehearsalDaily"
$runPath = "C:\Projects\eng_loop\routine_rehearsal\run.ps1"
$notifyPath = "C:\Projects\eng_loop\routine_rehearsal\notify.ps1"
$time = "19:45"

$action = "powershell.exe -NoProfile -ExecutionPolicy Bypass -File `"$runPath`" -Mode success; powershell.exe -NoProfile -ExecutionPolicy Bypass -File `"$notifyPath`" -Title 'Routine Result' -Message 'Daily run completed'"

# Remove existing then create daily task.
schtasks /Delete /TN $taskName /F 2>$null | Out-Null
schtasks /Create /TN $taskName /TR $action /SC DAILY /ST $time /F | Out-Null

Write-Output "Daily task '$taskName' created for $time."
