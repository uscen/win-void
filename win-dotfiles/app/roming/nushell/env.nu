# =============================================================================== #
# Nushell General Env:                                                            #
# =============================================================================== #
$env.PATH = (
    $env.PATH
    | prepend "~/.config/bin"
    | prepend "~/.npm-global/bin"
    | prepend "~/AppData/Local/Microsoft/WinGet/Packages/rsteube.Carapace_Microsoft.Winget.Source_8wekyb3d8bbwe"
)
$env.LANG = "en_US.utf-8"
$env.EDITOR = "nvim"
$env.PAGER = "less"
$env.Terminal = "alacritty"
$env.KOMOREBI_CONFIG_HOME = "$HOME/.config/komorebi"
$env.BUN_INSTALL_CACHE_DIR = "$HOME/.cache/bun/install/cache"
$env.NI_CONFIG_FILE = "$HOME/.config/ni/nirc"
$env.NI_DEFAULT_AGENT = "npm"
$env.NI_GLOBAL_AGENT = "npm"
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
