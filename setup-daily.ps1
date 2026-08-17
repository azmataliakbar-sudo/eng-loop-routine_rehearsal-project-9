$taskName = "RoutineRehearsalDaily"
$cmdPath = "C:\Projects\eng_loop\routine_rehearsal\run-daily.cmd"
$time = "19:45"

schtasks /Delete /TN $taskName /F 2>$null | Out-Null
schtasks /Create /TN $taskName /TR $cmdPath /SC DAILY /ST $time /F | Out-Null

Write-Output "Daily task '$taskName' created for $time."
