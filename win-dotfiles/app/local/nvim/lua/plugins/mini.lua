-----------------------------------------------------------
-- Mini Plugins:
-----------------------------------------------------------
return {
  -----------------------------------------------------------
  -- Mini-Ai
  -----------------------------------------------------------
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    version = "*",
    opts = {},
  },
  -----------------------------------------------------------
  -- Mini-Paris
  -----------------------------------------------------------
  {
    'echasnovski/mini.pairs',
    event = "VeryLazy",
    version = '*',
    opts = {},
  },
  -----------------------------------------------------------
  -- Mini-SplitJoin
  -----------------------------------------------------------
  {
    'echasnovski/mini.splitjoin',
    event = "VeryLazy",
    version = '*',
    opts = {},
  },
  -----------------------------------------------------------
  -- Mini-Diff
  -----------------------------------------------------------
  {
    'echasnovski/mini.diff',
    event = "VeryLazy",
    version = '*',
    opts = {}
  },
  -----------------------------------------------------------
  -- Mini-Surround
  -----------------------------------------------------------
  {
    'echasnovski/mini.surround',
    event = "VeryLazy",
    version = '*',
    opts = {
      mappings = {
        delete = 'ds',
        replace = 'cs',
      },
    },
  },
  -----------------------------------------------------------
  -- Mini-Extra
  -----------------------------------------------------------
  {
    'echasnovski/mini.extra',
    event = "VeryLazy",
    version = '*',
    opts = {}
  },
  -----------------------------------------------------------
  -- Mini-tabline
  -----------------------------------------------------------
  {
    'echasnovski/mini.tabline',
    version = '*',
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
    event = "VeryLazy",
    version = '*',
    config = function()
      vim.keymap.set("n", "<leader>fb", "<CMD>Pick buffers include_current=false<CR>", { desc = "Pick Buffers" })
      vim.keymap.set("n", "<leader>ff", "<CMD>Pick files<CR>", { desc = "Pick Files" })
      vim.keymap.set("n", "<leader>fr", "<CMD>Pick oldfiles<CR>", { desc = "Pick Recent Files" })
      vim.keymap.set("n", "<leader>ft", "<CMD>Pick grep_live<CR>", { desc = "Pick Text From Files" })
      vim.keymap.set("n", "<leader>fe", "<CMD>Pick explorer<CR>", { desc = "Picker Explorer" })
      vim.keymap.set("n", "<leader>fg", "<CMD>Pick git_files<CR>", { desc = "Pick Project Files" })
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
    event = "VeryLazy",
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
  -- Mini-Starter
  -----------------------------------------------------------
  {
    "echasnovski/mini.starter",
    event = "VimEnter",
    version = "*",
    config = function()
      local starter = require("mini.starter")
      local pad = string.rep(" ", 0)
      local new_section = function(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end
      starter.setup({
        evaluate_single = true,
        items = {
          new_section("Projects Folders", "e $HOME/Projects/", "Project"),
          new_section("Dotfiles Folders", "e $HOME/win-void/", "Project"),
          new_section("Neovim Folders", "e $HOME/win-void/win-dotfiles/app/local/nvim/", "Project"),
          new_section("Find Files", "Pick files", "Picker"),
          new_section("Recent Files", "Pick oldfiles", "Picker"),
          new_section("Browser Files", "Oil", "Picker"),
          new_section("Update Plugins", "Lazy update", "Config"),
          new_section("Lazy Plugins", "Lazy", "Config"),
          new_section("Manage Extensions", "Mason", "Config"),
          new_section("Edit New", "ene | startinsert", "Builtin"),
          new_section("Quit Neovim", "qa", "Builtin"),
        },
        content_hooks = {
          function(content)
            local blank_content_line = { { type = 'empty', string = '' } }
            local section_coords = starter.content_coords(content, 'section')
            -- Insert backwards to not affect coordinates
            for i = #section_coords, 1, -1 do
              table.insert(content, section_coords[i].line + 1, blank_content_line)
            end
            return content
          end,
          starter.gen_hook.adding_bullet("» "),
          starter.gen_hook.aligning('center', 'center'),
        },
        header = [[
 ╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮
 │││├┤ │ │╰┐┌╯││││
 ╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴
]],
        footer = '',
      })
    end,
  },
}
