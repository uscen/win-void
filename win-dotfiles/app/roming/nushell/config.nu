# =============================================================================== #
# Nushell Config Shell:                                                           #
# =============================================================================== #
# =============================================================================== #
# -------------------------------- Source OF File -----------------------------   #
# =============================================================================== #
source alias.nu
source colors.nu

$env.config = {
  color_config: $base16_theme
  edit_mode: vi
  show_banner: false
  table: {
    padding: { left: 0 right: 0 }
    # rounded basic compact compact_double light thin with_love reinforced heavy none other
    mode: none

  }
  filesize: {
    metric: true
  }
  cursor_shape: {
    vi_insert: underscore
    vi_normal: block
    emacs: line
  }
  menus: [
  {
    name: zoxide_menu
    only_buffer_difference: true
    marker: "| "
    type: {
        layout: columnar
        page_size: 20
    }
    style: {
        text: green
        selected_text: green_reverse
        description_text: yellow
    }
    source: { |buffer, position|
        zoxide query -ls $buffer
        | parse -r '(?p<description>[0-9]+) (?p<value>.+)'
    }
  }
   {
    name: completion_menu
    only_buffer_difference: false
    marker: ">> "
    type: {
      layout: columnar
      columns: 4
      col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
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
    name: zoxide_menu
    modifier: control
    keycode: char_o
    mode: [emacs, vi_normal, vi_insert]
    event: [
      { send: menu name: zoxide_menu }
    ]
  }
  {
    name: completion_previous
    modifier: shift
    keycode: backtab
    mode: [vi_normal vi_insert emacs]
    event: { send: menuprevious }
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
source ~/.cache/zoxide.nu
