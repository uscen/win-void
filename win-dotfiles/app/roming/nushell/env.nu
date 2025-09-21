# =============================================================================== #
# Nushell General Env:                                                            #
# =============================================================================== #
$env.PATH = ($env.PATH | split row (char esep) | append "C:/Program Files/Git/bin/")
$env.SHELL = $nu.current-exe
$env.LANG = "en_US.utf-8"
$env.EDITOR = "nvim"
$env.VISUAL = $env.EDITOR
$env.PAGER = "less"
$env.TERMINAL = "alacritty"
$env.BROWSER = "qutebrowser"
export-env { load-env {
    XDG_CONFIG_DIR: ($env.USERPROFILE | path join ".config")
    XDG_CACHE_HOME: ($env.USERPROFILE | path join ".cache")
    XDG_DOCUMENTS_DIR: ($env.USERPROFILE | path join "Documents")
    XDG_DOWNLOAD_DIR: ($env.USERPROFILE | path join "Downloads")
    XDG_MUSIC_DIR: ($env.USERPROFILE | path join "Music")
    XDG_PICTURES_DIR: ($env.USERPROFILE | path join "Pictures")
    XDG_VIDEOS_DIR: ($env.USERPROFILE | path join "Videos")
}}
export-env { load-env {
    BAT_CONFIG_DIR : ($env.XDG_CONFIG_DIR | path join "bat")
    BAT_CONFIG_PATH : ($env.XDG_CONFIG_DIR | path join "bat" "config")
    RIPGREP_CONFIG_PATH : ($env.XDG_CONFIG_DIR | path join "ripgrep" "rc")
    BUN_INSTALL_CACHE_DIR: ($env.XDG_CACHE_HOME | path join "bun" "install" "cache")
}}
# =============================================================================== #
#  FZF:                                                                           #
# =============================================================================== #
$env.FZF_DEFAULT_OPTS = "
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
# =============================================================================== #
#  carapace-bin:                                                                  #
# =============================================================================== #
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
# =============================================================================== #
#  Zoxide :                                                                       #
# =============================================================================== #
zoxide init nushell | save -f ~/.cache/zoxide.nu
