# =============================================================================== #
# Name Alias :                                                                    #
# =============================================================================== #
# Changing "ls" to "eza":                                                         #
# =============================================================================== #
alias ls = eza --long --group --icons=auto --git --sort=name --group-directories-first
alias ll = eza --long --group --icons=auto --git --sort=name --group-directories-first
alias lt = eza --long --group --icons=auto --git --only-dirs --tree --level=3 --sort=modified
# Bat Like Cat:                                                                   #
# =============================================================================== #
alias b = bat
alias bn = bat --number
alias bnl = bat --number --line-range
alias bp = bat --plain
alias bpl = bat --plain --line-range
alias bl = bat --line-range
# Changing Directory:                                                             #
# =============================================================================== #
alias cd = z
alias cdd = cd D:/
alias cdc = cd C:/
# Fetch (System Info):                                                            #
# =============================================================================== #
alias fetch = fastfetch
alias neofetch = fastfetch
# NeoVim To Vim:                                                                  #
# =============================================================================== #
alias v = nvim
alias vi = nvim
alias nv = nvim
alias vn = nvim
alias vm = nvim
alias vim = nvim
alias vd = nohup neovide 2>/dev/null 1>&2 &
alias nd = nohup neovide 2>/dev/null 1>&2 &
# Image Viewr:                                                                    #
# =============================================================================== #
alias sx = oculante
alias imv = oculante
# Github Command:                                                                 #
# =============================================================================== #
alias g = git
alias gi = git init
alias gs = g status -s
alias ga = g add --all
alias gcl = g clone --depth=1
alias gc = g commit -m
alias gd = g diff
alias gl = g log --oneline --graph --all -10
alias gp = g push -uf origin main
alias gr = git remote
alias grh = git reset
alias grhh = git reset --hard
alias grss = git restore --source
alias grst = git restore --staged
alias grm = git rm
alias lg = lazygit
# Scoop Package Manager:                                                          #
# =============================================================================== #
alias pu = scoop update --all
alias pi = scoop install
alias pr = scoop uninstall
alias pq = scoop search
alias pl = scoop list
alias pus = scoop status
alias pclean = scoop cleanup --cache --all
# BuN Package Manager:                                                            #
# =============================================================================== #
alias buna = bun add
alias bunr = bun remove
alias bunu = bun update
alias buni = bun install
alias bun-run = bun run
alias bun-dev = bun --bun run dev
# Node PKG Manager:                                                               #
# =============================================================================== #
alias npm = pnpm
alias npx = pnpm dlx
# For Configs Files:                                                              #
# =============================================================================== #
alias recompile = powershell  ~/win-void/win-configs/win-configs.ps1
alias dots = cd ~/win-void/
alias ahk = cd ~/win-void/win-dotfiles/cfg/ahk/
alias bashc = nvim ~/win-void/win-dotfiles/home/.bashrc
alias wmc = nvim ~/win-void/win-dotfiles/home/.glzr/glazewm/config.yaml
alias barc = nvim ~/win-void/win-dotfiles/cfg/yasb/config.yaml
alias nuc = nvim ~/win-void/win-dotfiles/app/roming/nushell/config.nu
# Others Usfeual Alias:                                                           #
# =============================================================================== #
alias yt-concats = yt-dlp --no-warnings --quiet --progress --ignore-config --downloader aria2c --output "~/Videos/PROGRAMMING/%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" --format "bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio" --concat-playlist always -S "codec:h264"
alias yt-music = yt-dlp --ignore-config --config-locations "~/AppData/Roaming/yt-dlp/music"
alias htop = ntop -u lli -s CPU%
alias man = tldr
alias cat = bat
alias cls = clear
# =============================================================================== #
# Functions Alias :                                                               #
# =============================================================================== #
# Universal Terminal alias for bun, pnpm, npm, and yarn:                          #
# =============================================================================== #
def p [...args] {
    if ("bun.lockb" | path exists) {
        bun ...$args
    } else if ("pnpm-lock.yaml" | path exists) {
        pnpm ...$args
    } else if ("yarn.lock" | path exists) {
        yarn ...$args
    } else if ("package-lock.json" | path exists) {
        npm ...$args
    } else {
        pnpm ...$args
    }
}
