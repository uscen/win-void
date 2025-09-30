# =============================================================================== #
# Windows Packages:				                                                        #
# =============================================================================== #
# Change Execution Policy:                                                        #
# =============================================================================== #
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser => Recomanded
# Set-ExecutionPolicy RemoteSigned => RemoteSigned requires that scripts downloaded from the internet have a digital signature# Set-ExecutionPolicy Unrestricted -Scope LocalMachine =>
# Set-ExecutionPolicy Unrestricted -Scope LocalMachine => Unrestricted does not enforce any restrictions
# Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force => Bypass In Current Session Only
# Set-ExecutionPolicy Restricted => Revert to Default
# List Of Packages:	                                                              #
# =============================================================================== #
$uninstall = @(
    "Cortana",
    "Disney+",
    "LinkedIn",
    "Outlook for Windows",
    "AMD Radeon Software",
    "Microsoft.DevHome",
    "Dolby Access",
    "Quick Assist",
    "Windows Notepad",
    "Mail and Calendar",
    "Microsoft News",
    "Microsoft OneDrive",
    "Microsoft Tips",
    "Microsoft To Do",
    "Microsoft Sticky Notes",
    "Windows Clock",
    "MSN Weather",
    "Movies & TV",
    "Office",
    "OneDrive",
    "Spotify Music",
    "Windows Maps",
    "Xbox TCUI",
    "Xbox Game Bar Plugin",
    "Xbox Game Bar",
    "Game Bar",
    "Xbox",
    "Solitaire & Casual Games",
    "Gaming Services",
    "Get Help",
    "Microsoft Clipchamp",
    "Feedback Hub",
    "Phone Link",
    "Microsoft People",
    "Xbox Identity Provider",
    "Xbox Game Speech Window",
    "Power Automate"
)
$scoopPackages = @(
    "aria2",
    "curl",
    "elvish",
    "carapace-bin",
    "uutils-coreutils",
    "trashy",
    "gsudo",
    "alacritty",
    "windows-terminal",
    "yazi",
    "fd",
    "pastel",
    "fzf",
    "zoxide",
    "ripgrep",
    "neovim",
    "neovide",
    "chafa",
    "jq",
    "fastfetch",
    "bat",
    "glow",
    "tealdeer",
    "lazygit",
    "delta",
    "ntop",
    "qutebrowser",
    "eza",
    "freetube",
    "localsend",
    "glazewm",
    "obs-studio",
    "shotcut",
    "gimp",
    "thunderbird",
    "sumatrapdf",
    "JetBrainsMono-NF",
    "imagemagick",
    "ffmpeg",
    "yt-dlp",
    "ouch",
    "mpv",
    "qview",
    "nodejs-lts",
    "autohotkey",
    "lua-language-server",
    "mingw"
)

# UnInstall Packages:	                                                            #
# =============================================================================== #
# Write-Output "Uninstalling unnecessary apps such as OneDrive, Spotify, and Disney+..."
# foreach ($app in $uninstall) {
#     Write-Host "Remove $app..."
#     winget uninstall $app --silent --accept-source-agreements
# }
# Install Scoop Package Manager:	                                                #
# =============================================================================== #
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Scoop ..."
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}
scoop bucket add extras
scoop bucket add nerd-fonts
foreach ($package in $scoopPackages) {
    Write-Host "Installing $package..."
    scoop install $package
}
Write-Host "Installation Of Scoop Packages Is Complete!"
