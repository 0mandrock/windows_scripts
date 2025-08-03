# Restore the original cursor settings
$BackupPath = "$env:TEMP\cursor_backup.reg"

if (Test-Path $BackupPath) {
    reg import $BackupPath
}

# Apply changes
Stop-Process -Name "explorer" -Force
Start-Process "explorer"
