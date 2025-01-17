; ----------------------------------------------------------
; KEEP COMPUTER AWAKE
; ----------------------------------------------------------
!^s:: {
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
