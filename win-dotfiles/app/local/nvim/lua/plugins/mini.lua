-----------------------------------------------------------
-- Mini Plugins:
-----------------------------------------------------------
return {
  -----------------------------------------------------------
  -- Mini-Ai
  -----------------------------------------------------------
  {
    "echasnovski/mini.ai",
    version = "*",
    opts = {},
  },
  -----------------------------------------------------------
  -- Mini-Paris
  -----------------------------------------------------------
  {
    'echasnovski/mini.pairs',
    version = '*',
    opts = {
      modes = { insert = true, command = true, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    }
  },
  -----------------------------------------------------------
  -- Mini-Surround
  -----------------------------------------------------------
  {
    'echasnovski/mini.surround',
    version = '*',
    opts = {
      mappings = {
        add = "sa",
        delete = "sd",
        find = "sf",
        find_left = "sF",
        highlight = "sh",
        replace = "sr",
        update_n_lines = "sn",
      },
    }
  },
  -----------------------------------------------------------
  -- Mini-Tabline
  -----------------------------------------------------------
  {
    'echasnovski/mini.tabline',
    version = '*',
    event = "VeryLazy",
    config = function()
      require('mini.tabline').setup()
      vim.api.nvim_set_hl(0, "MiniTablineFill", { link = "Normal" })
      vim.api.nvim_set_hl(0, "MiniTablineCurrent", { link = "NormalFloat" })
      vim.api.nvim_set_hl(0, "MiniTablineVisible", { link = "Comment" })
      vim.api.nvim_set_hl(0, "MiniTablineHidden", { link = "Comment" })
    end
  },
  -----------------------------------------------------------
  -- Mini-Pick
  -----------------------------------------------------------
  {
    'echasnovski/mini.pick',
    version = '*',
    keys = {
      {
        "<leader>ff",
        function()
          require('mini.pick').builtin.files()
        end,
        desc = "Find File",
      },
      {
        "<leader>fb",
        function()
          require('mini.pick').builtin.buffers()
        end,
        desc = "Find Buffer",
      },
      {
        "<leader>fg",
        function()
          require('mini.pick').builtin.grep_live()
        end,
        desc = "Find Word",
      },
    },
    opts = {
      mappings = {
        choose           = '<Tab>',
        move_down        = '<C-j>',
        move_up          = '<C-k>',
        choose_in_split  = '<C-v>',
        choose_in_vsplit = '<C-b>',
        toggle_preview   = '<C-p>',
      },
    }
  }
}
