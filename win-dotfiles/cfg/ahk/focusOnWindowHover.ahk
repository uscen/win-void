; # =============================================================================== #
; # Focus Follows Mouse:                                                            #
; # =============================================================================== #
Persistent
OnExit AppExit
SetActiveWindowTracking(True)

AppExit(*){
  SetActiveWindowTracking(-1)
  ExitApp
}

SetActiveWindowTracking(Track, OnTop := True, Delay := 10) {
  Static FirstCall := True
  Static SPITrack := 0
  Static SPIOnTop := 0
  Static SPIDelay := 0
  Static SPI := "User32.dll\SystemParametersInfo"
  If (FirstCall) {
    DllCall(SPI, "UInt", 0x1000, "UInt", 0, "UIntP", SPITrack, "UInt", False)
    DllCall(SPI, "UInt", 0x100C, "UInt", 0, "UIntP", SPIOnTop, "UInt", False)
    DllCall(SPI, "UInt", 0x2002, "UInt", 0, "UIntP", SPIDelay, "UInt", False)
    FirstCall := False
  }
  If (Track = -1) {
    Track := SPITrack
    OnTop := SPIOnTop
    Delay := SPIDelay
  } Else If !(Track) {
    OnTop := False
    Delay := 0
  }
  DllCall(SPI, "UInt", 0x1001, "UInt", 0, "Ptr", Track, "UInt", False)
  DllCall(SPI, "UInt", 0x100D, "UInt", 0, "Ptr", OnTop, "UInt", False)
  DllCall(SPI, "UInt", 0x2003, "UInt", 0, "Ptr", Delay, "UInt", False)
}
