; # =============================================================================== #
; # Resize And Move By Keyboard:                                                    #
; # =============================================================================== #
#Requires AutoHotkey v2.0.19+

$^#l::windowManagment.resize('R')
$^#h::windowManagment.resize('L')
$^#k::windowManagment.resize('U')
$^#j::windowManagment.resize('D')

$^#WheelUp::windowManagment.resize_unit_increase()
$^#WheelDown::windowManagment.resize_unit_decrease()

$#l::windowManagment.move('R')
$#h::windowManagment.move('L')
$#k::windowManagment.move('U')
$#j::windowManagment.move('D')

$#WheelUp::window.move_unit_increase()
$#WheelDown::window.move_unit_decrease()

class windowManagment {
    static move_units := 50                                                 ; Amount of pixels a window will move
    static resize_units := 50                                               ; Amount of pixels a window is resized by
    static unit_amount := 10                                                ; Amount to change units by

    ; # =============================================================================== #
    ; Use 'Left', 'Right', 'Up', and 'Down' for direction
    ; The first letter can also be used
    ; # =============================================================================== #
    static move(direction) => this.re_mo('move', direction)                 ; Move window a direction
    static resize(direction) => this.re_mo('resize', direction)             ; Resize window a direction

    ; # =============================================================================== #
    ; # Increment or decrement the move_units and resize_units:                         #
    ; # =============================================================================== #
    static move_unit_increase() => this.unit_increase('move_units')
    static move_unit_decrease() => this.unit_decrease('move_units')
    static resize_unit_increase() => this.unit_increase('resize_units')
    static resize_unit_decrease() => this.unit_decrease('resize_units')

    static unit_increase(type) {
        this.%type% += this.unit_amount
        this.notify(type)
    }

    static unit_decrease(type) {
        if (this.%type% - this.unit_amount < 0)
            this.%type% := 1
        else this.%type% -= this.unit_amount
        this.notify(type)
    }

    ; # =============================================================================== #
    ; # Resize and move window
    ; # type should be 'resize' otherwise 'move' is assumed
    ; # direction should be 'Left', 'Right', 'Up', or 'Down'
    ; # First letter is what's used
    ; # =============================================================================== #
    static re_mo(type, direction) {
        direction := SubStr(direction, 1, 1)
        id := 'ahk_id ' WinActive('A')
        WinGetPos(&x, &y, &w, &h, id)
        if (type = 'resize')
            switch direction {
                case 'R': w += this.resize_units
                case 'L': w -= this.resize_units
                case 'U': h -= this.resize_units
                case 'D': h += this.resize_units
            }
        else
            switch direction {
                case 'R': x += this.resize_units
                case 'L': x -= this.resize_units
                case 'U': y -= this.resize_units
                case 'D': y += this.resize_units
            }
        WinMove(x, y, w, h, id)
    }

    ; # =============================================================================== #
    ; # Handles notifications:                                                          #
    ; # =============================================================================== #
    static notify(prop) => ToolTip(prop ' set to: ' this.%prop%)
        . SetTimer((*) => ToolTip(), -1500)
}
