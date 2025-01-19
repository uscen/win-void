; ----------------------------------------------------------
; Helpers:
; ----------------------------------------------------------
; Toggle Awake
KeepAwake() {
    static toggle := 0, dir := 0
    SetTimer(move_mouse, (toggle := !toggle) ? 4*60000 : 0)
    move_mouse() => Click((dir := !dir) ? '+1' : '-1', 0, 0, 'Rel')
if toggle {
    MsgBox "Mouse movement activated"
    }
if !toggle {
    MsgBox "Mouse movement deactivated"
    }
}
; Toggle Taskbar
HideShowTaskbar() {
    static ABM_SETSTATE := 0xA, ABS_AUTOHIDE := 0x1, ABS_ALWAYSONTOP := 0x2
    static hide := 0
    hide := !hide
    APPBARDATA := Buffer(size := 2*A_PtrSize + 2*4 + 16 + A_PtrSize, 0)
    NumPut("UInt", size, APPBARDATA), NumPut("Ptr", WinExist("ahk_class Shell_TrayWnd"), APPBARDATA, A_PtrSize)
    NumPut("UInt", hide ? ABS_AUTOHIDE : ABS_ALWAYSONTOP, APPBARDATA, size - A_PtrSize)
    DllCall("Shell32\SHAppBarMessage", "UInt", ABM_SETSTATE, "Ptr", APPBARDATA)
}
; ----------------------------------------------------------
; Remap Keys:
; ----------------------------------------------------------
^CapsLock::CapsLock
Capslock::Esc
; ----------------------------------------------------------
; System Controlls
; ----------------------------------------------------------
!q:: WinKill("A")
!^q:: Shutdown 0
!+r:: Reload
!+m:: WinMinimize("A")
!^s:: KeepAwake()
!^t:: HideShowTaskbar()
!+t:: WinSetAlwaysOnTop -1, "A"
!f:: WinGetMinMax("A")=1 ? WinRestore("A"):WinMaximize("A")
!+f:: {
    WinSetStyle "^0xC00000", "A"
    WinSetStyle "^0x840000", "A"
}
; ----------------------------------------------------------
; Run App
; ----------------------------------------------------------
!Enter:: Run("wt.exe")
!+Enter:: Run("alacritty.exe")
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
!+Space::Komorebic("toggle-float")
; Window manager options
!r::Komorebic("retile")
!+p::Komorebic("toggle-pause")
; Layouts
!x::Komorebic("flip-layout horizontal")
!+x::Komorebic("flip-layout vertical")
; Workspaces
!Tab::Komorebic("focus-last-workspace")
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
