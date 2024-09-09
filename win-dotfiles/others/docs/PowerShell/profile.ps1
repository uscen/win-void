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
        Write-Host -NoNewLine "`e[2 q"
    } else {
        Write-Host -NoNewLine "`e[6 q"
    }
}

Set-PSReadlineOption -EditMode vi
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange
# ======================================================#
# Alias : 						                        #
# ======================================================#
# Easier Navigation:
# ======================================================#
${function:drop} = { Set-Location ~\Documents\Dropbox }
${function:dt} = { Set-Location ~\Desktop }
${function:docs} = { Set-Location ~\Documents }
${function:dl} = { Set-Location ~\Downloads }
# Directory Listing: Use `eza.exe` if available:
# ======================================================#
if (Get-Command eza.exe -ErrorAction SilentlyContinue | Test-Path) {
    rm alias:ls -ErrorAction SilentlyContinue
    ${function:ls} = { eza.exe --long --group --icons=auto --git --sort=name --group-directories-first @args }
    ${function:l} = { eza.exe --long --group --icons=auto --git --sort=name --group-directories-first @args }
    ${function:la} = { eza -la @args--group --icons=auto --git --sort=name --group-directories-first @args }
    ${function:lsd} = { Get-ChildItem -Directory -Force @args }
} else {
    ${function:lsd} = { Get-ChildItem -Directory -Force @args }
}
# Git :                                                 #
# ======================================================#
function gs { git status -s }
function ga { git add . }
function gd { git diff --oneline --graph --all -10 }
function gc { param($m) git commit -m "$m" }
function gp { git push -uf origin main}
function gi { git init }
function gcl { git clone "$args" }
# Alias
# ======================================================#
Remove-Alias -Name cd
New-Alias -Name cd -Value z -Option AllScope
Set-Alias -Name su -Value admin
# Yazi File Manager : 					                #
# ======================================================#
function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}
