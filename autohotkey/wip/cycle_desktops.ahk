F8::
    current := DllCall("VirtualDesktopAccessor\GetCurrentDesktopNumber")
    total   := DllCall("VirtualDesktopAccessor\GetDesktopCount")
    next := current + 1
    if (next >= total)
        next := 0
    ; Переключение на следующий рабочий стол
    DllCall("VirtualDesktopAccessor\GoToDesktopNumber", "Int", next)
    ToolTip, % "Total: " total ", Current: " current ", Next: " next
return
