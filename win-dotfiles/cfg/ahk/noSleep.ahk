; ----------------------------------------------------------
; Noise.ahk
; Sends keystrokes to keep the PC from falling asleep
; Skrommel @2005
; Updated to v2 by iseahound @2024
; ----------------------------------------------------------

#SingleInstance Force
DetectHiddenWindows(true)
SetKeyDelay(0, 0)

; Sets the interval in milliseconds
interval := 60000 ; 1 minute

tray := A_TrayMenu
tray.Delete() ; V1toV2: not 100% replacement of NoStandard, Only if NoStandard is used at the beginning
tray.Add("&Show", (*) => app.show())
tray.Add("E&xit", (*) => ExitApp())
tray.Default := "&Show"

app := Gui("+Owner -AlwaysOnTop -Disabled +SysMenu +Caption +Border +ToolWindow", "Noise!")
app.OnEvent("Escape", (*) => app.Hide())
editbox := app.AddEdit()
app.AddButton("default", "Quit")
   .OnEvent("Click", (*) => ExitApp())
app.Show("Hide")

; Check A_TimeIdlePhysical anyways to prevent potential interruption, but make it short.
SetTimer(() => (A_TimeIdlePhysical > min(30000, interval)) && MakeNoise(), interval)

MakeNoise() {
   ; Clears the edit box.
   editbox.Value := ""

   ; SendText releases all modifers, so this prevents the user from noticing.
   ; Use 8 seconds as a timeout, this gives 6 * 5 = 30 max seconds the jiggler can be paused.
   KeyWait 'CapsLock', 'T5' ; For those that use CapsLock as a modifier
   KeyWait 'LWin', 'T5'
   KeyWait 'RWin', 'T5'
   KeyWait 'Control', 'T5'
   KeyWait 'Alt', 'T5'
   KeyWait 'Shift', 'T5'

   ; Send a random lowercase letter to the hidden text box.
   ControlSendText Chr(Random(97, 122)), "Edit1", "ahk_id" app.hwnd
}
