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
    event = "VeryLazy",
    opts = {},
  },
  -----------------------------------------------------------
  -- Mini-Paris
  -----------------------------------------------------------
  {
    'echasnovski/mini.pairs',
    version = '*',
    event = "VeryLazy",
    opts = {},
  },
  -----------------------------------------------------------
  -- Mini-Surround
  -----------------------------------------------------------
  {
    'echasnovski/mini.surround',
    version = '*',
    event = "VeryLazy",
    opts = {},
  },
  -----------------------------------------------------------
  -- Mini-SplitJoin
  -----------------------------------------------------------
  {
    'echasnovski/mini.splitjoin',
    version = '*',
    event = "VeryLazy",
    opts = {},
  },
  -----------------------------------------------------------
  -- Mini-Tabline
  -----------------------------------------------------------
  {
    'echasnovski/mini.tabline',
    version = '*',
    event = "VeryLazy",
    config = function()
      vim.api.nvim_set_hl(0, "MiniTablineFill", { link = "Normal" })
      vim.api.nvim_set_hl(0, "MiniTablineCurrent", { link = "NormalFloat" })
      vim.api.nvim_set_hl(0, "MiniTablineVisible", { link = "Comment" })
      vim.api.nvim_set_hl(0, "MiniTablineHidden", { link = "Comment" })
      require('mini.tabline').setup()
    end
  },
  -----------------------------------------------------------
  -- Mini-Extra
  -----------------------------------------------------------
  {
    'echasnovski/mini.extra',
    version = '*',
    event = "VeryLazy",
    config = function()
      require('mini.extra').setup()
    end
  },
  -----------------------------------------------------------
  -- Mini-Pick
  -----------------------------------------------------------
  {
    'echasnovski/mini.pick',
    version = '*',
    event = "VeryLazy",
    config = function()
      vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
      vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
      vim.keymap.set("n", "<leader>fb", "<CMD>Pick buffers include_current=false<CR>", { desc = "Pick Buffers" })
      vim.keymap.set("n", "<leader>ff", "<CMD>Pick files<CR>", { desc = "Pick Files" })
      vim.keymap.set("n", "<leader>fr", "<CMD>Pick oldfiles<CR>", { desc = "Pick Recent Files" })
      vim.keymap.set("n", "<leader>fg", "<CMD>Pick grep_live<CR>", { desc = "Pick Text From Files" })
      vim.keymap.set("n", "<leader>fe", "<CMD>Pick explorer<CR>", { desc = "Picker Explorer" })
      vim.keymap.set("n", "<leader>fc", "<CMD>Pick git_commits<CR>", { desc = "Pick Git Commits" })
      vim.keymap.set("n", "<leader>fo", "<CMD>Pick options<CR>", { desc = "Pick Neovim Options" })
      require('mini.pick').setup({
        mappings = {
          choose           = '<Tab>',
          move_down        = '<C-j>',
          move_up          = '<C-k>',
          choose_in_split  = '<C-v>',
          choose_in_vsplit = '<C-b>',
          toggle_preview   = '<C-p>',
        },
      })
    end
  },
  -----------------------------------------------------------
  -- Mini-Hipatterns
  -----------------------------------------------------------
  {
    'echasnovski/mini.hipatterns',
    version = '*',
    event = "VeryLazy",
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
  -- Mini-Starter
  -----------------------------------------------------------
  {
    "echasnovski/mini.starter",
    version = "*",
    event = "VimEnter",
    config = function()
      local starter = require("mini.starter")
      local pad = string.rep(" ", 22)
      local new_section = function(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end
      starter.setup({
        evaluate_single = true,
        items = {
          new_section("Projects", "e $HOME/Projects/", "Project"),
          new_section("Dotfiles", "e $HOME/win-void/", "Project"),
          new_section("Find Files", "Pick files", "Picker"),
          new_section("Recent Files", "Pick oldfiles", "Picker"),
          new_section("Browser Files", "Oil", "Picker"),
          new_section("Grep Text", "Pick grep_live", "Picker"),
          new_section("Lazy Plugins", "Lazy", "Config"),
          new_section("Mason LSP", "Mason", "Config"),
          new_section("New File", "ene | startinsert", "Built-in"),
          new_section("Quit Neovim", "qa", "Built-in"),
        },
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
	
    ]],
        footer = [[]]
      })
    end,
  },
}
