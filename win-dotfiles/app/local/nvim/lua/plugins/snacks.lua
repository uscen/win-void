-----------------------------------------------------------
-- Snacks:
-----------------------------------------------------------
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    quickfile    = { enabled = true },
    bigfile      = { enabled = true },
    indent       = { enabled = true },
    explorer     = { enabled = true },
    lazygit      = { enabled = true },
    terminal     = { enabled = false },
    toggle       = { enabled = false },
    words        = { enabled = false },
    zen          = { enabled = false },
    profiler     = { enabled = false },
    animate      = { enabled = false },
    bufdelete    = { enabled = false },
    git          = { enabled = false },
    gitbrowse    = { enabled = false },
    image        = { enabled = false },
    notifier     = { enabled = false },
    input        = { enabled = false },
    dashboard    = { enabled = false },
    scope        = { enabled = false },
    scroll       = { enabled = false },
    statuscolumn = { enabled = false },
    picker       = {
      enabled = false,
      sources = {
        explorer = {
          enabled = true,
          hidden = true,
          auto_close = true,
          win = {
            list = {
              keys = {
                ["<Tab>"] = "tcd",
                ["<CR>"] = { { "pick_win", "jump" } },
                ["<C-h>"] = "explorer_up",
                -- ["<leader>"] = "confirm",
                ["x"] = "explorer_close",
                ["z"] = "explorer_close_all",
                ["a"] = "explorer_add",
                ["d"] = "explorer_del",
                ["r"] = "explorer_rename",
                ["c"] = "explorer_copy",
                ["m"] = "explorer_move",
                ["o"] = "explorer_open", -- open with system application
                ["P"] = "toggle_preview",
                ["y"] = { "explorer_yank", mode = { "n", "x" } },
                ["p"] = "explorer_paste",
                ["u"] = "explorer_update",
                ["<leader>/"] = "picker_grep",
                ["<c-t>"] = "terminal",
                ["."] = "explorer_focus",
                ["I"] = "toggle_ignored",
                ["H"] = "toggle_hidden",
                ["]g"] = "explorer_git_next",
                ["[g"] = "explorer_git_prev",
                ["]d"] = "explorer_diagnostic_next",
                ["[d"] = "explorer_diagnostic_prev",
                ["]w"] = "explorer_warn_next",
                ["[w"] = "explorer_warn_prev",
                ["]e"] = "explorer_error_next",
                ["[e"] = "explorer_error_prev",
              },
            },
          },
        },
      },
    },
  },

  keys = {
    { "<leader>e",  function() Snacks.explorer.open() end, desc = "Find Files" },
    { "<leader>tg", function() Snacks.lazygit.open() end,  desc = "Find Files" },
  }
}
