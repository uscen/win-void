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
!+s:: KeepAwake()
