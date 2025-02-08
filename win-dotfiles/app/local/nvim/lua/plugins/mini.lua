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
    opts = {},
  },
  -----------------------------------------------------------
  -- Mini-Surround
  -----------------------------------------------------------
  {
    'echasnovski/mini.surround',
    version = '*',
    opts = {},
  },
  -----------------------------------------------------------
  -- Mini-Tabline
  -----------------------------------------------------------
  {
    'echasnovski/mini.splitjoin',
    version = '*',
    opts = {},
  },
  -----------------------------------------------------------
  -- Mini-Tabline
  -----------------------------------------------------------
  {
    'echasnovski/mini.tabline',
    version = '*',
    config = function()
      vim.api.nvim_set_hl(0, "MiniTablineFill", { link = "Normal" })
      vim.api.nvim_set_hl(0, "MiniTablineCurrent", { link = "NormalFloat" })
      vim.api.nvim_set_hl(0, "MiniTablineVisible", { link = "Comment" })
      vim.api.nvim_set_hl(0, "MiniTablineHidden", { link = "Comment" })
      require('mini.tabline').setup()
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
  },
  -----------------------------------------------------------
  -- Mini-Hipatterns
  -----------------------------------------------------------
  {
    'echasnovski/mini.hipatterns',
    version = '*',
    config = function()
      local hipatterns = require('mini.hipatterns')
      hipatterns.setup({
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
          hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
          todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
          note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end
  },
  -----------------------------------------------------------
  -- Mini-Hipatterns
  -----------------------------------------------------------
  {
    "echasnovski/mini.starter",
    version = "*",
    config = function()
      require("mini.starter").setup({
        autoopen = true,
        header = [[
			           ▄ ▄
			       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄
			       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █
			    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █
			  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
			  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄
			▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █
			█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █
			    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█
			
        ]]
      })
    end,
  },
}
