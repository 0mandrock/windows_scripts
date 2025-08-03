Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class MouseHider {
    [DllImport("user32.dll")]
    public static extern int ShowCursor(bool bShow);

    public static void ShowCursor() {
        while (ShowCursor(true) < 0) {
            // Keep showing until the cursor is fully visible
        }
    }
}
"@

# Show the mouse cursor
[MouseHider]::ShowCursor()