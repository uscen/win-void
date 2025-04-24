<h1 align="center"><i>Windows Ricing</i></h1>

### Watch The Rice Video

[![Watch The Rice Video](./assets/thumbnail.jpg)](https://www.youtube.com/watch?v=T-dgnOKJNc4&t=43s)

<!--![alt text](./assets/screen.png)-->

- **Window Manager** : **Komorebi**
- **Hotkey deamon** : **Whkd**
- **Colorscheme** : **Gruvbox**
- **Terminal** : **Alacritty**
- **System Info** : **FastFetch**
- **Files Manager** : **Yazi**
- **Menu**: **PowerToys Run**

# philosophy

I try to follow these ideas as much as i can:

- using free/open source software.
- using terminal-based applications.
- using msys2 for development base and scoop for installing any other packages.
- avoid using software from microsoft like vscode, terminal, etc.. use more free alternative (Alacritty, Neovim) or compile linux versions with msys2.

## Tools 🛠️

While this configuration does prepare a great many tools, it revolves primarily around the following:

- 📝 [Neovide](https://neovide.dev/): Primary interface; smooth scrolling goodness. [config.toml](./.config/neovide/config.toml)
- ✏️ [Neovim](https://neovim.io) [configuration](.config/nvim/)
- 🐠 [nushell](nushell/nushell)
- 💻 [alacritty](https://alacritty.org/): [configuration](.config/alacrity/)
- 🔠 [JetBrains Mono](https://rubjo.github.io/victor-mono/): Best font ever. 🌟

### Miscellaneous Other Tools 🎒

- [asciinema](https://asciinema.org/): Record and share terminal sessions.
- [bat](https://github.com/sharkdp/bat): A cat clone.
- [caddy](https://github.com/caddyserver/caddy): Simple file server.
- [coreutils](https://www.gnu.org/software/coreutils/): GNU core utilities.
- [direnv](https://direnv.net/): Environment manipulation.
- [doll](https://github.com/xiaogdgenuine/Doll): Move dock applications to menu bar.
- [dozer](https://github.com/Mortennn/Dozer): Hide menu bar icons on macOS.
- [dua](https://github.com/Byron/dua-cli): Disk usage analyzer cli with interactive option.
- [dust](https://github.com/bootandy/dust): A more intuitive version of du in rust.
- [editorconfig](https://editorconfig.org/): Enforce some text styles.
- [eza](https://eza.rocks/): A modern, maintained replacement for ls.
- [fd](https://github.com/sharkdp/fd): Fast, user-friendly find.
- [flashspace](https://github.com/wojciech-kulik/FlashSpace): virtual workspace manager
- [fzf](https://github.com/junegunn/fzf): Command-line fuzzy finder.
- [delta](https://github.com/dandavison/delta): Syntax highlighting pager.
- [grip](https://github.com/joeyespo/grip): Preview markdown.
- [keycastr](https://github.com/keycastr/keycastr): Keystroke visualizer.
- [lazydocker](https://github.com/jesseduffield/lazydocker): Container management TUI.
- [lazygit](https://github.com/jesseduffield/lazygit): The best git interface outside emacs.
- [navi](https://github.com/denisidoro/navi): Interactive cheatsheet tool for the command-line.
- [pandoc](https://pandoc.org/): Universal document converter.
- [podman](https://podman.io/): Daemonless container engine.
- [pyenv](https://github.com/pyenv/pyenv): Simple python version management.
- [ripgrep](https://github.com/BurntSushi/ripgrep): Amazing search tool.
- [silicon](https://github.com/Aloxaf/silicon): Create beautiful image of your source code.
- [skim](https://github.com/lotabout/skim): Awesome fuzzy finder.
- [starship](https://starship.rs/): Customizable prompt.
- [tokei](https://github.com/XAMPPRocky/tokei): Great tool for counting code.
- [xh](https://github.com/ducaale/xh): Friendly tool for sending http requests.
- [xplr](https://xplr.dev/): Powerful file manager.
- [yazi](https://yazi-rs.github.io/): Simple file manager.
- [zellij](https://zellij.dev/): A terminal workspace with batteries included; multiplexer.
- [zoxide](https://github.com/ajeetdsouza/zoxide): A smarter cd command. Supports all major shells.

## for future

- i don't want to rely on supply chain. building software directly the pc is the best/safest way.(so i will ditch scoop | winget in future)
- it's better to replace c/c++ software with rust.
- In some cases it's better to use GUI applications.(like web-browsers)

## Install packages

**Change Execution Policy**

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

```powershell
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
$scoopPackages = @(
    "aria2",
    "curl",
    "nu",
    "carapace-bin",
    "gsudo",
    "alacritty",
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
    "starship",
    "lazygit",
    "delta",
    "ntop",
    "vscode",
    "chromium",
    "eza",
    "freetube",
    "komorebi",
    "obs-studio",
    "shotcut",
    "gimp",
    "thunderbird",
    "sumatrapdf",
    "JetBrainsMono-NF",
    "nodejs",
    "gcc",
    "autohotkey",
    "lua-language-server",
    "altsnap",
    "imagemagick",
    "ffmpeg",
    "yt-dlp",
    "ouch",
    "mpv",
    "https://raw.githubusercontent.com/aandrew-me/tgpt/main/tgpt.json"
)

# UnInstall Packages:	                          #
# ================================================#
# Write-Output "Uninstalling unnecessary apps such as OneDrive, Spotify, and Disney+..."
# foreach ($app in $uninstall) {
#     Write-Host "Remove $app..."
#     winget uninstall $app --silent --accept-source-agreements
# }
# Install Scoop Package Manager:	              #
# ================================================#
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
```

---

## Enjoy 🤗
