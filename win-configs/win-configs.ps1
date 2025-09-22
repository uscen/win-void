# =============================================================================== #
# Windows Config:				                                                          #
# =============================================================================== #
# =============================================================================== #
# region — Privilege Check:                                                       #
# =============================================================================== #
If (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
    ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "This script must be run as Administrator. Exiting."
    Exit 1
}
# =============================================================================== #
# HOME:						                                                                #
# =============================================================================== #
$sourceHome = "$Env:USERPROFILE\win-void\win-dotfiles\home\*"
$destHome = "$Env:USERPROFILE\"

Get-ChildItem -Path $sourceHome | ForEach-Object {
    $targetPath = Join-Path $destHome $_.Name
    if (Test-Path $targetPath) {
        Remove-Item $targetPath -Force -Recurse
    }
    New-Item -ItemType SymbolicLink -Path $targetPath -Target $_.FullName -Force
}

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
    if (Test-Path $targetPath) {
        Remove-Item $targetPath -Force -Recurse
    }
    New-Item -ItemType SymbolicLink -Path $targetPath -Target $_.FullName -Force
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
    if (Test-Path $targetPath) {
        Remove-Item $targetPath -Force -Recurse
    }
    New-Item -ItemType SymbolicLink -Path $targetPath -Target $_.FullName -Force
}

# Local AppData:                                                                  #
# =============================================================================== #
$sourceLocal = "$Env:USERPROFILE\win-void\win-dotfiles\app\local"
Get-ChildItem -Path $sourceLocal | ForEach-Object {
    $targetPath = Join-Path $Env:localAppData $_.Name
    if (Test-Path $targetPath) {
        Remove-Item $targetPath -Force -Recurse
    }
    New-Item -ItemType SymbolicLink -Path $targetPath -Target $_.FullName -Force
}

# MPV configuration:                                                              #
# =============================================================================== #
$mpvSource = "$env:USERPROFILE\win-void\win-dotfiles\app\roming\mpv"
$mpvDest = "$env:USERPROFILE\scoop\persist\mpv\portable_config"

if ((Test-Path $mpvSource) -and (Test-Path (Split-Path $mpvDest -Parent))) {
    if (Test-Path $mpvDest) { Remove-Item $mpvDest -Force -Recurse }
    New-Item -ItemType SymbolicLink -Path $mpvDest -Target $mpvSource -Force
}

# Tealdeer configuration:                                                         #
# =============================================================================== #
$tealdeerSource = "$env:USERPROFILE\win-void\win-dotfiles\app\roming\tealdeer\tealdeer"
$tealdeerDest = "$env:USERPROFILE\scoop\persist\tealdeer"

if (Test-Path $tealdeerSource) {
    if (-Not (Test-Path (Split-Path $tealdeerDest -Parent))) {
        New-Item -Path (Split-Path $tealdeerDest -Parent) -ItemType Directory -Force | Out-Null
    }
    if (Test-Path $tealdeerDest) {
        Remove-Item $tealdeerDest -Force -Recurse
    }
    New-Item -ItemType SymbolicLink -Path $tealdeerDest -Target $tealdeerSource -Force
}

# =============================================================================== #
# Others:					                                                                #
# =============================================================================== #
$wtSource = "$Env:USERPROFILE\win-void\win-dotfiles\others\wt\LocalState"
$wtDest = "$Env:USERPROFILE\scoop\persist\windows-terminal\settings"
if ((Test-Path $wtSource) -and (Test-Path (Split-Path $wtDest -Parent))) {
    if (Test-Path $wtDest) {
        Remove-Item $wtDest -Force -Recurse
    }
    New-Item -ItemType SymbolicLink -Path $wtDest -Target $wtSource -Force
}
