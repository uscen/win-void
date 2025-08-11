# =============================================================================== #
# Change Keyboard Rate:		                                                        #
# =============================================================================== #
Set-Location "HKCU:\Control Panel\Accessibility\Keyboard Response"
Set-ItemProperty -Path . -Name AutoRepeatDelay       -Value 130
Set-ItemProperty -Path . -Name AutoRepeatRate        -Value 2
Set-ItemProperty -Path . -Name DelayBeforeAcceptance -Value 0
Set-ItemProperty -Path . -Name BounceTime            -Value 0
Set-ItemProperty -Path . -Name Flags                 -Value 47
