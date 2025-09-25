<#
.SYNOPSIS
  Comprehensive cleanup for Windows 11: temps, updates, logs, component store, and system files.

.DESCRIPTION
  - Ensures script runs with elevated privileges.
  - Deletes leftover installer/update caches.
  - Cleans Prefetch, Temp, CBS, DISM, Panther logs.
  - Executes DISM component cleanup with ResetBase.
  - Launches Disk Cleanup in silent mode for system files.
  - Runs System File Checker to repair any corruption.

.NOTES
  Author: UXHEN
  Date:   2025-07-25
  Usage:  Right-click, “Run with PowerShell (Admin)”
#>

# =============================================================================== #
# region — Privilege Check:                                                       #
# =============================================================================== #
If (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
    ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "This script must be run as Administrator. Exiting."
    Exit 1
}

# =============================================================================== #
# region — Parameters:                                                            #
# =============================================================================== #
$DaysOld     = 5
$LogPath     = "C:\Windows\Logs"
$ComponentLog= "$LogPath\CBS"
$DismLog     = "$LogPath\DISM"
$PantherLog  = "C:\Windows\Panther"

# =============================================================================== #
# region — Helper Function: Remove Files Older Than X Days:                       #
# =============================================================================== #
Function Remove-OldFiles {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)][string]$Path,
        [Parameter(Mandatory)][int]$Days
    )
    Try {
        Get-ChildItem -Path $Path -Recurse -Force -ErrorAction Stop |
          Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-$Days) } |
          Remove-Item -Force -Recurse -ErrorAction Stop
        Write-Host "Cleaned files older than $Days days in $Path"
    }
    Catch {
        Write-Warning "Error cleaning $Path : $_"
    }
}

# =============================================================================== #
# 1. Stop Windows Update Service & Clear Update Cache:                            #
# =============================================================================== #
Write-Host "Stopping Windows Update service..."
Stop-Service wuauserv -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
Start-Service wuauserv
Write-Host "Windows Update cache cleared."

# =============================================================================== #
# 2. Clear Temporary Folders:                                                     #
# =============================================================================== #
$TempDirs = @("$env:TEMP","C:\Windows\Temp")
ForEach ($dir in $TempDirs) {
    Remove-OldFiles -Path $dir -Days $DaysOld
}

# =============================================================================== #
# 3. Clean Prefetch Folder:                                                       #
# =============================================================================== #
Remove-Item -Path "C:\Windows\Prefetch\*" -Force -Recurse -ErrorAction SilentlyContinue
Write-Host "Prefetch folder emptied."

# =============================================================================== #
# 4. Prune Log and Report Files:                                                  #
# =============================================================================== #
Remove-OldFiles -Path $ComponentLog -Days $DaysOld
Remove-OldFiles -Path $DismLog      -Days $DaysOld
Remove-OldFiles -Path $PantherLog   -Days $DaysOld

# =============================================================================== #
# 5. Component Store Cleanup with DISM:                                           #
# =============================================================================== #
Write-Host "Running DISM component cleanup (StartComponentCleanup)..."
& DISM.exe /Online /Cleanup-Image /StartComponentCleanup /NoRestart | Out-Null

Write-Host "Optionally resetting base (ResetBase)..."
& DISM.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase /NoRestart | Out-Null

# =============================================================================== #
# 6. Silent System File Cleanup via Disk Cleanup:                                 #
# =============================================================================== #
Write-Host "Launching Disk Cleanup for system files..."
Start-Process cleanmgr.exe -ArgumentList "/sagerun:99" -NoNewWindow -Wait

# =============================================================================== #
# 7. Run System File Checker:                                                     #
# =============================================================================== #
Write-Host "Running System File Checker (sfc /scannow)..."
sfc /scannow | Out-Null

# =============================================================================== #
# 8. Final Summary:                                                               #
# =============================================================================== #
Write-Host "Cleanup complete! It's recommended to reboot your PC now."
