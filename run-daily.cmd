powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\Projects\eng_loop\routine_rehearsal\run.ps1" -Mode success
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\Projects\eng_loop\routine_rehearsal\notify.ps1" -Title "Routine Result" -Message "Daily run completed"
