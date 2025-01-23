# =============================================================================== #
# Alias :                                                                         #
# =============================================================================== #
# Changing "ls" to "eza"
alias ls = eza --long --group --icons=auto --git --sort=name --group-directories-first
alias ll = eza --long --group --icons=auto --git --sort=name --group-directories-first
alias lt = eza --long --group --icons=auto --git --only-dirs --tree --level=3 --sort=modified
# Changing Directory
alias cd.. = cd ..
alias cdd = cd D:/
alias cdc = cd C:/
# Fetch (System Info)
alias fetch = fastfetch
alias neofetch = fastfetch
# NeoVim To Vim
alias v = nvim
alias nv = nvim
alias vn = nvim
alias vm = nvim
alias vim = nvim
alias vd = nohup neovide 2>/dev/null 1>&2 &
alias nd = nohup neovide 2>/dev/null 1>&2 &
# Github Command
alias g = git
alias gi = git init
alias gs = g status -s
alias ga = g add --all
alias gcl = g clone --depth=1
alias gc = g commit -m
alias gd = g diff
alias gl = g log --oneline --graph --all -10
alias gp = g push -uf origin main
alias lg = lazygit
# winget Package Manager
alias pu = powershell -c winget upgrade --all
alias pi = powershell -c winget install
alias pr = powershell -c winget uninstall
alias pq = powershell -c winget search
alias pl = winget list
# BUN Package Manager
alias buna = bun add
alias bunr = bun remove
alias bunu = bun update
alias buni = bun install
alias bun-run = bun run
alias bun-dev = bun --bun run dev
## For Configs Files
alias recompile = powershell  ~/win-void/win-configs/win-configs.ps1
alias dots = cd ~/win-void/
alias ahk = cd ~/win-void/win-dotfiles/cfg/ahk/
alias bashc = nvim ~/win-void/win-dotfiles/home/.bashrc
alias wmc = nvim ~/win-void/win-dotfiles/cfg/komorebi/komorebi.json
alias barc = nvim ~/win-void/win-dotfiles/cfg/yasb/config.yaml
alias nuc = nvim ~/win-void/win-dotfiles/app/roming/nushell/config.nu
# Others Usfeual Alias
alias yt-concats = yt-dlp --concat-playlist always
alias yt-music = yt-dlp --ignore-config --config-locations ~/.config/yt-dlp/music
alias man = tldr
alias cat = bat
alias htop = ntop -s CPU%
alias cls = clear
alias chrome = start chrome
alias firefox = start firefox
alias zen = start zen
