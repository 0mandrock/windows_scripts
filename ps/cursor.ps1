# PowerShell-эквивалент AHK-скрипта для опроса положения курсора
# Требуется запуск с параметром -Sta (Single Threaded Apartment):
#   powershell.exe -Sta -ExecutionPolicy Bypass -File .\CheckMouse.ps1

# 1. Подключаем метод GetCursorPos из user32.dll
Add-Type -Namespace Win32 -Name NativeMethods @"
    using System;
    using System.Runtime.InteropServices;

    [StructLayout(LayoutKind.Sequential)]
    public struct POINT {
        public int X;
        public int Y;
    }

    public static class User32 {
        [DllImport("user32.dll")]
        [return: MarshalAs(UnmanagedType.Bool)]
        public static extern bool GetCursorPos(out POINT lpPoint);
    }
"@

# 2. Подключаем сборку Windows Forms для вывода MessageBox
Add-Type -AssemblyName System.Windows.Forms

# 3. Создаём таймер, аналог SetTimer в AHK
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 100  # интервал в миллисекундах

$timer.Add_Tick({
    # Получаем текущее положение курсора
    $pt = New-Object Win32.POINT
    [Win32.User32]::GetCursorPos([ref]$pt) | Out-Null

    if ($pt.Y -lt 100) {
        # Выводим MessageBox, как в оригинале
        [System.Windows.Forms.MessageBox]::Show(
            "Курсор в верхней части экрана! (y=$($pt.Y))",
            "Проверка курсора",
            [System.Windows.Forms.MessageBoxButtons]::OK,
            [System.Windows.Forms.MessageBoxIcon]::Information
        )
    }
})

# 4. Запускаем таймер и цикл обработки событий Windows Forms
$timer.Start()
[System.Windows.Forms.Application]::Run()