# =============================================================================== #
# Windows Config:				                                                          #
# =============================================================================== #
$source = "$Env:USERPROFILE\win-void\win-dotfiles\home\.glzr"
$target = "$Env:USERPROFILE\.glzr"
if (Test-Path $target) { Remove-Item $target -Force -Recurse }
New-Item -ItemType Junction -Path $target -Target $source -Force
# =============================================================================== #
# Config:					                                                                #
# =============================================================================== #
$sourceConfig = "$Env:USERPROFILE\win-void\win-dotfiles\cfg"
$destConfig = "$Env:USERPROFILE\.config"
if (-Not (Test-Path -Path $destConfig)) {
    New-Item -Path $destConfig -ItemType Directory | Out-Null
}
Get-ChildItem -Path $sourceConfig | ForEach-Object {
    $targetPath = Join-Path $destConfig $_.Name
    if (Test-Path $targetPath) { Remove-Item $targetPath -Force -Recurse }
    New-Item -ItemType Junction -Path $targetPath -Target $_.FullName -Force
}
# =============================================================================== #
# AppData:					                                                              #
# =============================================================================== #
if (-Not (Test-Path -Path $Env:localAppData)) {
    New-Item -Path $Env:localAppData -ItemType Directory | Out-Null
}
if (-Not (Test-Path -Path $Env:AppData)) {
    New-Item -Path $Env:AppData -ItemType Directory | Out-Null
}
# Roaming AppData:                                                                #
# =============================================================================== #
$sourceRoaming = "$Env:USERPROFILE\win-void\win-dotfiles\app\roming"
Get-ChildItem -Path $sourceRoaming | ForEach-Object {
    $targetPath = Join-Path $Env:AppData $_.Name
    if (Test-Path $targetPath) { Remove-Item $targetPath -Force -Recurse }
    New-Item -ItemType Junction -Path $targetPath -Target $_.FullName -Force
}
# Local AppData:                                                                  #
# =============================================================================== #
$sourceLocal = "$Env:USERPROFILE\win-void\win-dotfiles\app\local"
Get-ChildItem -Path $sourceLocal | ForEach-Object {
    $targetPath = Join-Path $Env:localAppData $_.Name
    if (Test-Path $targetPath) { Remove-Item $targetPath -Force -Recurse }
    New-Item -ItemType Junction -Path $targetPath -Target $_.FullName -Force
}
# MPV configuration:                                                              #
# =============================================================================== #
$mpvSource = "$env:USERPROFILE\win-void\win-dotfiles\app\roming\mpv"
$mpvDest = "$env:USERPROFILE\scoop\persist\mpv\portable_config"
if ((Test-Path $mpvSource) -and (Test-Path (Split-Path $mpvDest -Parent))) {
    if (Test-Path $mpvDest) { Remove-Item $mpvDest -Force -Recurse }
    New-Item -ItemType Junction -Path $mpvDest -Target $mpvSource -Force
}
# Tealdeer configuration:                                                         #
# =============================================================================== #
$tealdeerSource = "$env:USERPROFILE\win-void\win-dotfiles\app\roming\tealdeer\tealdeer"
$tealdeerDest = "$env:USERPROFILE\scoop\persist\tealdeer"
if (Test-Path $tealdeerSource) {
    if (Test-Path $tealdeerDest) { Remove-Item $tealdeerDest -Force -Recurse }
    New-Item -ItemType Junction -Path $tealdeerDest -Target $tealdeerSource -Force
}
# =============================================================================== #
# Others:					                                                                #
# =============================================================================== #
$wtSource = "$Env:USERPROFILE\win-void\win-dotfiles\others\wt\LocalState"
$wtDest = "$Env:USERPROFILE\scoop\persist\windows-terminal\settings"
if ((Test-Path $wtSource) -and (Test-Path (Split-Path $wtDest -Parent))) {
    if (Test-Path $wtDest) { Remove-Item $wtDest -Force -Recurse }
    New-Item -ItemType Junction -Path $wtDest -Target $wtSource -Force
}
