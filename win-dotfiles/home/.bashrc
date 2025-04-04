####################################
####---------- EXPORTS ----------###
####################################
export PROMPT_COMMAND='history -a'
export HISTFILESIZE=5000
export HISTCONTROL=ignoreboth:erasedups
export TERMINAL="wt"
export BROWSER="chromium"
export PAGER="less"
export EDITOR="nvim"
export VISUAL="nvim"
export MYVIMRC="$HOME/.config/nvim/init.lua"
export KOMOREBI_CONFIG_HOME="$HOME/.config/komorebi"
export BUN_INSTALL_CACHE_DIR="$HOME/.cache/bun/install/cache"
export NI_CONFIG_FILE="$HOME/.config/ni/nirc"
export NI_DEFAULT_AGENT="npm"
export NI_GLOBAL_AGENT="npm"
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
#####################################
###--------- SHELL OPTIONS -------###
#####################################
set -o vi
shopt -s cdable_vars
shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s dotglob
shopt -s extglob
shopt -s no_empty_cmd_completion
shopt -s nocaseglob
shopt -s histappend

#####################################
###------- Autocomplete -----------###
#####################################
source <(carapace _carapace)

#####################################
###------------ PROMPT -----------###
#####################################
eval "$(starship init bash)"

#####################################
###------------ ZOXIDE -----------###
#####################################
eval "$(zoxide init bash)"

#####################################
###------------ ALIASES ----------###
#####################################
# Changing "ls" to "eza":           #
#####################################
alias ls="eza --long --group --icons=auto --git --sort=name --group-directories-first"
alias ll="eza --long --group --icons=auto --git --sort=name --group-directories-first"
alias lt="eza --long --group --icons=auto --git --only-dirs --tree --level=3 --sort=modified"
# Cd To Zoxide:                     #
#####################################
alias cd="z"
alias cdf="zi"
# Fetch (System Info):              #
#####################################
alias fetch="fastfetch"
alias neofetch="fastfetch"
## NeoVim To Vim:                   #
#####################################
alias v="nvim"
alias vi="nvim"
alias nv="nvim"
alias vn="nvim"
alias vim="nvim"
alias vid="nohup neovide 2>/dev/null 1>&2 &"
alias nvd="nohup neovide 2>/dev/null 1>&2 &"
# Git Command:                      #
#####################################
alias g="git"
alias gi="git init"
alias gs="g status -s"
alias ga="g add --all"
alias gcl="g clone --depth=1"
alias gc="g commit -m"
alias gd="g diff"
alias gl="g log --oneline --graph --all -10"
alias gp="g push -uf origin main"
alias lg="lazygit"
## Xbps Pkg Manager:                #
#####################################
alias pu="doas xbps-install -Syu xbps && doas xbps-install -Su"
alias pi="doas xbps-install -S"
alias pr="doas xbps-remove -R"
alias pq="xbps-query -Rs"
alias pl="xbps-query -l"
alias pc="doas xbps-remove -Oo"
alias pclean="doas rm -rf /var/cache/xbps/*"
## Power Management:                #
#####################################
alias poweroff="doas poweroff"
alias shutdown="doas shutdown"
alias reboot="doas reboot"
alias zzz="doas zzz"
## For Configs Files:               #
#####################################
alias sucks="cd ~/.local/wayland-void/void-dotfiles/cfg/wayland-suckless/"
alias dots="cd ~/.local/wayland-void/"
alias riverc="nvim ~/.config/river/init"
alias swayc="nvim ~/.config/sway/config"
alias bashc="nvim ~/.bashrc"
alias starc="nvim ~/.config/starship.toml"
# Others Usfeual Alias:             #
#####################################
alias yt-concats='yt-dlp --ignore-config --downloader aria2c --output "~/Videos/programming/%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" --format "bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio" --concat-playlist always -S "codec:h264"'
alias yt-music='yt-dlp --ignore-config --config-locations ~/.config/yt-dlp/music'
alias man="tldr"
alias cat="bat"
alias cls="clear"

#####################################
###-----Source fzf keybindingd----###
#####################################
eval "$(fzf --bash)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_ALT_C_COMMAND="fd --type=d --no-hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS='
  --style=full --height=30% --border --layout reverse --preview-window right,80%
  --color fg:#5d6466,bg:#1e2527
  --color bg+:#8ccf7e,fg+:#2c2f30
  --color hl:#dadada,hl+:#26292a,gutter:#1e2527
  --color pointer:#373d49,info:#606672
  --color border:#1e2527'

#####################################
 ###------- NNN File Manager ------###
 #####################################
export NNN_USE_EDITOR=1
export NNN_TRASH=1
export NNN_OPTS='RUc'
export NNN_COLORS='2134'
export NNN_CONTEXT_COLORS="2135"
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)$"
export NNN_TERMINAL="alacritty"
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_OPENER="$HOME/.config/nnn/plugins/nuke"
export NNN_PLUG="m:nmount;M:mtpmount;e:suedit;n:bulknew;P:rsynccp;z:autojump;o:fzopen;f:fzcd;l:imgview;p:preview-tui;x:xdgdefault;*:togglex"
export NNN_BMS="m:/run/media/$USER;M:/run/user/$UID/gvfs;w:$HOME/pix/wallpapers;v:$HOME/Videos/programming/;n:$HOME/.config/nvim;d:$HOME/.local/wayland-void/"

#####################################
###-------Tab Completions --------###
#####################################
bind 'TAB:menu-complete'
bind '"\e[Z": menu-complete-backward'
bind "set show-all-if-ambiguous off"
bind "set menu-complete-display-prefix on"
bind 'set match-hidden-files off'
bind "set completion-ignore-case on"

#####################################
###---------- System Path  -------###
#####################################
NPM_PACKAGES="${HOME}/.local/share/npm-packages"
export PATH="$HOME/.config/bin:$HOME/.cargo/bin:$HOME/.local/bin:$NPM_PACKAGES/bin:$PATH"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
