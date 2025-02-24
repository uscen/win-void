-----------------------------------------------------------
-- Mini Plugins:
-----------------------------------------------------------
return {
  -----------------------------------------------------------
  -- Mini-Icons
  -----------------------------------------------------------
  {
    'echasnovski/mini.icons',
    event = "VimEnter",
    version = '*',
    opts = {},
  },
  -----------------------------------------------------------
  -- Mini-Ai
  -----------------------------------------------------------
  {
    'echasnovski/mini.ai',
    event = "VeryLazy",
    version = "*",
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
  -- Mini-Extra
  -----------------------------------------------------------
  {
    'echasnovski/mini.extra',
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
        add = "S",
        delete = 'ds',
        replace = 'cs',
        find = "",
        find_left = "",
        highlight = "",
        update_n_lines = "",
      },
    },
  },
  -----------------------------------------------------------
  -- Mini-Paris
  -----------------------------------------------------------
  {
    'echasnovski/mini.pairs',
    event = "VeryLazy",
    version = "*",
    opts = {
      mappings = {
        -- Prevents the action if the cursor is just before any character or next to a "\".
        ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\][%s%)%]%}]' },
        ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\][%s%)%]%}]' },
        ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\][%s%)%]%}]' },
        -- This is default (prevents the action if the cursor is just next to a "\").
        [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
        [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
        ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },
        -- Prevents the action if the cursor is just before or next to any character.
        ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^%w][^%w]', register = { cr = false } },
        ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%w][^%w]', register = { cr = false } },
        ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^%w][^%w]', register = { cr = false } },
      },
    },
  },
  -----------------------------------------------------------
  -- Mini-Tabline
  -----------------------------------------------------------
  {
    'echasnovski/mini.tabline',
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    version = '*',
    config = function()
      require('mini.tabline').setup({
        show_icons = true,
        format = function(buf_id, label)
          local suffix = vim.bo[buf_id].modified and '● ' or ''
          return MiniTabline.default_format(buf_id, label) .. suffix
        end,
      })
      vim.api.nvim_set_hl(0, 'MiniTablineCurrent', { bg = '#141617', fg = '#dde5c2', bold = true, italic = true })
      vim.api.nvim_set_hl(0, 'MiniTablineVisible', { bg = '#141617', fg = '#dde5c2', bold = true, italic = true })
      vim.api.nvim_set_hl(0, 'MiniTablineHidden', { bg = '#141617', fg = '#928374', bold = true, italic = true })
      vim.api.nvim_set_hl(0, 'MiniTablineModifiedCurrent', { bg = '#141617', fg = '#dde5c2', bold = true, italic = true })
      vim.api.nvim_set_hl(0, 'MiniTablineModifiedVisible', { bg = '#141617', fg = '#dde5c2', italic = true })
      vim.api.nvim_set_hl(0, 'MiniTablineModifiedHidden', { bg = '#141617', fg = '#928374', italic = true })
      vim.api.nvim_set_hl(0, 'MiniTablineTabpagesSection', { bg = '#141617', fg = '#dde5c2' })
      vim.api.nvim_set_hl(0, 'MiniTablineFill', { bg = '#141617', fg = '#dde5c2' })
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
  -- Mini-Files
  -----------------------------------------------------------
  {
    'echasnovski/mini.files',
    version = '*',
    config = function()
      require('mini.files').setup({
        windows = {
          max_number = 1,
          width_focus = 999,
        },
        mappings = {
          close       = 'q',
          go_in       = 'l',
          go_in_plus  = '<Tab>',
          go_out      = 'h',
          go_out_plus = '<C-h>',
          mark_goto   = "'",
          mark_set    = 'm',
          reset       = 'gh',
          reveal_cwd  = '@',
          show_help   = 'g?',
          synchronize = '<C-s>',
          trim_left   = '<',
          trim_right  = '>',
        },
      })
      vim.keymap.set("n", "<leader>e", "<CMD>lua MiniFiles.open()<CR>", { desc = "Files Manager" })
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
      require('mini.pick').setup({
        window = {
          config = {
            height = 20,
            width = 999,
          },
          prompt_cursor = '▏',
          prompt_prefix = '» ',
        },
        mappings = {
          choose           = '<Tab>',
          move_down        = '<C-j>',
          move_up          = '<C-k>',
          choose_in_split  = '<C-v>',
          choose_in_vsplit = '<C-b>',
          toggle_preview   = '<C-p>',
        },
      })
      -- Function to start the zoxide directory picker
      local function zoxide_pick()
        local zoxide_output = vim.fn.systemlist('zoxide query -ls')
        -- Strip the score prefix from zoxide output
        local directories = {}
        for _, line in ipairs(zoxide_output) do
          local path = line:match("%d+%.%d+%s+(.*)")
          if path then
            table.insert(directories, path)
          end
        end
        -- Start the mini.pick session
        MiniPick.start({
          source = {
            items = directories,
            name = 'Zoxide Directories',
            choose = function(item)
              vim.fn.chdir(item)
              vim.schedule(function()
                require("mini.files").open(item)
              end)
            end,
          },
        })
      end
      vim.keymap.set('n', '<leader>fd', zoxide_pick, { desc = "Zoxide directory picker" })
      vim.keymap.set("n", "<leader>fb", "<CMD>Pick buffers include_current=false<CR>", { desc = "Pick Buffers" })
      vim.keymap.set("n", "<leader>ff", "<CMD>Pick files<CR>", { desc = "Pick Files" })
      vim.keymap.set("n", "<leader>fr", "<CMD>Pick oldfiles<CR>", { desc = "Pick Recent Files" })
      vim.keymap.set("n", "<leader>ft", "<CMD>Pick grep_live<CR>", { desc = "Pick Text From Files" })
      vim.keymap.set("n", "<leader>fe", "<CMD>Pick explorer<CR>", { desc = "Picker Explorer" })
      vim.keymap.set("n", "<leader>fg", "<CMD>Pick git_files<CR>", { desc = "Pick Project Files" })
      vim.keymap.set("n", "<leader>fc", "<CMD>Pick git_commits<CR>", { desc = "Pick Git Commits" })
      vim.keymap.set("n", "<leader>fo", "<CMD>Pick options<CR>", { desc = "Pick Neovim Options" })
      vim.keymap.set("n", "<leader>fp", "<CMD>Pick registers<CR>", { desc = "Pick Neovim Registers" })
      -- without leader key
      vim.keymap.set("n", "gr", "<Cmd>Pick lsp scope='references'<CR>", { desc = "[G]oto [R]eferences" })
      vim.keymap.set("n", "gd", "<Cmd>Pick lsp scope='definition'<CR>", { desc = "[G]oto [D]definition" })
      vim.keymap.set("n", "gD", "<Cmd>Pick lsp scope='declaration'<CR>", { desc = "[G]oto [D]eclaration" })
      vim.ui.select = MiniPick.ui_select
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
        footer = '',
      })
    end,
  },
}
