; ----------------------------------------------------------
; Helpers:
; ----------------------------------------------------------
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
; ----------------------------------------------------------
; Remap Keys:
; ----------------------------------------------------------
^CapsLock::CapsLock
Capslock::Esc
; ----------------------------------------------------------
; System Controlls
; ----------------------------------------------------------
#HotIf !WinActive("ahk_exe yasb.exe")
!q:: WinClose("A")
#HotIf
!^q:: Shutdown 0
!+r:: Reload
!+m:: WinMinimize("A")
!+s:: KeepAwake()
!+t:: WinSetAlwaysOnTop -1, "A"
!^f:: WinGetMinMax("A")=1 ? WinRestore("A"):WinMaximize("A")
!+f:: {
    WinSetStyle "^0xC00000", "A"
    WinSetStyle "^0x840000", "A"
}
; ----------------------------------------------------------
; Run App
; ----------------------------------------------------------
!Enter:: Run("alacritty.exe")
!+Enter:: Run("wt.exe")
!+n:: Run("explorer.exe")
!w:: Run("chrome.exe")
!i:: Run("msedge.exe")
!v:: Run('neovide.exe "C:\Users\' A_UserName '\Projects"')
!^+s:: Run('autohotkey.exe "C:\Users\' A_UserName '\.config\ahk\awake.ahk"')
!n:: Run(EnvGet("PROGRAMFILES") '\Git\bin\bash.exe -c "yazi.exe ~"')
!e:: Run(EnvGet("PROGRAMFILES") "\Mozilla Thunderbird\thunderbird.exe")
!y:: Run(EnvGet("LOCALAPPDATA") "\Programs\FreeTube\FreeTube.exe")
!^c:: Run(EnvGet("LOCALAPPDATA") "\Programs\Microsoft VS Code\Code.exe")
; ----------------------------------------------------------
; Komorebi Window Manager:
; ----------------------------------------------------------
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
!t::Komorebic("toggle-monocle")
!f::Komorebic("toggle-maximize")
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
