; # =============================================================================== #
; # Start Menu:                                                                     #
; # =============================================================================== #
myMenu := Menu()
myMenu.Add("SHUTDOWN", myMenuHandler)
myMenu.Add()
myMenu.Add("REBOOT", myMenuHandler)
myMenu.Add()
myMenu.Add("SUSPEND", myMenuHandler)
myMenu.Add()
myMenu.Add("LOGOUT", myMenuHandler)
; # =============================================================================== #
; # Added Icons:                                                                    #
; # =============================================================================== #
; # =============================================================================== #
; # myMenu.SetIcon("Shutdown", A_AhkPath, -207) ; icon with resource ID 207
; # myMenu.SetIcon("Restart", A_AhkPath, -207) ; 2nd icon group from the file
; # myMenu.SetIcon("Logout", A_AhkPath, -207) ; icon with resource ID 206
; # =============================================================================== #
; # When an item is selected, the following parameters are automatically passsed:
; # itemName - name of the item selected
; # pos - the position of the selected item in the list
; # menuObj - the menu object that called this function
; # =============================================================================== #
myMenuHandler(itemName, pos, menuObj) {
    switch pos {
        case 1:
            Shutdown 9
        case 3:
            Shutdown 6
        case 5:
            DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 0, "Int", 0)
        case 7:
            Shutdown 0
    }
}
!+p::myMenu.Show()
; # =============================================================================== #
; # Force menus to use dark mode:                                                   #
; # =============================================================================== #
MenuDark(2)
/**
 * Sets menu light or dark mode
 * @param Dark one of the following:
 * * 0 = Default
 * * 1 = AllowDark
 * * 2 = ForceDark
 * * 3 = ForceLight
 * * 4 = Max
 */
MenuDark(Dark) {
    ;https://stackoverflow.com/a/58547831/894589
    uxtheme := DllCall("GetModuleHandle", "str", "uxtheme", "ptr")
    SetPreferredAppMode := DllCall("GetProcAddress", "ptr", uxtheme, "ptr", 135, "ptr")
    FlushMenuThemes := DllCall("GetProcAddress", "ptr", uxtheme, "ptr", 136, "ptr")
    DllCall(SetPreferredAppMode, "int", Dark)
    DllCall(FlushMenuThemes)
}
