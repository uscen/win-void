# ================================================#
# Change Keyboard Rate:		                        #
# ================================================#
Set-Location "HKCU:\Control Panel\Accessibility\Keyboard Response"
Set-ItemProperty -Path . -Name AutoRepeatDelay       -Value 200
Set-ItemProperty -Path . -Name AutoRepeatRate        -Value 10
Set-ItemProperty -Path . -Name DelayBeforeAcceptance -Value 0
Set-ItemProperty -Path . -Name BounceTime            -Value 0
Set-ItemProperty -Path . -Name Flags                 -Value 59
