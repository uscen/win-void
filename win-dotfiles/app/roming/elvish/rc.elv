# =============================================================================== #
# Elvish Config Shell:                                                            #
# =============================================================================== #
# =============================================================================== #
# Elvish Modules:                                                                 #
# =============================================================================== #
# Builtin:                                                                        #
# =============================================================================== #
use re
use platform
use readline-binding
# Local:                                                                          #
# =============================================================================== #
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
# =============================================================================== #
# Elvish General :                                                                #
# =============================================================================== #
# Sets:                                                                           #
# =============================================================================== #
set edit:completion:matcher[argument] = {|seed| edit:match-prefix $seed &ignore-case=$true }
set notify-bg-job-success = $false
# keys:                                                                           #
# =============================================================================== #
set edit:history:binding[Ctrl-k] = { edit:history:up }
set edit:history:binding[Ctrl-j] = { edit:history:down-or-quit }
set edit:completion:binding[Ctrl-k] = { edit:completion:up-cycle }
set edit:completion:binding[Ctrl-j] = { edit:completion:down-cycle }
set edit:completion:binding[Ctrl-y] = { edit:completion:accept }
set edit:completion:binding[Enter] = { edit:completion:accept; edit:return-line }
# Paths:                                                                          #
# =============================================================================== #
if (eq $platform:os windows) {
  set paths = [
    'C:\Program Files\Git\bin'
    C:\Windows\System32
    C:\Windows\System32\WindowsPowerShell\v1.0
    C:$E:HOMEPATH\scoop\shims
    C:$E:HOMEPATH\bin
  ]
} else {
  set paths = [
    /bin
    /usr/bin
    $E:HOME/bin
    $E:HOME/.config/bin
  ]
}
# Extrnal:                                                                        #
# =============================================================================== #
eval (zoxide init elvish | slurp)
# Prompt:                                                                         #
# =============================================================================== #
set edit:prompt = {
     styled (re:replace '\..*$' '' (hostname))' 󱓇  ' bright-green
}
set edit:rprompt = { nop }
# =============================================================================== #
# Elvish Aliases:                                                                 #
# =============================================================================== #
# Changing Directory:                                                             #
# =============================================================================== #
# fn cd { z }
fn cdd { cd D:/ }
fn cdc { cd C:/ }
# Changing "ls" to "eza":                                                         #
# =============================================================================== #
fn ls { eza --long --group --icons=auto --git --sort=name --group-directories-first }
fn ll { eza --long --group --icons=auto --git --sort=name --group-directories-first }
fn lt { eza --long --group --icons=auto --git --only-dirs --tree --level=3 --sort=modified }
# Bat Like Cat:                                                                   #
# =============================================================================== #
fn b { bat }
fn bn { bat --number }
fn bnl { bat --number --line-range }
fn bp { bat --plain }
fn bpl { bat --plain --line-range }
fn bl { bat --line-range }
# Fetch (System Info):                                                            #
# =============================================================================== #
fn fetch { fastfetch }
fn neofetch { fastfetch }
# NeoVim To Vim:                                                                  #
# =============================================================================== #
fn v { nvim }
fn vi { nvim }
fn nv { nvim }
fn vn { nvim }
fn vm { nvim }
fn vim { nvim }
fn vd { nohup neovide 2>/dev/null 1>&2 & }
fn nd { nohup neovide 2>/dev/null 1>&2 & }
# Image Viewr:                                                                    #
# =============================================================================== #
fn sx { oculante }
fn imv { oculante }
# Scoop Package Manager:                                                          #
# =============================================================================== #
fn pu { scoop update --all }
fn pi { scoop install }
fn pr { scoop uninstall }
fn pq { scoop search }
fn pl { scoop list }
fn pus { scoop status }
fn pclean { scoop cleanup --cache --all }
# BuN Package Manager:                                                            #
# =============================================================================== #
fn buna { bun add }
fn bunr { bun remove }
fn bunu { bun update }
fn buni { bun install }
fn bun-run { bun run }
fn bun-dev { bun --bun run dev }
# Node PKG Manager:                                                               #
# =============================================================================== #
fn npm { pnpm }
fn npx { pnpm dlx }
# For Configs Files:                                                              #
# =============================================================================== #
fn recompile { powershell C:$E:HOMEPATH/win-void/win-configs/win-configs.ps1 }
fn dots { cd C:$E:HOMEPATH/win-void/ }
fn ahk { cd C:$E:HOMEPATH/win-void/win-dotfiles/cfg/ahk/ }
fn bashc { nvim C:$E:HOMEPATH/win-void/win-dotfiles/home/.bashrc }
fn wmc { nvim C:$E:HOMEPATH/win-void/win-dotfiles/home/.glzr/glazewm/config.yaml }
fn barc { nvim C:$E:HOMEPATH/win-void/win-dotfiles/cfg/yasb/config.yaml }
fn nuc { nvim C:$E:HOMEPATH/win-void/win-dotfiles/app/roming/nushell/config.nu }
# Others Usfeual Alias:                                                           #
# =============================================================================== #
fn yt-concats { yt-dlp --no-warnings --quiet --progress --ignore-config --downloader aria2c --output "~/Videos/PROGRAMMING/%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" --format bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio --concat-playlist always -S codec:h264 }
fn yt-music { yt-dlp --ignore-config --config-locations "~/AppData/Roaming/yt-dlp/music" }
fn htop { ntop -u lli -s CPU% }
fn man { tldr }
fn cat { bat }
fn cls { edit:clear }
fn clear { print "\e[H\e[2J\e[3J" }
fn reset { print "\033c" }
# =============================================================================== #
# Functions Alias :                                                               #
# =============================================================================== #
# Git:                                                                            #
# =============================================================================== #
fn g {|@args|
  if (== 0 (count $args)) {
    e:git --help
  } else {
    e:git $@args
  }
}

fn gi {|@args|
  e:git init $@args
}

fn gs {|@args|
  e:git status $@args
}

fn ga {|@args|
  e:git add --all $@args
}

fn gg {|@args|
  e:git clone --depth=1 $@args
}

fn gc {|@args|
  e:git commit --verbose $@args
}

fn gd {|@args|
  e:git diff $@args
}

fn gl {|@args|
  e:git log --oneline --graph -all -10  $@args
}

fn gb {|@args|
  e:git branch $@args
}

fn gp {|@args|
  e:git push -uf origin main $@args
}

fn gf {|@args|
  e:git fetch $@args
}

fn gg {|@args|
  e:git pull $@args
}

fn gr {|@args|
  e:git switch $@args
}
# Universal Terminal alias for bun, pnpm, npm, and yarn:                          #
# =============================================================================== #
