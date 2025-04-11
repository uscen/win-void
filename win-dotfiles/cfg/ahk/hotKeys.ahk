; # =============================================================================== #
; # Helpers:                                                                        #
; # =============================================================================== #
; Toggle Awake
KeepAwake() {
    static toggle := 0, dir := 0
    SetTimer(move_mouse, (toggle := !toggle) ? 2*60000 : 0)
    move_mouse() => Click((dir := !dir) ? '+1' : '-1', 0, 0, 'Rel')
if toggle {
    ToolTip "Mouse movement activated"
    SetTimer () => ToolTip(), -2000
    }
if !toggle {
    ToolTip  "Mouse movement deactivated"
    SetTimer () => ToolTip(), -2000
    }
}
; # =============================================================================== #
; # Remap Keys:                                                                     #
; # =============================================================================== #
^CapsLock::CapsLock
Capslock::Esc
; # =============================================================================== #
; # System Controlls:                                                               #
; # =============================================================================== #
!q:: WinClose("A")
!^q:: Shutdown 0
!+r:: Reload
!+m:: WinMinimize("A")
!+s:: KeepAwake()
!+t:: WinSetAlwaysOnTop -1, "A"
!f:: WinGetMinMax("A")=1 ? WinRestore("A"):WinMaximize("A")
!+f::  WinSetStyle "^0xC40000", "A"
; # =============================================================================== #
; # Focus Next/Previews:                                                            #
; # =============================================================================== #
; !k::Send "!{Escape}"
; !j::Send "!+{Escape}"
; # =============================================================================== #
; # Run App:                                                                        #
; # =============================================================================== #
!Enter:: Run("alacritty.exe")
!+Enter:: Run("wt.exe")
!+n:: Run("explorer.exe")
!w:: Run("chromium.exe")
!i:: Run("msedge.exe")
!v:: Run("neovide.exe")
!e:: Run("thunderbird.exe")
!z:: Run("zed.exe")
!n:: Run 'alacritty.exe -e "C:\Program Files\Git\bin\bash.exe -c yazi"'
!^c:: Run('"C:\Users\' A_UserName '\scoop\apps\vscode\current\Code.exe"')
!^+s:: Run('autohotkey.exe "C:\Users\' A_UserName '\.config\ahk\awake.ahk"')
!y::{
    if !WinExist("ahk_exe FreeTube.exe")
      Run('"C:\Users\' A_UserName '\scoop\apps\freetube\current\FreeTube.exe"')
    WinWaitActive("ahk_exe FreeTube.exe"), WinSetStyle("-0xC40000", "ahk_exe FreeTube.exe")
}
; # =============================================================================== #
; # Komorebi Window Manager:                                                        #
; # =============================================================================== #
Komorebic(cmd) {
    RunWait(format("komorebic.exe {}", cmd), , "Hide")
}
; Focus windows
!k::Komorebic("cycle-focus previous")
!j::Komorebic("cycle-focus next")
; Move windows
!+k::Komorebic("cycle-move previous")
!+j::Komorebic("cycle-move next")
; Resize
!l::Komorebic("resize-axis horizontal increase")
!h::Komorebic("resize-axis horizontal decrease")
!^j::Komorebic("resize-axis vertical increase")
!^k::Komorebic("resize-axis vertical decrease")
; Manipulate windows
!s::Komorebic("promote")
!m::Komorebic("toggle-monocle")
!^f::Komorebic("toggle-maximize")
!+Space::Komorebic("toggle-float")
; Window manager options
!r::Komorebic("retile")
!^p::Komorebic("toggle-pause")
; Layouts
!x::Komorebic("flip-layout horizontal")
!+x::Komorebic("flip-layout vertical")
; Workspaces
!1::Komorebic("focus-workspace 0")
!2::Komorebic("focus-workspace 1")
!3::Komorebic("focus-workspace 2")
!4::Komorebic("focus-workspace 3")
!5::Komorebic("focus-workspace 4")
!6::Komorebic("focus-workspace 5")
!7::Komorebic("focus-workspace 6")
!8::Komorebic("focus-workspace 7")
; Move windows across workspaces
!+1::Komorebic("move-to-workspace 0")
!+2::Komorebic("move-to-workspace 1")
!+3::Komorebic("move-to-workspace 2")
!+4::Komorebic("move-to-workspace 3")
!+5::Komorebic("move-to-workspace 4")
!+6::Komorebic("move-to-workspace 5")
!+7::Komorebic("move-to-workspace 6")
!+8::Komorebic("move-to-workspace 7")
