# =============================================================================== #
# Nushell Config Shell:                                                           #
# =============================================================================== #
# =============================================================================== #
# -------------------------------- Source OF File -----------------------------   #
# =============================================================================== #
source alias.nu
source colors.nu
# =============================================================================== #
# ----------------------------- General config File ---------------------------   #
# =============================================================================== #
$env.config = {
  color_config: $base16_theme
  show_banner: false
  edit_mode: vi
  cursor_shape: {
    vi_insert: block
    vi_normal: block
    emacs: line
  }
  table: {
    padding: { left: 0 right: 0 }
    mode: none
  }
  menus: [
   {
    name: completion_menu
    only_buffer_difference: false
    marker: ">> "
    type: {
      layout: columnar
      columns: 4
      col_width: 20
      col_padding: 2
    }
    style: {
      text: { fg: "#ebdbb2" }
      selected_text: { fg: "#141617" bg: "#89b482" attr: b}
      description_text: yellow
    }
  }
  ]
  keybindings: [
  {
      name: clear_current_line
      modifier: control
      keycode: char_u
      mode: [emacs, vi_normal, vi_insert]
      event: { edit: clear }
  }
  {
    name: down_dir
    modifier: alt
    keycode: char_c
    mode: [emacs, vi_normal, vi_insert]
    event: { send: executehostcommand, cmd: 'cd (fd -H -t d -E .git -E node_modules | fzf --height=40% --border --layout reverse)' }
  }
 ]
}

# =============================================================================== #
# --------------------------------Starship Prompt ------------------------------- #
# =============================================================================== #
$env.STARSHIP_SHELL = "nu"
def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}
# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.PROMPT_MULTILINE_INDICATOR = ""
# =============================================================================== #
# --------------------------------END OF FILE------------------------------------ #
# =============================================================================== #
source ~/.cache/carapace/init.nu
source ~/.cache/zoxide.nu
