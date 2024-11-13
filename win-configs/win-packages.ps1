# ================================================#
# Windows Packages:				                  #
# ================================================#
# Change Execution Policy:                        #
# ================================================#
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser => Recomanded
# Set-ExecutionPolicy RemoteSigned => RemoteSigned requires that scripts downloaded from the internet have a digital signature# Set-ExecutionPolicy Unrestricted -Scope LocalMachine =>
# Set-ExecutionPolicy Unrestricted -Scope LocalMachine => Unrestricted does not enforce any restrictions
# Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force => Bypass In Current Session Only
# Set-ExecutionPolicy Restricted => Revert to Default
# List Of Packages:	                              #
# ================================================#
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
$packages = @(
    "MSYS2.MSYS2",
    "Microsoft.WindowsTerminal",
    "Microsoft.WindowsTerminal.Preview",
    "Microsoft.PowerShell",
    "gerardog.gsudo",
    "Alacritty.Alacritty",
    "sxyazi.yazi",
    "sharkdp.fd",
    "sharkdp.pastel",
    "fzf",
    "Git.Git",
    "cURL.cURL",
    "ajeetdsouza.zoxide",
    "BurntSushi.ripgrep.MSVC",
    "Neovim.Neovim",
    "Neovide.Neovide",
    "ImageMagick.Q16-HDRI",
    "hpjansson.Chafa",
    #"yt-dlp.yt-dlp",
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
    "Mozilla.Firefox",
    "Google.Chrome",
    "Brave.Brave",
    "mpv.net",
    "eza-community.eza",
    "LGUG2Z.komorebi",
    "LGUG2Z.whkd",
    "AmN.yasb",
    "DEVCOM.JetBrainsMonoNerdFont",
    "OBSProject.OBSStudio",
    "Meltytech.Shotcut",
    "GIMP.GIMP",
    "codehex.Neo-cowsay",
    "Microsoft.PowerToys",
    "PDFgear.PDFgear",
    "OpenJS.NodeJS",
    "Python.Python.3.12"
)
$scoopPackages = @(
    "aria2",
    "gcc",
    "yt-dlp",
    "btop",
    "figlet",
    "ffmpeg",
    "https://raw.githubusercontent.com/aandrew-me/tgpt/main/tgpt.json"
)

# UnInstall Packages:	                          #
# ================================================#
# Write-Output "Uninstalling unnecessary apps such as OneDrive, Spotify, and Disney+..."
# foreach ($app in $uninstall) {
#     Write-Host "Remove $app..."
#     winget uninstall $app --silent --accept-source-agreements
# }
# Install Winget Packages:	                      #
# ================================================#
foreach ($package in $packages) {
    Write-Host "Installing $package..."
    winget install $package --exact --silent --accept-source-agreements --accept-package-agreements
}
Write-Host "Installation of Winget packages is complete!"
# Install Scoop Package Manager:	              #
# ================================================#
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Scoop ..."
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}
foreach ($package in $scoopPackages) {
    Write-Host "Installing $package..."
    scoop install $package
}
Write-Host "Installation Of Scoop Packages Is Complete!"
