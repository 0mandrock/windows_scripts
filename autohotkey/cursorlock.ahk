#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTimer, CheckMouseScreen, 100
return

CheckMouseScreen:
    MouseGetPos, mx, my
    SysGet, MonitorCount, MonitorCount
    SysGet, MonitorPrimary, MonitorPrimary
    SysGet, Monitor, Monitor, MonitorPrimary
    ; DrawTooltip("Left:`t" MonitorLeft "`nTop:`t" MonitorTop "`nRight:`t" MonitorRight "`nBottom:`t" MonitorBottom "`nMouse X:`t" mx "`nMouse Y:`t" my "`nMonitor Count:`t" MonitorCount "`nPrimary Monitor:`t" MonitorPrimary "`nMonitor Name:`t" MonitorName)

    if (mx < MonitorLeft || mx > MonitorRight || my < MonitorTop || my > MonitorBottom) {
        Gosub, SetMouse
    } 
    return

^L:: 
    SetMouse:
    CoordMode, Mouse, Screen
    MouseMove, 960, 540 
Return


DrawTooltip(toolTipText := "This is your tooltip!") {
        Tooltip, %toolTipText%
    return 
}

