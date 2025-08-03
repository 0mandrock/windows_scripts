# Path to the registry key that controls the mouse pointer scheme
$RegPath = "HKCU:\Control Panel\Cursors"

# Backup current cursor settings
$BackupPath = "$env:TEMP\cursor_backup.reg"
reg export "HKCU\Control Panel\Cursors" $BackupPath /y

# Set custom (invisible) cursor
$InvisibleCursor = "C:\invisible.cur"
Set-ItemProperty -Path $RegPath -Name "Arrow" -Value $InvisibleCursor
Set-ItemProperty -Path $RegPath -Name "AppStarting" -Value $InvisibleCursor
Set-ItemProperty -Path $RegPath -Name "Wait" -Value $InvisibleCursor
Set-ItemProperty -Path $RegPath -Name "Hand" -Value $InvisibleCursor
Set-ItemProperty -Path $RegPath -Name "Help" -Value $InvisibleCursor
Set-ItemProperty -Path $RegPath -Name "Crosshair" -Value $InvisibleCursor
Set-ItemProperty -Path $RegPath -Name "IBeam" -Value $InvisibleCursor
Set-ItemProperty -Path $RegPath -Name "NWPen" -Value $InvisibleCursor
Set-ItemProperty -Path $RegPath -Name "No" -Value $InvisibleCursor
Set-ItemProperty -Path $RegPath -Name "SizeAll" -Value $InvisibleCursor
Set-ItemProperty -Path $RegPath -Name "SizeNESW" -Value $InvisibleCursor
Set-ItemProperty -Path $RegPath -Name "SizeNS" -Value $InvisibleCursor
Set-ItemProperty -Path $RegPath -Name "SizeNWSE" -Value $InvisibleCursor
Set-ItemProperty -Path $RegPath -Name "SizeWE" -Value $InvisibleCursor
Set-ItemProperty -Path $RegPath -Name "UpArrow" -Value $InvisibleCursor

# Apply changes
Stop-Process -Name "explorer" -Force
Start-Process "explorer"
