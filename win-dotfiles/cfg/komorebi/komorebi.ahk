; ----------------------------------------------------------
; Remap Caps Lock => ESC:
; ----------------------------------------------------------
Capslock::Esc
; ----------------------------------------------------------
; Run My Programms:
; ----------------------------------------------------------
!Enter:: Run "wt.exe"
!+Enter:: Run "alacritty.exe"
!i:: Run "zen.exe"
!w:: Run "chrome.exe"
!n:: Run "yazi.exe"
!v:: Run "neovide.exe"
!+n:: Run "explorer.exe"
!^c:: Run(EnvGet("LOCALAPPDATA") "\Programs\Microsoft VS Code\Code.exe")
!y:: Run(EnvGet("LOCALAPPDATA") "\Programs\FreeTube\FreeTube.exe")
; ----------------------------------------------------------
; Komorebi Window Manager:
; ----------------------------------------------------------
#SingleInstance Force

Komorebic(cmd) {
    RunWait(format("komorebic.exe {}", cmd), , "Hide")
}

!q::Komorebic("close")
!+c::Komorebic("close")
!+m::Komorebic("minimize")

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
!f::Komorebic("toggle-maximize")
!m::Komorebic("toggle-monocle")
!+Space::Komorebic("toggle-float")

; Window manager options
!+r::Komorebic("retile")
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
