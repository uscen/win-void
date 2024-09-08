# ================================================#
# Windows Config:				                  #
# ================================================#
# ================================================#
# Komorebi Window Manager:			              #
# ================================================#
komorebic enable-autostart --ffm --whkd --config $Env:USERPROFILE\.config\komorebi\komorebi.json
# ================================================#
# HOME:						                      #
# ================================================#
Copy-Item -Path $Env:USERPROFILE\win-void\win-dotfiles\home\* -Destination $Env:USERPROFILE\ -Recurse -Force
# ================================================#
# Config:					                      #
# ================================================#
if (-Not (Test-Path -Path $Env:USERPROFILE\.config)) {
    New-Item -Path $Env:USERPROFILE\.config -ItemType Directory | Out-Null
}
Copy-Item -Path $Env:USERPROFILE\win-void\win-dotfiles\cfg\* -Destination $Env:USERPROFILE\.config\ -Recurse -Force
# ================================================#
# AppData:					                      #
# ================================================#
if (-Not (Test-Path -Path $Env:localAppData)) {
    New-Item -Path $Env:localAppData -ItemType Directory | Out-Null
}
if (-Not (Test-Path -Path $Env:AppData)) {
    New-Item -Path $Env:AppData -ItemType Directory | Out-Null
}
Copy-Item -Path $Env:USERPROFILE\win-void\win-dotfiles\app\roming\* -Destination $Env:AppData\ -Recurse -Force
Copy-Item -Path $Env:USERPROFILE\win-void\win-dotfiles\app\local\* -Destination $Env:localAppData\ -Recurse -Force
# ================================================#
# Others:					                      #
# ================================================#
Copy-Item -Path $Env:USERPROFILE\win-void\win-dotfiles\others\docs\* -Destination $Env:USERPROFILE\Documents\ -Recurse -Force
Copy-Item -Path $Env:USERPROFILE\win-void\win-dotfiles\others\wt\* -Destination $Env:localAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\ -Recurse -Force
# ================================================#
# Change Keybard reate:					          #
# ================================================#
Set-Location "HKCU:\Control Panel\Accessibility\Keyboard Response"
Set-ItemProperty -Path . -Name AutoRepeatDelay       -Value 200
Set-ItemProperty -Path . -Name AutoRepeatRate        -Value 6
Set-ItemProperty -Path . -Name DelayBeforeAcceptance -Value 0
Set-ItemProperty -Path . -Name BounceTime            -Value 0
Set-ItemProperty -Path . -Name Flags                 -Value 59
