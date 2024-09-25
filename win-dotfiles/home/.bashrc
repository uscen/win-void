####################################
####---------- EXPORTS ----------###
####################################
export PROMPT_COMMAND='history -a'
export HISTFILESIZE=5000
export HISTCONTROL=ignoreboth:erasedups
export TERMINAL="wt"
export BROWSER="firefox"
export PAGER="less"
export EDITOR="nvim"
export VISUAL="nvim"
export MYVIMRC="$HOME/.config/nvim/init.lua"

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
# Changing "ls" to "eza"
alias ls="eza --long --group --icons=auto --git --sort=name --group-directories-first"
alias ll="eza --long --group --icons=auto --git --sort=name --group-directories-first"
alias lt="eza --long --group --icons=auto --git --only-dirs --tree --level=3 --sort=modified"
# Cd To Zoxide
alias cd="z"
alias cdf="zi"
# Fetch (System Info)
alias fetch="fastfetch"
alias neofetch="fastfetch"
## NeoVim To Vim
alias v="nvim"
alias vi="nvim"
alias nv="nvim"
alias vn="nvim"
alias vim="nvim"
alias vid="nohup neovide 2>/dev/null 1>&2 &"
alias nvd="nohup neovide 2>/dev/null 1>&2 &"
# Github Command
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
# Img Viewr libsixel
alias sx="img2sixel --width=40% --height=30%"
alias sxl="lsix"
alias sxg="vimiv --recursive"
## Xbps Pkg Manager
alias pu="doas xbps-install -Syu xbps && doas xbps-install -Su"
alias pi="doas xbps-install -S"
alias pr="doas xbps-remove -R"
alias pq="xbps-query -Rs"
alias pl="xbps-query -l"
alias pclean="doas rm -rf /var/cache/xbps/*"
## Flatpak PKG Manager
alias flat-update="flatpak update -y"
alias flat-install="flatpak install -y --or-update flathub"
alias flat-remove="flatpak uninstall -y --force-remove --delete-data --noninteractive"
alias flat-orphans-remove="flatpak uninstall -y --unused --noninteractive"
alias flat-all-remove="flatpak uninstall -y --all --delete-data --noninteractive"
## Power Management
alias poweroff="doas poweroff"
alias shutdown="doas shutdown"
alias reboot="doas reboot"
alias zzz="doas zzz"
## For Configs Files
alias recompile="cd ~/win-void/win-configs && powershell ./win-configs.ps1"
alias dots="cd ~/win-void/"
alias bashc="nvim ~/win-void/win-dotfiles/home/.bashrc"
alias wmc="nvim ~/win-void/win-dotfiles/cfg/komorebi/komorebi.json"
alias whkdc="nvim ~/win-void/win-dotfiles/cfg/whkdrc"
# Others Usfeual Alias
alias yt-concats='yt-dlp --concat-playlist always -S "codec:h264"'
alias yt-music='yt-dlp --ignore-config --config-locations ~/.config/yt-dlp/music'
alias man="tldr"
alias cat="bat"
alias cls="clear"
#####################################
###------- NNN File Manager ------###
#####################################
export NNN_USE_EDITOR=1
export NNN_TRASH=1
export NNN_OPTS='RdUc'
export NNN_COLORS='2134'
export NNN_CONTEXT_COLORS="2135"
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)$"
export NNN_TERMINAL="foot"
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_OPENER="$HOME/.config/nnn/plugins/nuke"
export NNN_PLUG="m:nmount;M:mtpmount;e:suedit;n:bulknew;P:rsynccp;z:autojump;o:fzopen;f:fzcd;c:mp3conv;b:boom;l:imgview;k:pskill;p:preview-tui;x:xdgdefault;*:togglex"
export NNN_BMS="m:/run/media/$USER;M:/run/user/$UID/gvfs;w:$HOME/pix/wallpapers;v:$HOME/vids/programming/;n:$HOME/.config/nvim;d:$HOME/.local/wayland-void/"
#####################################
###------- Yazi File Manager -----###
#####################################
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
#####################################
###-----Source fzf keybindingd----###
#####################################
eval "$(fzf --bash)"
export FZF_DEFAULT_OPTS="--height=40% --border --multi --info inline-right --layout reverse --marker ▏ --pointer ▌ --prompt '▌ ' --highlight-line --color gutter:-1,selected-bg:238,selected-fg:146,current-fg:189"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --no-hidden --strip-cwd-prefix --exclude .git"
# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}
alias run_in_nvim="fzf --multi --bind 'enter:become(nvim {+})'"
alias run_in_mpv="fd 'mp4' | fzf --multi --bind 'enter:become(mpvnet {+})'"
alias run_in_nnn="fd -t d | fzf --bind 'enter:become(nnn {+})'"
bind '"\C-v":"run_in_nvim\n"'
bind '"\C-p":"run_in_mpv\n"'
bind '"\C-n":"run_in_nnn\n"'
#####################################
###-------Tab Completions --------###
#####################################
# If there are multiple matches for completion, Tab should cycle through them
bind 'TAB:menu-complete'
# And Shift-Tab should cycle backwards
bind '"\e[Z": menu-complete-backward'
# Display a list of the matching files
bind "set show-all-if-ambiguous off"
# Perform partial (common) completion on the first Tab press, only start
# cycling full results on the second Tab press (from bash version 5)
bind "set menu-complete-display-prefix on"
# Ignore Hidden Files
bind 'set match-hidden-files off'
#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"
#####################################
###---------- System Path  -------###
#####################################
# for path in $(ls $HOME/AppData/Local/Programs); do
# 	export PATH="$PATH:$HOME/AppData/Local/Programs/$path"
# done
export PATH="$PATH:$HOME/AppData/Local/Programs/mpv.net"
