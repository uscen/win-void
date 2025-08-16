; # =============================================================================== #
; # Color Picker:                                                                   #
; # =============================================================================== #
; # =============================================================================== #
; # Global variables:                                                               #
; # =============================================================================== #
toggle := false

; # =============================================================================== #
; # Hotkey:                                                                         #
; # =============================================================================== #
!+c::ToggleColorPicker()
; # =============================================================================== #
; # Function to toggle the color picker on and off:                                 #
; # =============================================================================== #
ToggleColorPicker() {
    global toggle
    toggle := !toggle
    if (toggle) {
        SetTimer(UpdateColorInfo, 50)
    } else {
        SetTimer(UpdateColorInfo, 0)
        SetTimer () => ToolTip(), -2000 ; Hides a tooltip after a certain amount of time
    }
}

; # =============================================================================== #
; # Function to update the color information and display it in a tooltip:           #
; # =============================================================================== #
UpdateColorInfo() {
    MouseGetPos(&mouseX, &mouseY)
    color := GetProminentColor(mouseX, mouseY, 5)  ; 11x11 pixel area
    colorHex := Format("{:X}", color)
    colorName := GetColorName(color)
    ToolTip(colorHex, mouseX + 20, mouseY + 20)
    A_Clipboard :=  StrReplace(color, "0x", "#")
}

; # =============================================================================== #
; # Function to get the most prominent color in a specified area:                   #
; # =============================================================================== #
GetProminentColor(centerX, centerY, size := 11) {
    colors := Map()
    offset := (size - 1) // 2
    Loop size {
        y := A_Index - 1 - offset + centerY
        Loop size {
            x := A_Index - 1 - offset + centerX
            color := PixelGetColor(x, y, "RGB")
            if (colors.Has(color))
                colors[color]++
            else
                colors[color] := 1
        }
    }
    maxCount := 0
    prominentColor := 0
    for color, count in colors {
        if (count > maxCount && !IsGrayish(color)) {
            maxCount := count
            prominentColor := color
        }
    }
    if (prominentColor)
        return prominentColor
    else if (colors.Count) {
        for color, _ in colors {
            return color  ; Return the first color found
        }
    }
    return 0  ; Return 0 if no colors were found
}

; # =============================================================================== #
; # Function to check if a color is grayish:                                        #
; # =============================================================================== #
IsGrayish(color) {
    r := color >> 16 & 0xFF
    g := color >> 8 & 0xFF
    b := color & 0xFF
    return Abs(r - g) < 30 && Abs(g - b) < 30 && Abs(r - b) < 30
}

; # =============================================================================== #
; # Function to get the name of a color based on its RGB value:                     #
; # =============================================================================== #
GetColorName(RGBColor) {
    static colorMap := [
        {name: "White",  h: 0,   s: 0,   v: 100},
        {name: "Black",  h: 0,   s: 0,   v: 0},
        {name: "Yellow", h: 60,  s: 100, v: 100},
        {name: "Red",    h: 0,   s: 100, v: 100},
        {name: "Green",  h: 120, s: 100, v: 100},
        {name: "Blue",   h: 240, s: 100, v: 100},
        {name: "Purple", h: 300, s: 100, v: 100},
        {name: "Pink",   h: 350, s: 100, v: 100},
        {name: "Brown",  h: 30,  s: 100, v: 65},
        {name: "Orange", h: 30,  s: 100, v: 100},
        {name: "Gray",   h: 0,   s: 0,   v: 50}
    ]

    r := RGBColor >> 16 & 0xFF
    g := RGBColor >> 8 & 0xFF
    b := RGBColor & 0xFF

    hsv := RGBToHSV(r, g, b)
    h := hsv[1]
    s := hsv[2]
    v := hsv[3]

    minDistance := 360 * 360 + 100 * 100 + 100 * 100  ; Max possible distance in HSV space
    closestColor := "Unknown"

    for color in colorMap {
        distance := (h - color.h)**2 + (s - color.s)**2 + (v - color.v)**2
        if (distance < minDistance) {
            minDistance := distance
            closestColor := color.name
        }
    }

    return closestColor
}

; # =============================================================================== #
; # Function to convert RGB values to HSV:                                          #
; # =============================================================================== #
RGBToHSV(r, g, b) {
    r /= 255, g /= 255, b /= 255
    max := (r > g) ? (r > b ? r : b) : (g > b ? g : b)
    min := (r < g) ? (r < b ? r : b) : (g < b ? g : b)
    diff := max - min
    v := max * 100
    s := (max == 0) ? 0 : (diff / max) * 100
    if (max == min)
        h := 0
    else if (max == r)
        h := 60 * (g - b) / diff
    else if (max == g)
        h := 60 * (2 + (b - r) / diff)
    else
        h := 60 * (4 + (r - g) / diff)
    h := Mod(h + 360, 360)

    return [h, s, v]
}
