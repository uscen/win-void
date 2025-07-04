; # =============================================================================== #
; # AutoStart App:                                                                  #
; # =============================================================================== #
Run(A_ComSpec " /c komorebi-bar.exe --config ~/.config/komorebi/komorebi.bar.json", , "Min")
RunWait("komorebi.exe --config ~/.config/komorebi/komorebi.json", , "Hide")
