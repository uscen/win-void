# =============================================================================== #
# Nushell General Env:                                                            #
# =============================================================================== #
$env.PATH = (
    $env.PATH
    | prepend "~/.config/bin"
    | prepend "~/.npm-global/bin"
)
$env.EDITOR = "nvim"
$env.PAGER = "less"
$env.Terminal = "alacritty"
$env.KOMOREBI_CONFIG_HOME = "$HOME/.config/komorebi"
$env.BUN_INSTALL_CACHE_DIR = "$HOME/.cache/bun/install/cache"
$env.NI_CONFIG_FILE = "$HOME/.config/ni/nirc"
$env.NI_DEFAULT_AGENT = "npm"
$env.NI_GLOBAL_AGENT = "npm"
# =============================================================================== #
#  Zoxide :                                                                       #
# =============================================================================== #
zoxide init nushell | save -f ~/.cache/zoxide.nu
