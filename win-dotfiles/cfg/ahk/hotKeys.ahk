; ----------------------------------------------------------
; Remap Keys:
; ----------------------------------------------------------
; Caps Lock => ESC: Caps Lock can still be accessed with Ctrl and Caps Lock
^CapsLock::CapsLock
Capslock::Esc
; ----------------------------------------------------------
; System Controlls
; ----------------------------------------------------------
!+r:: Reload
!q:: WinKill("A")
!+m:: WinMinimize("A")
!+t::
{
    WinSetAlwaysOnTop -1, "A"
}
!f::
{
    if (WinGetMinMax("A") = 1)
        {
            WinRestore "A"
        }
    else
        {
            WinMaximize "A"
        }
}
; ----------------------------------------------------------
; Power Menu:
; ----------------------------------------------------------
!^q:: Shutdown 0
!^r:: Shutdown 6
!^p:: Shutdown 1
; ----------------------------------------------------------
; Run App
; ----------------------------------------------------------
!Enter:: Run("wt.exe")
!+Enter:: Run("alacritty.exe")
!+n:: Run("explorer.exe")
!w:: Run("chrome.exe")
!i:: Run("msedge.exe")
!v:: Run('neovide.exe "C:\Users\' A_UserName '\Projects"')
!n:: Run(EnvGet("PROGRAMFILES") '\Git\bin\bash.exe -c "yazi.exe ~"')
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
!+f::Komorebic("toggle-maximize")
!+Space::Komorebic("toggle-float")
; Window manager options
!r::Komorebic("retile")
!+p::Komorebic("toggle-pause")
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
