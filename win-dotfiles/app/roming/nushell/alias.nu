# =============================================================================== #
# Alias :                                                                         #
# =============================================================================== #
# Changing "ls" to "eza"
alias ls = eza --long --group --icons=auto --git --sort=name --group-directories-first
alias ll = eza --long --group --icons=auto --git --sort=name --group-directories-first
alias lt = eza --long --group --icons=auto --git --only-dirs --tree --level=3 --sort=modified
# Fetch (System Info)
alias fetch = fastfetch
alias neofetch = fastfetch
# NeoVim To Vim
alias nv = nvim
alias vn = nvim
alias vid = nohup neovide 2>/dev/null 1>&2 &
alias nvd = nohup neovide 2>/dev/null 1>&2 &
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
# Package Manager
alias pu = winget source update and winget update --all
alias pi = winget install
alias pr = winget uninstall
alias pq = winget search
alias pl = winget list
alias pua = winget update --all and scoop update --all
## For Configs Files
alias recompile = powershell  ~/win-void/win-configs/win-configs.ps1
alias dots = cd ~/win-void/
alias bashc = nvim ~/win-void/win-dotfiles/home/.bashrc
alias wmc = nvim ~/win-void/win-dotfiles/cfg/komorebi/komorebi.json
alias whkdc = nvim ~/win-void/win-dotfiles/cfg/whkdrc
alias barc = nvim ~/win-void/win-dotfiles/cfg/yasb/config.yaml
# Others Usfeual Alias
alias yt-concats = yt-dlp --concat-playlist always
alias yt-music = yt-dlp --ignore-config --config-locations ~/.config/yt-dlp/music
alias man = tldr
alias cat = bat
alias cls = clear
alias chrome = start chrome
alias firefox = start firefox
alias zen = start zen
