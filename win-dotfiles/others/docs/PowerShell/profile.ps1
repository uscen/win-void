# ======================================================#
# Starship && Zoxide : 					                #
# ======================================================#
#Invoke-Expression (&starship init powershell)
oh-my-posh init pwsh | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })
# ======================================================#
# VI Mode : 						                    #
# ======================================================#
function OnViModeChange {
    if ($args[0] -eq 'Command') {
        # Set the cursor to a block.
        Write-Host -NoNewLine "`e[2 q"
    } else {
        # Set the cursor to a line.
        Write-Host -NoNewLine "`e[6 q"
    }
}

Set-PSReadlineOption -EditMode vi
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange
# ======================================================#
# Alias : 						                        #
# ======================================================#
# Easier Navigation: .., ..., ...., ....., and ~
${function:~} = { Set-Location ~ }
${function:Set-ParentLocation} = { Set-Location .. }; Set-Alias ".." Set-ParentLocation
${function:...} = { Set-Location ..\.. }
${function:....} = { Set-Location ..\..\.. }
${function:.....} = { Set-Location ..\..\..\.. }
${function:......} = { Set-Location ..\..\..\..\.. }
# Navigation Home Shortcuts
${function:drop} = { Set-Location ~\Documents\Dropbox }
${function:dt} = { Set-Location ~\Desktop }
${function:docs} = { Set-Location ~\Documents }
${function:dl} = { Set-Location ~\Downloads }
# Directory Listing: Use `eza.exe` if available
if (Get-Command eza.exe -ErrorAction SilentlyContinue | Test-Path) {
    rm alias:ls -ErrorAction SilentlyContinue
    # Set `ls` to call `ls.exe` and always use --color
    ${function:ls} = { eza.exe --long --group --icons=auto --git --sort=name --group-directories-first @args }
    # List all files in long format
    ${function:l} = { eza.exe --long --group --icons=auto --git --sort=name --group-directories-first @args }
    # List all files in long format, including hidden files
    ${function:la} = { eza -la @args--group --icons=auto --git --sort=name --group-directories-first @args }
    # List only directories
    ${function:lsd} = { Get-ChildItem -Directory -Force @args }
} else {
    # List all files, including hidden files
    ${function:la} = { eza -Force @args }
    # List only directories
    ${function:lsd} = { Get-ChildItem -Directory -Force @args }
}
