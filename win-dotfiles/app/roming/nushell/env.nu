# =============================================================================== #
# Nushell General Env:                                                            #
# =============================================================================== #
$env.PATH = ($env.PATH | split row (char esep) | append "")
$env.SHELL = $nu.current-exe
$env.LANG = "en_US.utf-8"
$env.EDITOR = "nvim"
$env.VISUAL = $env.EDITOR
$env.PAGER = "less"
$env.TERMINAL = "alacritty"
export-env { load-env {
    XDG_CACHE_HOME: ($env.USERPROFILE | path join ".cache")
    XDG_DOCUMENTS_DIR: ($env.USERPROFILE | path join "Documents")
    XDG_DOWNLOAD_DIR: ($env.USERPROFILE | path join "Downloads")
    XDG_MUSIC_DIR: ($env.USERPROFILE | path join "Music")
    XDG_PICTURES_DIR: ($env.USERPROFILE | path join "Pictures")
    XDG_VIDEOS_DIR: ($env.USERPROFILE | path join "Videos")
}}
export-env { load-env {
    BUN_INSTALL_CACHE_DIR: ($env.XDG_CACHE_HOME | path join "bun" "install" "cache")
}}
# =============================================================================== #
#  FZF:                                                                           #
# =============================================================================== #
$env.FZF_DEFAULT_OPTS = "
--input-border --style=full
--height=40% --border --layout reverse
--preview-window right,80%
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
