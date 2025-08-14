# =============================================================================== #
# Change Keyboard Rate:		                                                        #
# =============================================================================== #
Set-Location "HKCU:\Control Panel\Accessibility\Keyboard Response"
Set-ItemProperty -Path . -Name AutoRepeatDelay       -Value 140
Set-ItemProperty -Path . -Name AutoRepeatRate        -Value 2
Set-ItemProperty -Path . -Name DelayBeforeAcceptance -Value 0
Set-ItemProperty -Path . -Name BounceTime            -Value 0
Set-ItemProperty -Path . -Name Flags                 -Value 47
# =============================================================================== #
# Remap Caps Lock to Escape                                                       #
# =============================================================================== #
$hexified = "00,00,00,00,00,00,00,00,02,00,00,00,01,00,3a,00,00,00,00,00".Split(',') | % { "0x$_"};
$kbLayout = 'HKLM:\System\CurrentControlSet\Control\Keyboard Layout';
New-ItemProperty -Path $kbLayout -Name "Scancode Map" -PropertyType Binary -Value ([byte[]]$hexified);
