param(
    [ValidateSet("success", "failure")]
    [string]$Mode = "success"
)

Write-Output "Firing routine once (one-off run)..."
& "C:\Projects\eng_loop\routine_rehearsal\run.ps1" -Mode $Mode
