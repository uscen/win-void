# =============================================================================== #
# Re Run As Administrator:		                                                    #
# =============================================================================== #
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Start-Process powershell "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}
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
# https://gist.github.com/FelikZ/f742675fd74514cd20ec3bb2f948f804
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layout"
$scancodeMap = [byte[]](
    0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,
    0x02,0x00,0x00,0x00,
    0x01,0x00,0x3A,0x00,
    0x00,0x00,0x00,0x00
)
Set-ItemProperty -Path $registryPath -Name "Scancode Map" -Value $scancodeMap
