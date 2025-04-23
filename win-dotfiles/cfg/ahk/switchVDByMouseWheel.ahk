; # =============================================================================== #
; # Swtch Virtual Desktop By Mouse Wheel:                                           #
; # =============================================================================== #
CoordMode "Mouse" , "Screen" ; Coordinates are relative to the desktop (entire screen).

WheelUp::
{
	MouseGetPos &xpos, &ypos
	if (xpos = 1919 and ypos = 1079) {
		;MsgBox "Mouse Position " xpos ":" ypos

		Send "^#{Right}"
	} else {
		Send "{WheelUp}"
	}
}

WheelDown::
{
	MouseGetPos &xpos, &ypos
	if (xpos = 1919 and ypos = 1079) {
		;MsgBox "Mouse Position " xpos ":" ypos

		Send "^#{Left}"
	} else {
		Send "{WheelDown}"
	}
}
