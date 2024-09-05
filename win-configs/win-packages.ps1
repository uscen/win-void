# ================================================#
# Windows Packages:				                  #
# ================================================#
# List Of Packages:	                              #
# ================================================#
# Set Execution Policy to Bypass for this session
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
$packages = @(
    "MSYS2.MSYS2",
    "Microsoft.PowerShell",
    "gerardog.gsudo",
    "Flow-Launcher.Flow-Launcher",
    "Alacritty.Alacritty",
    "gokcehan.lf",
    "sharkdp.fd",
    "fzf",
    "Git.Git",
    "GitHub.GitHubDesktop",
    "cURL.cURL",
    "openssh",
    "Microsoft.PowerToys",
    "ajeetdsouza.zoxide",
    "BurntSushi.ripgrep.MSVC",
    "Neovim.Neovim",
    "Neovide.Neovide",
    "yt-dlp.yt-dlp",
    "7zip.7zip",
    "jqlang.jq",
    "Fastfetch-cli.Fastfetch",
    "sharkdp.bat",
    "charmbracelet.glow",
    "dbrgn.tealdeer",
    "Starship.Starship",
    "JesseDuffield.lazygit",
    "dandavison.delta",
    "Microsoft.VisualStudioCode",
    "Mozilla.Firefox",
    "Google.Chrome",
    "mpv.net",
    "eza-community.eza",
    "LGUG2Z.komorebi",
    "LGUG2Z.whkd",
    "DEVCOM.JetBrainsMonoNerdFont",
    "OBSProject.OBSStudio",
    "Discord.Discord",
    "GIMP.GIMP",
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
# Install Winget Packages:	                      #
# ================================================#
foreach ($package in $packages) {
    Write-Host "Installing $package..."
    winget install $package --exact --silent --accept-source-agreements --accept-package-agreements
}
Write-Host "Installation of Winget packages is complete!"
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
