-----------------------------------------------------------
-- Neo-Tree
-----------------------------------------------------------
return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<Cmd>Neotree toggle<cr>", desc = "Explorer NeoTree (Left)" },
  },
  opts = {
    close_if_last_window = true,
    popup_border_style = "single",
    enable_git_status = true,
    enable_modified_markers = true,
    enable_diagnostics = true,
    sort_case_insensitive = true,
    default_component_configs = {
      indent = {
        with_markers = true,
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      modified = {
        symbol = " ",
        highlight = "NeoTreeModified",
      },
      git_status = {
        symbols = {
          added = "",
          deleted = "",
          modified = "",
          renamed = "",
          untracked = "",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = "",
        },
      },
      icon = {
        provider = function(icon, node) -- setup a custom icon provider
          local text, hl
          local mini_icons = require("mini.icons")
          if node.type == "file" then          -- if it's a file, set the text/hl
            text, hl = mini_icons.get("file", node.name)
          elseif node.type == "directory" then -- get directory icons
            text, hl = mini_icons.get("directory", node.name)
            -- only set the icon text if it is not expanded
            if node:is_expanded() then
              text = nil
            end
          end

          -- set the icon text/highlight only if it exists
          if text then
            icon.text = text
          end
          if hl then
            icon.highlight = hl
          end
        end,
      },
      kind_icon = {
        provider = function(icon, node)
          local mini_icons = require("mini.icons")
          icon.text, icon.highlight = mini_icons.get("lsp", node.extra.kind.name)
        end,
      },
    },
    filesystem = {
      use_libuv_file_watcher = false,
      hijack_netrw_behavior = "disabled",
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      filtered_items = {
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          "node_modules",
        },
        never_show = {
          ".DS_Store",
          "thumbs.db",
        },
      },
    },
    window = {
      position = "left",
      width = 35,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = {
        ["<TAB>"] = "set_root",
        ["<C-h>"] = "navigate_up",
        ["<C-b>"] = "open_split",
        ["<C-v>"] = "open_vsplit",
        ["s"] = false,
        ["S"] = false,
        ["."] = "toggle_hidden",
      },
    },
    source_selector = {
      winbar = true,
      sources = {
        { source = "filesystem", display_name = "   Files " },
        { source = "buffers", display_name = "   Bufs " },
        { source = "git_status", display_name = "   Git " },
      },
    },
    event_handlers = {
      {
        event = "neo_tree_window_after_open",
        handler = function(args)
          if args.position == "left" or args.position == "right" then
            vim.cmd("wincmd =")
          end
        end,
      },
      {
        event = "neo_tree_window_after_close",
        handler = function(args)
          if args.position == "left" or args.position == "right" then
            vim.cmd("wincmd =")
          end
        end,
      },
    },
  },
}
