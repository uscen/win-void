; # =============================================================================== #
; # List of applications you want to auto-fullscreen:                               #
; # =============================================================================== #
apps := ["WindowsTerminal.exe", "alacritty.exe", "zed.exe", "neovide.exe", "explorer.exe", "notepad++.exe", "chrome.exe", "FreeTube.exe"]

; # =============================================================================== #
; # Start monitoring for each application:                                          #
; # =============================================================================== #
for index, app in apps {
    auto_fullscreen(app)
}

auto_fullscreen(process) {
    WS_CAPTION := 0xC00000
    id := 'ahk_exe ' process
    if WinActive(id) {
        if (WinGetStyle(id) & WS_CAPTION)
            WinSetStyle('-' WS_CAPTION, id)
        if (WinGetMinMax(id) != 1)
            WinMaximize(id)
    }
    SetTimer(auto_fullscreen.Bind(process), -1000)
}
