; # =============================================================================== #
; # Maximize-Windows.ahk
; # Purpose: Find all windows that match the names listed in the variable "processes"
; #          and maximize them all at once.
; # =============================================================================== #
!a::maximize_all()
maximize_all()
{
    ; Map of exe names
    ; Mapping is faster than iterating through an array or parsing a string
    processes := Map("cmd.exe",1
                    ,"PowerShell.exe",1
                    ,"pwsh.exe",1
                    ,"zed.exe",1
                    ,"chrome.exe",1
                    ,"alacritty.exe",1
                    ,"neovide.exe",1
                    ,"WindowsTerminal.exe",1
                    ,"mintty.exe",1
                    ,"notepad++.exe",1
                    ,"explorer.exe",1
                    ,"Termius.exe",1)
    processes.Default := 0                      ; Set a default when key not found

    dhw := A_DetectHiddenWindows                ; Backup current setting
    DetectHiddenWindows(0)                      ; Disable DHW

    for _, id in WinGetList() {                 ; Loop through each window
        id := "ahk_id " id                      ;  Create a window id (Window handles are unique)
        if (WinGetMinMax(id) = 0                ;  If the window is a normal/restored state
        && WinExist(id)                         ;  AND the window actually exists
        && processes[WinGetProcessName(id)])    ;  AND the process name is a found in the processes map
            WinMaximize(id)                     ;   Maximize that window
    }

    DetectHiddenWindows(dhw)                    ; Reset DHW to whatever it was
}
