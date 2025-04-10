; # =============================================================================== #
; # Border Around Active Window:                                                    #
; # =============================================================================== #
SetTimer(DrawBorder, 100)
DrawBorder() {
    Static OS := 3
    Static BG := "8ccf7e"
    Static myGui := Gui("+AlwaysOnTop +ToolWindow -Caption", "GUI4Border")
    myGui.BackColor := BG

    WA := WinActive("A")

    ; Skip if no window is active, or if the active window is the desktop (Progman/WorkerW)
    if (WA = 0 || WinGetClass(WA) ~= "Progman|WorkerW|Shell_TrayWnd") {
        myGui.Hide()
        return
    }

    ; Skip minimized/maximized windows and the border GUI itself
    if (!WinGetMinMax(WA) && !WinActive("GUI4Border ahk_class AutoHotkeyGUI")) {
        WinGetPos(&wX, &wY, &wW, &wH, WA)
        myGui.Show("x" wX " y" wY " w" wW " h" wH " NA")
        try {
            WinSetRegion("0-0 " wW "-0 " wW "-" wH " 0-" wH " 0-0 " OS "-" OS " " wW-OS
            . "-" OS " " wW-OS "-" wH-OS " " OS "-" wH-OS " " OS "-" OS, "GUI4Border")
        }
    } else {
        myGui.Hide()
    }
}
