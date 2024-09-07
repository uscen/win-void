# ================================================#
# Windows Packages:				                  #
# ================================================#
# Change Execution Policy:                        #
# ================================================#
# Set-ExecutionPolicy RemoteSigned => RemoteSigned requires that scripts downloaded from the internet have a digital signature# Set-ExecutionPolicy Unrestricted -Scope LocalMachine =>
# Set-ExecutionPolicy Unrestricted -Scope LocalMachine => Unrestricted does not enforce any restrictions
# Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force => Bypass In Current Session Only
# Set-ExecutionPolicy Restricted => Revert to Default
# SUCKLESS:	                                      #
# ================================================#
Write-Output("Uninstalling more crap we probably don't want, like apps for OneDrive, Spotify, and Disney+...")
winget uninstall "Cortana" --silent --accept-source-agreements
winget uninstall "Disney+" --silent --accept-source-agreements
winget uninstall "Mail and Calendar" --silent --accept-source-agreements
winget uninstall "Microsoft News" --silent --accept-source-agreements
winget uninstall "Microsoft OneDrive" --silent --accept-source-agreements
winget uninstall "Microsoft Tips" --silent --accept-source-agreements
winget uninstall "MSN Weather" --silent --accept-source-agreements
winget uninstall "Movies & TV" --silent --accept-source-agreements
winget uninstall "Office" --silent --accept-source-agreements
winget uninstall "OneDrive" --silent --accept-source-agreements
winget uninstall "Spotify Music" --silent --accept-source-agreements
winget uninstall "Windows Maps" --silent --accept-source-agreements
winget uninstall "Xbox TCUI" --silent --accept-source-agreements
winget uninstall "Xbox Game Bar Plugin" --silent --accept-source-agreements
winget uninstall "Xbox Game Bar" --silent --accept-source-agreements
winget uninstall "Xbox Identity Provider" --silent --accept-source-agreements
winget uninstall "Xbox Game Speech Window" --silent --accept-source-agreements
# List Of Packages:	                              #
# ================================================#
$packages = @(
    "MSYS2.MSYS2",
    "Microsoft.WindowsTerminal",
    "Microsoft.PowerShell",
    "gerardog.gsudo",
    "Alacritty.Alacritty",
    "sxyazi.yazi",
    "sharkdp.fd",
    "sharkdp.pastel",
    "fzf",
    "Git.Git",
    "Gyan.FFmpeg",
    "cURL.cURL",
    "openssh",
    "ajeetdsouza.zoxide",
    "BurntSushi.ripgrep.MSVC",
    "Neovim.Neovim",
    "Neovide.Neovide",
    "ImageMagick.Q16-HDRI",
    "hpjansson.Chafa",
    "yt-dlp.yt-dlp",
    "7zip.7zip",
    "jqlang.jq",
    "Fastfetch-cli.Fastfetch",
    "sharkdp.bat",
    "charmbracelet.glow",
    "dbrgn.tealdeer",
    "Starship.Starship",
    "JanDeDobbeleer.OhMyPosh",
    "JesseDuffield.lazygit",
    "dandavison.delta",
    "Microsoft.VisualStudioCode",
    "Mozilla.Firefox.DeveloperEdition",
    "Google.Chrome",
    "mpv.net",
    "eza-community.eza",
    "LGUG2Z.komorebi",
    "LGUG2Z.whkd",
    "DEVCOM.JetBrainsMonoNerdFont",
    "OBSProject.OBSStudio",
    "Microsoft.PowerToys",
    "GIMP.GIMP",
    "TheDocumentFoundation.LibreOffice",
    "OpenJS.NodeJS",
    "Python.Python.3.12"
)
$scoopPackages = @(
    "aria2",
    "gcc"
)
# Install Scoop Package Manager:	              #
# ================================================#
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Scoop ..."
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
    scoop bucket add extras
}
# Install Scoop Packages:	                      #
# ================================================#
foreach ($package in $scoopPackages) {
    Write-Host "Installing $package..."
    try {
        scoop install $package
        Write-Host "$package installed successfully."
    } catch {
        Write-Host "Failed to install $package."
    }
}
Write-Host "Installation Of Scoop Packages Is Complete!"
# Install Winget Packages:	                      #
# ================================================#
winget source update
foreach ($package in $packages) {
    Write-Host "Installing $package..."
    winget install $package --exact --silent --accept-source-agreements --accept-package-agreements
}
Write-Host "Installation of Winget packages is complete!"
