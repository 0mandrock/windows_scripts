Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class MouseHider {
    [DllImport("user32.dll")]
    public static extern int ShowCursor(bool bShow);

    public static void HideCursor() {
        while (ShowCursor(false) >= 0) {
            // Keep hiding until the cursor is fully hidden
        }
    }
}
"@

# Hide the mouse cursor
[MouseHider]::HideCursor()