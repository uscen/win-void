# =============================================================================== #
# Elvish Config Shell:                                                            #
# =============================================================================== #
# =============================================================================== #
# Elvish Modules:                                                                 #
# =============================================================================== #
# Builtin:                                                                        #
# =============================================================================== #
use platform
use readline-binding
# =============================================================================== #
# Evlish Env:                                                                     #
# =============================================================================== #
set E:LANG = "en_US.UTF-8"
set E:LC_ALL = "en_US.UTF-8"
set E:EDITOR = "nvim"
set E:VISUAL = "nvim"
set E:PAGER = "less"
set E:LESS = "-i -R"
set E:TERMINAL = "alacritty"
set E:BROWSER = "qutebrowser"
set E:FZF_DEFAULT_OPTS = "
    --prompt='󱓇  ' --layout=reverse
    --preview-window=right,30%
    --style=minimal --height=100% --border --preview-window right,40%
    --color fg:#a6a69c,bg:#181616
    --color bg+:#201d1d,fg+:#c5c9c5
    --color hl:#8a9a7b,hl+:#8a9a7b,gutter:#181616
    --color pointer:#201d1d,info:#393836
    --color border:#181616
    --color border:#8a9a7b
    --bind 'tab:accept'
"
set E:_ZO_FZF_OPTS = $E:FZF_DEFAULT_OPTS
# =============================================================================== #
# clean ~:									  #
# =============================================================================== #
set E:INPUTRC = "C:/"$E:HOMEPATH"/.bash/inputrc"
set E:HISTFILE = "C:/"$E:HOMEPATH"/.bash/history"
set E:GIT_CONFIG_GLOBAL = "C:/"$E:HOMEPATH"/.others/gitconfig"
set E:WGETRC = "C:/"$E:HOMEPATH"/.others/wgetrc"
set E:CARGO_HOME = "C:/"$E:HOMEPATH"/.local/share/cargo"
set E:GOPATH = "C:/"$E:HOMEPATH"/.local/share/go"
set E:GOMODCACHE = "C:/"$E:HOMEPATH"/.cache/go/mod"
set E:PYTHONSTARTUP = "C:/"$E:HOMEPATH"/.config/python/pythonrc"
set E:SQLITE_HISTORY = "C:/"$E:HOMEPATH"/.local/share/sqlite_history"
# =============================================================================== #
# Elvish General :                                                                #
# =============================================================================== #
# Helpers:                                                                        #
# =============================================================================== #
fn match {|seed|
    var inputs = [(all)]
    var results = []
    for matcher [$edit:match-prefix~ $edit:match-substr~ $edit:match-subseq~] {
        set results = [(put $@inputs | $matcher &smart-case $seed)]
        if (or $@results) {
            put $@results
            return
        }
    }
    put $@results
}
# Sets:                                                                           #
# =============================================================================== #
set edit:max-height = 10
set notify-bg-job-success = $false
set edit:completion:matcher[''] = $match~
# keys:                                                                           #
# =============================================================================== #
set edit:insert:binding[Alt-c] = { edit:location:start }
set edit:insert:binding[Ctrl-n] = { edit:navigation:start }
set edit:insert:binding[Ctrl-X] = { edit:-instant:start }
set edit:completion:binding[Ctrl-y] = { edit:completion:accept }
set edit:completion:binding[Enter] = { edit:completion:accept; edit:return-line }
# Paths:                                                                          #
# =============================================================================== #
if (eq $platform:os windows) {
  set paths = [
    'C:\Program Files\Git\bin'
    C:\Windows\System32
    C:\Windows\System32\OpenSSH
    C:\Windows\System32\WindowsPowerShell\v1.0
    C:$E:HOMEPATH\scoop\apps\nodejs-lts\current\bin
    C:$E:HOMEPATH\scoop\apps\nodejs-lts\current\bin
    C:$E:HOMEPATH\scoop\shims
    C:$E:HOMEPATH\config\bin
    C:$E:HOMEPATH\bin
    $@paths
  ]
} else {
  set paths = [
    /bin
    /usr/bin
    $E:HOME/bin
    $E:HOME/.config/bin
    $@paths
  ]
}
# Extrnal:                                                                        #
# =============================================================================== #
eval (zoxide init elvish | slurp)
# Prompt:                                                                         #
# =============================================================================== #
set edit:prompt = {
     tilde-abbr $pwd
     styled ' 󱓇  ' bright-green
}
set edit:rprompt = { nop }
# =============================================================================== #
# Elvish Aliases:                                                                 #
# =============================================================================== #
# Reset Terminal:                                                                 #
# =============================================================================== #
fn cls { edit:clear }
fn clear { print "\e[H\e[2J\e[3J" }
fn reset { print "\033c" }
# Fetch (System Info):                                                            #
# =============================================================================== #
fn fetch { fastfetch }
fn neofetch { fastfetch }
# Changing Directory:                                                             #
# =============================================================================== #
fn ... { cd ~ }
fn .. { cd .. }
fn ../ { cd .. }
fn ../../ { cd ../.. }
fn cdd { cd D:/ }
fn cdc { cd C:/ }
# For Configs Files:                                                              #
# =============================================================================== #
fn recompile { powershell C:$E:HOMEPATH/win-void/win-configs/win-configs.ps1 }
fn dots { cd C:$E:HOMEPATH/win-void/ }
fn ahk { cd C:$E:HOMEPATH/win-void/win-dotfiles/cfg/ahk/ }
fn bashc { nvim C:$E:HOMEPATH/win-void/win-dotfiles/home/.bashrc }
fn wmc { nvim C:$E:HOMEPATH/win-void/win-dotfiles/home/.glzr/glazewm/config.yaml }
fn barc { nvim C:$E:HOMEPATH/win-void/win-dotfiles/cfg/yasb/config.yaml }
fn nuc { nvim C:$E:HOMEPATH/win-void/win-dotfiles/app/roming/nushell/config.nu }
# Changing "ls" to "eza":                                                         #
# =============================================================================== #
fn ls {|@a| e:eza --long --group --icons=auto --git --sort=name --group-directories-first $@a }
fn ll {|@a| e:eza --long --group --icons=auto --git --sort=name --group-directories-first $@a }
fn lt {|@a| e:eza --long --group --icons=auto --git --only-dirs --tree --level=3 --sort=modified $@a }
# Bat Like Cat:                                                                   #
# =============================================================================== #
fn b {|@a| e:bat $@a }
fn bn {|@a| e:bat --number $@a }
fn bnl {|@a| e:bat --number --line-range $@a }
fn bp {|@a| e:bat --plain $@a }
fn bpl {|@a| e:bat --plain --line-range $@a }
fn bl {|@a| e:bat --line-range $@a }
# NeoVim To Vim:                                                                  #
# =============================================================================== #
fn v {|@a| e:nvim $@a }
fn vi {|@a| e:nvim $@a }
fn nv {|@a| e:nvim $@a }
fn vn {|@a| e:nvim $@a }
fn vm {|@a| e:nvim $@a }
fn vim {|@a| e:nvim $@a }
fn vd {|@a| e:nohup neovide 2>/dev/null 1>&2 & }
fn nd {|@a| e:nohup neovide 2>/dev/null 1>&2 & }
# Image Viewr:                                                                    #
# =============================================================================== #
fn sx {|@a| e:qview $@a }
fn imv {|@a| e:qview $@a }
# Scoop Package Manager:                                                          #
# =============================================================================== #
fn pu {|@a| e:scoop update --all $@a }
fn pi {|@a| e:scoop install $@a }
fn pr {|@a| e:scoop uninstall $@a }
fn pq {|@a| e:scoop search $@a }
fn pl {|@a| e:scoop list $@a }
fn pus {|@a| e:scoop status $@a }
fn pclean {|@a| e:scoop cleanup --cache --all $@a }
# BuN Package Manager:                                                            #
# =============================================================================== #
fn buna {|@a| e:bun add $@a }
fn bunr {|@a| e:bun remove $@a }
fn bunu {|@a| e:bun update $@a }
fn buni {|@a| e:bun install $@a }
fn bun-run {|@a| e:bun run $@a }
fn bun-dev {|@a| e:bun --bun run dev $@a }
# Node PKG Manager:                                                               #
# =============================================================================== #
fn npm {|@a| pnpm $@a }
fn npx {|@a| pnpm dlx $@a }
# Others Usfeual Alias:                                                           #
# =============================================================================== #
fn yt-concats {|@a| e:yt-dlp --ignore-config --config-locations ~/AppData/Roaming/yt-dlp/playlist $@a }
fn yt-music {|@a| e:yt-dlp --ignore-config --config-locations ~/AppData/Roaming/yt-dlp/music $@a }
fn htop {|@a| e:ntop -u lli -s CPU% $@a }
fn man {|@a| e:tldr $@a }
fn cat {|@a| e:bat $@a }
# Git:                                                                            #
# =============================================================================== #
fn g {|@a| e:git $@a }
fn gi {|@a| e:git init $@a }
fn gs {|@a| e:git status $@a }
fn ga {|@a| e:git add --all $@a }
fn gg {|@a| e:git clone --depth=1 $@a }
fn gc {|@a| e:git commit --verbose $@a }
fn gd {|@a| e:git diff $@a }
fn gl {|@a| e:git log --oneline --graph -all -10  $@a }
fn gb {|@a| e:git branch $@a }
fn gp {|@a| e:git push -uf origin main $@a }
fn gf {|@a| e:git fetch $@a }
fn gg {|@a| e:git pull $@a }
fn gr {|@a| e:git switch $@a }
fn lg {|@a| e:lazygit $@a }
