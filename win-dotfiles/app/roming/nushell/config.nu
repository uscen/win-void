# =============================================================================== #
# Nushell Config Shell:                                                           #
# =============================================================================== #
# =============================================================================== #
# Source OF File:                                                                 #
# =============================================================================== #
source alias.nu
source colors.nu
# =============================================================================== #
# General config File:                                                            #
# =============================================================================== #
$env.config = {
  color_config: $base16_theme
  show_banner: false
  float_precision: 2
  use_ansi_coloring: true
  edit_mode: vi
  cursor_shape: {
    vi_insert: block
    vi_normal: block
    emacs: line
  }
  ls: {
      use_ls_colors: true
      clickable_links: false
  }
  rm: {
      always_trash: true
  }
  table: {
    mode: heavy
    index_mode: always
    show_empty: true
    padding: { left: 1 right: 1 }
    trim: {
        methodology: wrapping
        wrapping_try_keep_words: true
        truncating_suffix: "..."
    }
    header_on_separator: false
  }
  explore: {
      status_bar_background: {fg: "#1D1F21", bg: "#C4C9C6"},
      command_bar_text: {fg: "#C4C9C6"},
      highlight: {fg: "black", bg: "yellow"},
      status: {
          error: {fg: "white", bg: "red"},
          warn: {}
          info: {}
      },
      table: {
          split_line: {fg: "#404040"},
          selected_cell: {bg: light_blue},
          selected_row: {},
          selected_column: {},
      },
  }
  history: {
      max_size: 100_000
      sync_on_enter: true
      file_format: "sqlite"
      isolation: false
  }
  completions: {
      case_sensitive: false
      quick: true
      partial: true
      algorithm: "prefix"
      external: {
          enable: true
          max_results: 100
          completer: null
      },
      use_ls_colors: true
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
      selected_text: { fg: "#141617" bg: "#7daea3" attr: b}
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
      name: open_command_editor
      modifier: none
      keycode: char_v
      mode: [vi_normal]
      event: { send: openeditor }
  }
  {
    name: fuzzy_change_directory
    modifier: alt
    keycode: char_c
    mode: [emacs, vi_normal, vi_insert]
    event: { send: executehostcommand, cmd: 'cd (fd -t d -E .git -E node_modules
        | fzf --preview-window=right,30%
              --style=full --height=30% --border --layout reverse --preview-window right,40%
              --color fg:#8C977D,bg:#141b1e
              --color bg+:#232a2d,fg+:#8C977D
              --color hl:#8ccf7e,hl+:#8ccf7e,gutter:#1e2527
              --color pointer:#373d49,info:#606672
              --color border:#1e2527
              --preview "eza --icons --tree {}")' }
  }
  {
    name: fuzzy_history
    modifier: control
    keycode: char_r
    mode: [emacs, vi_normal, vi_insert]
    event: [
     {
       send: ExecuteHostCommand
       cmd: "commandline edit --insert (
         history
           | get command
           | reverse
           | uniq
           | str join (char -i 0)
           | fzf
             --scheme history
             --read0
             --query (commandline)
             --style=full --height=30% --border --layout reverse --preview-window right,40%
             --color fg:#8C977D,bg:#141b1e
             --color bg+:#232a2d,fg+:#8C977D
             --color hl:#8ccf7e,hl+:#8ccf7e,gutter:#1e2527
             --color pointer:#373d49,info:#606672
             --color border:#1e2527
           | decode utf-8
           | str trim
       )"
     }
    ]
  }
 ]
}

# =============================================================================== #
# Prompt:                                                                         #
# =============================================================================== #
#$env.PROMPT_INDICATOR = "> "
#$env.PROMPT_INDICATOR_VI_INSERT = "> "
#$env.PROMPT_INDICATOR_VI_NORMAL = "> "
#$env.PROMPT_MULTILINE_INDICATOR = "> "
#$env.PROMPT_COMMAND_RIGHT = ""
# =============================================================================== #
# Starship Prompt:                                                                #
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
# Completer:                                                                      #
# =============================================================================== #
let carapace_completer = {|spans|
    carapace $spans.0 nushell ...$spans | from json
}
let zoxide_completer = {|spans|
    $spans | skip 1 | zoxide query -l ...$in | lines | where {|x| $x != $env.PWD}
}
# =============================================================================== #
# END OF FILE:                                                                    #
# =============================================================================== #
source ~/.cache/carapace/init.nu
source ~/.cache/zoxide.nu
