# ================================================#
# Change Keybard reate:			                      #
# ================================================#
Set-ItemProperty -Path 'HKCU:\Control Panel\Accessibility\Keyboard Response' -Name AutoRepeatDelay       -Value 200
Set-ItemProperty -Path 'HKCU:\Control Panel\Accessibility\Keyboard Response' -Name AutoRepeatRate        -Value 6
Set-ItemProperty -Path 'HKCU:\Control Panel\Accessibility\Keyboard Response' -Name DelayBeforeAcceptance -Value 0
Set-ItemProperty -Path 'HKCU:\Control Panel\Accessibility\Keyboard Response' -Name BounceTime            -Value 0
Set-ItemProperty -Path 'HKCU:\Control Panel\Accessibility\Keyboard Response' -Name Flags                 -Value 47
