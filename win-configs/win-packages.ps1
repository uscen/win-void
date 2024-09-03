# ================================================#
# Windows Packages:				                  #
# ================================================#
# List Of Packages:	                              #
# ================================================#
$packages = @(
    "MSYS2.MSYS2",
    "wez.wezterm",
    "sharkdp.fd",
    "fzf",
    "Git.Git",
    "GitHub.GitHubDesktop",
    "cURL.cURL",
    "aria2",
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
    "VideoLAN.VLC",
    "OliverSchwendener.ueli",
    "eza-community.eza",
    "LGUG2Z.komorebi",
    "LGUG2Z.whkd",
    "DEVCOM.JetBrainsMonoNerdFont"
)
# Install Winget Packages:	                      #
# ================================================#
foreach ($package in $packages) {
    Write-Host "Installing $package..."
    winget install $package --exact --silent --accept-source-agreements --accept-package-agreements
}
Write-Host "Installation of Winget packages is complete!"
# Install Scoop Package Manager:	              #
# ================================================#
Write-Host "Installing Scoop ..."
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
# Install Scoop Packages:	                      #
# ================================================#
scoop bucket add extras
scoop install gcc
Write-Host "Installation of scoop packages is complete!"
