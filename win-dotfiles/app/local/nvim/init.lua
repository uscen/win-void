--          ╔═════════════════════════════════════════════════════════╗
--          ║                          Plugins                        ║
--          ╚═════════════════════════════════════════════════════════╝
--          ┌─────────────────────────────────────────────────────────┐
--                Clone 'mini.nvim manually in a way that it gets
--                            managed by 'mini.deps'
--          └─────────────────────────────────────────────────────────┘
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/echasnovski/mini.nvim",
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.nvim | helptags ALL")
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Deps                           │
--          ╰─────────────────────────────────────────────────────────╯
require("mini.deps").setup({ path = { package = path_package } })
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local now_if_args = vim.fn.argc(-1) > 0 and now or later
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Icons                          │
--          ╰─────────────────────────────────────────────────────────╯
now_if_args(function()
  require("mini.icons").setup()
  require("mini.icons").tweak_lsp_kind()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Misc                           │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require('mini.misc').setup_auto_root { '.git', "package.json" }
  require('mini.misc').setup_restore_cursor()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.CursorWord                     │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require('mini.cursorword').setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Trailspace                     │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.trailspace").setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Diff                           │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.diff").setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Git                            │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.git").setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.SplitJoin                      │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.splitjoin").setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Operators                      │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require('mini.operators').setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Bracketed                      │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.bracketed").setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Jump                           │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require('mini.jump').setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Extra                          │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.extra").setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Notify                         │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require('mini.notify').setup()
  vim.notify = require('mini.notify').make_notify()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Indentscope                    │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.indentscope").setup({
    symbol = "▎",
    options = {
      try_as_border = true,
    }
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Tabline                        │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.tabline").setup({
    format = function(buf_id, label)
      local suffix = vim.bo[buf_id].modified and "● " or ""
      return MiniTabline.default_format(buf_id, label) .. suffix
    end,
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                   Mini.Jump2d                           │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.jump2d").setup({
    labels = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
    view = { dim = true, n_steps_ahead = 1 },
    allowed_lines = { cursor_at = false },
    mappings = { start_jumping = "" },
    silent = true,
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Surround                       │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.surround").setup({
    mappings = {
      add = "ys",
      delete = "ds",
      replace = "cs",
    },
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Hipatterns                     │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.hipatterns").setup({
    highlighters = {
      -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE':  ============================
      fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
      hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
      todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
      note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
      -- Highlight hex color strings (`#rrggbb`) using that color: =========================
      hex_color = require("mini.hipatterns").gen_highlighter.hex_color({
        style = "inline",
        inline_text = "⬤ ",
      }),
    },
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Paris                          │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.pairs").setup({
    modes = { insert = true, command = true, terminal = false },
    mappings = {
      [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
      ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
      ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
      ["["] = { action = "open", pair = "[]", neigh_pattern = ".[%s%z%)}%]]", register = { cr = false } },
      ["{"] = { action = "open", pair = "{}", neigh_pattern = ".[%s%z%)}%]]", register = { cr = false } },
      ["("] = { action = "open", pair = "()", neigh_pattern = ".[%s%z%)}%]]", register = { cr = false } },
      ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^%w\\][^%w]", register = { cr = false } },
      ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%w\\][^%w]", register = { cr = false } },
      ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^%w\\][^%w]", register = { cr = false } },
    },
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Ai                             │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.ai").setup({
    custom_textobjects = {
      e = {
        {
          -- __-1, __-U, __-l, __-1_, __-U_, __-l_
          '[^_%-]()[_%-]+()%w()()[%s%p]',
          '^()[_%-]+()%w()()[%s%p]',
          -- __-123SNAKE
          '[^_%-]()[_%-]+()%d+%u[%u%d]+()()',
          '^()[_%-]+()%d+%u[%u%d]+()()',
          -- __-123snake
          '[^_%-]()[_%-]+()%d+%l[%l%d]+()()',
          '^()[_%-]+()%d+%l[%l%d]+()()',
          -- __-SNAKE, __-SNAKE123
          '[^_%-]()[_%-]+()%u[%u%d]+()()',
          '^()[_%-]+()%u[%u%d]+()()',
          -- __-snake, __-Snake, __-snake123, __-Snake123
          '[^_%-]()[_%-]+()[%u%l][%l%d]+()()',
          '^()[_%-]+()[%u%l][%l%d]+()()',
          -- UPPER, UPPER123, UPPER-__, UPPER123-__
          -- No support: 123UPPER
          '[^_%-%u]()()%u[%u%d]+()[_%-]*()',
          '^()()%u[%u%d]+()[_%-]*()',
          -- UPlower, UPlower123, UPlower-__, UPlower123-__
          '%u%u()()[%l%d]+()[_%-]*()',
          -- lower, lower123, lower-__, lower123-__
          '[^_%-%u%l%d]()()[%l%d]+()[_%-]*()',
          '^()()[%l%d]+()[_%-]*()',
          -- Camel, Camel123, Camel-__, Camel123-__
          '[^_%-%u]()()%u[%l%d]+()[_%-]*()',
          '^()()%u[%l%d]+()[_%-]*()',
        },
      },
    },
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Pick                           │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.pick").setup({
    mappings = {
      choose = "<Tab>",
      move_down = "<C-j>",
      move_up = "<C-k>",
      choose_in_split = "<C-v>",
      choose_in_vsplit = "<C-b>",
      toggle_preview = "<C-p>",
    },
    options = {
      use_cache = true,
      content_from_bottom = false
    },
    window = {
      config = {
        height = 20,
        width = 999,
      },
      prompt_caret = "▏",
      prompt_prefix = "» ",
    },
  })
  vim.ui.select = MiniPick.ui_select
  -- Pick Directory  Form Current Directory: ===========================================
  function directory_pick()
    local root_dir = vim.fn.getcwd()
    local fd_output = vim.fn.systemlist('fd --type d --exclude ".*" . "' .. root_dir .. '"')
    MiniPick.start({
      source = {
        items = fd_output,
        name = 'Directories (fd)',
        choose = function(item)
          vim.fn.chdir(item)
          vim.schedule(function()
            require("mini.files").open(item)
          end)
        end,
      },
    })
  end

  -- Pick Directory  Form Zoxide : ======================================================
  function zoxide_pick()
    local zoxide_output = vim.fn.systemlist('zoxide query -ls')
    local directories = {}
    for _, line in ipairs(zoxide_output) do
      local path = line:match("%d+%.%d+%s+(.*)")
      if path then
        table.insert(directories, path)
      end
    end
    MiniPick.start({
      source = {
        items = directories,
        name = 'Directories (zoxide)',
        choose = function(item)
          vim.fn.chdir(item)
          vim.schedule(function()
            require("mini.files").open(item)
          end)
        end,
      },
    })
  end
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Files                          │
--          ╰─────────────────────────────────────────────────────────╯
now_if_args(function()
  require("mini.files").setup({
    mappings = {
      go_in_plus = "<Tab>",
      go_out_plus = "<C-h>",
      synchronize = "<C-s>",
      reset = "gh",
      close = "q",
      go_in = "",
      go_out = "",
    },
    windows = {
      max_number = 1,
      width_focus = 999,
    },
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Starter                        │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
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
      new_section("Browser Files", "lua MiniFiles.open()", "Picker"),
      new_section("Update Plugins", "DepsUpdate", "Config"),
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
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Snippets                       │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
  -- Languge Patterns: ==============================================================
  local webPatterns = { 'web/*.json' }
  local webHtmlPatterns = { 'web/*.json', 'html.json' }
  local lang_patterns = {
    html = webHtmlPatterns,
    tsx = webPatterns,
    javascript = webPatterns,
    typescript = webPatterns,
    javascriptreact = webPatterns,
    typescriptreact = webPatterns,
  }
  -- Expand Patterns: ===============================================================
  local match_strict = function(snips)
    -- Do not match with whitespace to cursor's left ================================
    -- return require('mini.snippets').default_match(snips, { pattern_fuzzy = '%S+' })
    -- Match exact from the start to the end of the string ==========================
    return require('mini.snippets').default_match(snips, { pattern_fuzzy = '^%S+$' })
  end
  -- Setup Snippets ==================================================================
  require('mini.snippets').setup({
    snippets = {
      require('mini.snippets').gen_loader.from_file('~/AppData/Local/nvim/snippets/global.json'),
      require('mini.snippets').gen_loader.from_lang({ lang_patterns = lang_patterns })
    },
    mappings = {
      expand = '<C-e>',
      jump_next = '<C-l>',
      jump_prev = '<C-h>',
      stop = '<C-c>',
    },
    expand   = {
      match = match_strict,
      insert = function(snippet)
        return require('mini.snippets').default_insert(snippet, {
          empty_tabstop = '',
          empty_tabstop_final = ''
        })
      end
    },
  })
  require('mini.snippets').start_lsp_server()
  -- Expand Snippets Or complete by Tab ===============================================
  expand_or_complete = function()
    if #MiniSnippets.expand({ insert = false }) > 0 then
      vim.schedule(MiniSnippets.expand); return ''
    end
    return vim.fn.pumvisible() == 1 and
        (vim.fn.complete_info().selected == -1 and vim.keycode('<c-n><c-y>') or vim.keycode('<c-y>')) or "<Tab>"
  end
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Completion                     │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
  -- enable configured language servers 0.11: ========================================
  local lsp_configs = { "lua", "html", "css", "emmet", "json", "tailwind", "typescript", "eslint", "prisma", "markdown" }
  vim.lsp.config("*", {
    capabilities = {
      textDocument = {
        semanticTokens = {
          multilineTokenSupport = true,
        }
      }
    },
    root_markers = {
      '.git'
    },
  })
  for _, config in ipairs(lsp_configs) do
    vim.lsp.enable(config)
  end
  -- enable Mini.Completion: ==============================================================
  require("mini.completion").setup({
    delay = { completion = 100, info = 100, signature = 50 },
    mappings = {
      force_twostep = '<C-n>',
      force_fallback = '<C-S-n>',
      scroll_down = '<C-j>',
      scroll_up = '<C-k>',
    },
  })
end)
--          ╔═════════════════════════════════════════════════════════╗
--          ║                          Treesitter                     ║
--          ╚═════════════════════════════════════════════════════════╝
now_if_args(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'master',
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })
  local ensure_installed = {
    'bash', 'powershell', 'nu', 'c', 'cpp', 'python', 'regex',
    'html', 'css', 'scss', 'javascript', 'typescript', 'tsx', 'prisma',
    'json', 'jsonc', 'toml', 'yaml', 'lua', 'luadoc', 'vim', 'vimdoc', 'markdown', 'markdown_inline',
    "git_config", "git_rebase", "gitcommit", "gitignore", "gitattributes", "diff",
  }
  require('nvim-treesitter.configs').setup({
    ensure_installed = ensure_installed,
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = { enable = false },
    textobjects = { enable = false },
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                      TS Auto Close/Rename               │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  add("windwp/nvim-ts-autotag")
  require('nvim-ts-autotag').setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                    TS Rainbow delimiters                │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  add("hiphish/rainbow-delimiters.nvim")
  require('rainbow-delimiters.setup').setup()
end)
--          ╔═════════════════════════════════════════════════════════╗
--          ║                         Formatting                      ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
  add('stevearc/conform.nvim')
  require('conform').setup({
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      jsx = { "prettier" },
      tsx = { "prettier" },
      svelte = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      liquid = { "prettier" },
      c = { "clang_format" },
      lua = { "stylua" },
      python = { "black" },
      tex = { "latexindent" },
      xml = { "xmllint" },
      svg = { "xmllint" },
      sql = { "sqlfluff" },
      java = { "google-java-format" },
      groovy = { "npm-groovy-lint" },
      ['_'] = { 'trim_whitespace' },
    },
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 1000, lsp_format = "fallback" }
    end,
  })
end)
--          ╔═════════════════════════════════════════════════════════╗
--          ║                          NVIM                           ║
--          ╚═════════════════════════════════════════════════════════╝
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Neovim Colorscheme                  │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
  vim.cmd("colorscheme minibase-core")
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Neovim Options                      │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
  -- Global:  =================================================================
  vim.g.mapleader               = vim.keycode("<space>")
  vim.g.maplocalleader          = vim.keycode("<cr>")
  -- Use ripgrep as grep tool: ================================================
  vim.opt.grepprg               = "rg --vimgrep --no-heading"
  vim.opt.grepformat            = "%f:%l:%c:%m,%f:%l:%m"
  vim.opt.path                  = ".,,**"
  -- Shell: =-================================================================
  vim.opt.sh                    = "nu"
  vim.opt.shellslash            = true
  vim.opt.shelltemp             = false
  vim.opt.shellcmdflag          = "--stdin --no-newline -c"
  vim.opt.shellredir            = "out+err> %s"
  vim.opt.shellxescape          = ""
  vim.opt.shellxquote           = ""
  vim.opt.shellquote            = ""
  -- General: ================================================================
  vim.opt.clipboard             = "unnamedplus"
  vim.opt.wildmenu              = true
  vim.opt.wildoptions           = "fuzzy,pum"
  vim.opt.completeopt           = "menuone,noselect,fuzzy"
  vim.opt.complete              = ".,b,kspell"
  vim.opt.switchbuf             = "usetab"
  vim.opt.compatible            = false
  vim.opt.swapfile              = false
  vim.opt.writebackup           = false
  vim.opt.backup                = false
  vim.opt.spell                 = false
  vim.opt.undofile              = true
  vim.opt.shada                 = { "'10", "<0", "s10", "h" }
  -- UI: ====================================================================
  vim.opt.number                = true
  vim.opt.relativenumber        = false
  vim.opt.cursorline            = false
  vim.opt.splitright            = true
  vim.opt.splitbelow            = true
  vim.opt.termguicolors         = true
  vim.opt.confirm               = true
  vim.opt.showmatch             = true
  vim.opt.laststatus            = 0
  vim.opt.cmdheight             = 0
  vim.opt.pumwidth              = 20
  vim.opt.pumblend              = 10
  vim.opt.pumheight             = 10
  vim.opt.wrap                  = false
  vim.opt.breakindent           = true
  vim.opt.copyindent            = true
  vim.opt.modeline              = false
  vim.opt.showmode              = false
  vim.opt.ruler                 = false
  vim.opt.winborder             = "single"
  vim.opt.colorcolumn           = '+1'
  vim.opt.cursorlineopt         = "screenline,number"
  vim.opt.shortmess             = "FOSWaco"
  vim.wo.signcolumn             = "yes"
  vim.opt.statuscolumn          = ""
  vim.opt.fillchars             = table.concat(
    { 'eob: ', 'fold:╌', 'horiz:═', 'horizdown:╦', 'horizup:╩', 'vert:║', 'verthoriz:╬', 'vertleft:╣', 'vertright:╠' },
    ','
  )
  vim.o.listchars               = table.concat({ 'extends:…', 'nbsp:␣', 'precedes:…', 'tab:> ' }, ',')
  -- Editing:  ================================================================
  vim.opt.autoindent            = true
  vim.opt.expandtab             = true
  vim.opt.ignorecase            = true
  vim.opt.incsearch             = true
  vim.opt.infercase             = true
  vim.opt.shiftwidth            = 2
  vim.opt.smartcase             = true
  vim.opt.smartindent           = true
  vim.opt.tabstop               = 2
  vim.opt.breakindentopt        = "list:-1"
  vim.opt.formatlistpat         = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]
  vim.opt.virtualedit           = "block"
  vim.opt.formatoptions         = "rqnl1j"
  vim.opt.formatexpr            = "v:lua.require'conform'.formatexpr()"
  -- Fold:  ================================================================
  vim.opt.foldenable            = false
  vim.opt.foldlevel             = 99
  vim.opt.foldmethod            = "expr"
  vim.opt.foldexpr              = "v:lua.vim.treesitter.foldexpr()"
  -- Memory: ================================================================
  vim.opt.hidden                = true
  vim.opt.history               = 100
  vim.opt.lazyredraw            = true
  vim.opt.synmaxcol             = 200
  vim.opt.updatetime            = 200
  vim.opt.timeoutlen            = 300
  -- Disable health checks for these providers:. ===========================
  vim.g.loaded_python_provider  = 0
  vim.g.loaded_python3_provider = 0
  vim.g.loaded_ruby_provider    = 0
  vim.g.loaded_perl_provider    = 0
  vim.g.loaded_node_provider    = 0
  -- Disable builtin plugins: ===============================================
  local disabled_built_ins      = {
    "osc52",
    "parser",
    "health",
    "man",
    "tohtml",
    "2html",
    "remote",
    "shadafile",
    "spellfile",
    "editorconfig",
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "matchparen",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
    "tutor",
    "rplugin",
    "synmenu",
    "optwin",
    "compiler",
    "bugreport",
    "ftplugin",
  }
  for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
  end
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Neovim Diagnostics                  │
--          ╰─────────────────────────────────────────────────────────╯
local diagnostic_opts = {
  severity_sort = false,
  update_in_insert = false,
  virtual_lines = false,
  virtual_text = { current_line = true, severity = { min = 'ERROR', max = 'ERROR' } },
  underline = { severity = { min = 'HINT', max = 'ERROR' } },
  signs = {
    priority = 9999,
    severity = {
      min = 'WARN',
      max = 'ERROR',
    },
    text = {
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.ERROR] = " ",
    },
    -- interference With Mini.Diff ====================================================
    -- numhl = {
    --   [vim.diagnostic.severity.ERROR] = "ErrorMsg",
    --   [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
    --   [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
    --   [vim.diagnostic.severity.HINT] = "DiagnosticHint",
    -- },
  },
}
-- Use `later()` to avoid sourcing `vim.diagnostic` on startup: ======================
later(function() vim.diagnostic.config(diagnostic_opts) end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Neovim automads                     │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  -- Remove Space && Last_Lines =====================================================
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = "MiniTrailspace",
    callback = function()
      MiniTrailspace.trim()
      MiniTrailspace.trim_last_lines()
    end,
  })
  -- Don't Comment New Line ========================================================
  vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('CustomSettings', {}),
    callback = function()
      vim.cmd('setlocal formatoptions-=c formatoptions-=o')
    end,
  })
  -- Highlight Yank ================================================================
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    callback = function()
      vim.highlight.on_yank({ higroup = 'CurSearch', timeout = 200 })
    end,
  })
  -- Eable FormatOnSave =============================================================
  vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
    vim.notify("Format On Save Enable")
  end, {
    desc = "Re-enable autoformat-on-save",
  })
  -- Disable FormatOnSave ===========================================================
  vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
      vim.b.disable_autoformat = true
    else
      vim.g.disable_autoformat = true
    end
    vim.notify("Format On Save Disable")
  end, {
    desc = "Disable autoformat-on-save",
    bang = true,
  })
  -- Disable indentscope in Terminals ===============================================
  vim.api.nvim_create_autocmd("TermEnter", {
    callback = function()
      vim.b.miniindentscope_disable = true
    end
  })
  -- Qucikfix List: =================================================================
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function(event)
      local opts = { buffer = event.buf, silent = true }
      vim.keymap.set('n', '<C-j>', '<cmd>cn<CR>zz<cmd>wincmd p<CR>', opts)
      vim.keymap.set('n', '<C-k>', '<cmd>cN<CR>zz<cmd>wincmd p<CR>', opts)
      vim.keymap.set('n', '<Tab>', '<CR>', opts)
      vim.keymap.set('n', 'q', '<cmd>cclose<CR>', { buffer = true })
    end
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Neovim keymaps                      │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  -- Basic Keymaps: ================================================================
  vim.keymap.set("n", "<C-s>", ":silent up<CR>")
  vim.keymap.set("i", "<C-s>", "<ESC> :up<CR>")
  vim.keymap.set("n", "<leader>qq", ":qa<CR>")
  vim.keymap.set("n", "<leader>wq", ":close<CR>")
  vim.keymap.set("n", "<ESC>", ":nohl<CR>")
  vim.keymap.set('n', '<Space>', '<Nop>')
  -- Move around: ==================================================================
  vim.keymap.set("n", "<C-h>", "<C-w>h")
  vim.keymap.set("n", "<C-j>", "<C-w>j")
  vim.keymap.set("n", "<C-k>", "<C-w>k")
  vim.keymap.set("n", "<C-l>", "<C-w>l")
  -- Bufferline Keys: ==============================================================
  vim.keymap.set("n", "<Tab>", ":bnext<CR>")
  vim.keymap.set("n", "<S-Tab>", ":bprev<CR>")
  vim.keymap.set("n", "<leader>bd", ":bd<CR>")
  vim.keymap.set('n', '<space>bb', function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.bo[buf].buflisted and buf ~= vim.api.nvim_get_current_buf() then
        vim.cmd('silent! bd ' .. buf)
      end
    end
  end)
  -- Subtitle Keys: =================================================================
  vim.keymap.set('n', 'S', function()
    return ':%s/\\<' .. vim.fn.escape(vim.fn.expand('<cword>'), '/\\') .. '\\>/'
  end, { expr = true })
  --  Magick: ===================================================================
  vim.keymap.set("n", "ycc", "yygccp", { remap = true })
  vim.keymap.set("n", "J", "mzJ`z:delmarks z<cr>")
  vim.keymap.set("x", "/", "<Esc>/\\%V")
  vim.keymap.set("x", "R", ":s###g<left><left><left>")
  -- Move lines up and down in visual mode =========================================
  vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
  vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
  -- Move inside completion list with <TAB> ========================================
  vim.keymap.set("i", "<C-j>", [[pumvisible() ? "\<C-n>" : "\<C-j>"]], { expr = true })
  vim.keymap.set("i", "<C-k>", [[pumvisible() ? "\<C-p>" : "\<C-k>"]], { expr = true })
  vim.keymap.set('i', '<Tab>', expand_or_complete, { expr = true })
  -- Terminal: ====================================================================
  vim.keymap.set({ "n", "t" }, "<C-t>", "<CMD>FloatTermToggle<CR>", { noremap = true, silent = true })
  vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { noremap = true, silent = true })
  vim.keymap.set("n", "<leader>t", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 20)
    vim.cmd("startinsert")
  end)
  -- Mini Pick =====================================================================
  vim.keymap.set('n', '<leader>fd', zoxide_pick)
  vim.keymap.set('n', '<leader>fn', directory_pick)
  vim.keymap.set("n", "<leader>fb", "<CMD>Pick buffers include_current=false<CR>")
  vim.keymap.set("n", "<leader>ff", "<CMD>Pick files<CR>")
  vim.keymap.set("n", "<leader>fr", "<CMD>Pick oldfiles<CR>")
  vim.keymap.set("n", "<leader>ft", "<CMD>Pick grep_live<CR>")
  vim.keymap.set("n", "<leader>fe", "<CMD>Pick explorer<CR>")
  vim.keymap.set("n", "<leader>fg", "<CMD>Pick git_files<CR>")
  vim.keymap.set("n", "<leader>fc", "<CMD>Pick git_commits<CR>")
  vim.keymap.set("n", "<leader>fo", "<CMD>Pick options<CR>")
  vim.keymap.set("n", "<leader>fp", "<CMD>Pick registers<CR>")
  vim.keymap.set("n", "<leader>fk", "<CMD>Pick keymaps<CR>")
  vim.keymap.set("n", "gR", "<Cmd>Pick lsp scope='references'<CR>")
  vim.keymap.set("n", "gD", "<Cmd>Pick lsp scope='definition'<CR>")
  vim.keymap.set("n", "gI", "<Cmd>Pick lsp scope='declaration'<CR>")
  -- Mini Git =====================================================================
  vim.keymap.set("n", "<leader>ga", "<cmd>:Git add .<cr>")
  vim.keymap.set("n", "<leader>gc", "<cmd>:Git commit<cr>")
  vim.keymap.set("n", "<leader>gC", "<Cmd>Git commit --amend<CR>")
  vim.keymap.set("n", "<leader>gp", "<cmd>:Git push -u origin main<cr>")
  vim.keymap.set("n", "<leader>gP", "<cmd>:Git pull<cr>")
  vim.keymap.set("n", "<leader>gd", "<Cmd>Git diff<CR>")
  vim.keymap.set("n", "<leader>gD", "<Cmd>Git diff -- %<CR>")
  vim.keymap.set("n", "<leader>gs", "<Cmd>lua MiniGit.show_at_cursor()<CR>")
  vim.keymap.set("n", "<leader>gl", [[<Cmd>Git log --pretty=format:\%h\ \%as\ │\ \%s --topo-order<CR>]])
  vim.keymap.set("n", "<leader>gh", [[<Cmd>lua MiniDiff.toggle_overlay()<CR>]])
  -- Mini Files: =================================================================
  vim.keymap.set("n", "<leader>e", function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end)
  vim.keymap.set("n", "<leader>E", function() require("mini.files").open(vim.uv.cwd(), true) end)
  -- Mini Jump2d: ================================================================
  vim.keymap.set({ "o", "x", "n" }, "s", "<Cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<CR>")
end)
--          ╔═════════════════════════════════════════════════════════╗
--          ║                          Neovide                        ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
  if vim.g.neovide then
    vim.o.guicursor =
    "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait100-blinkoff700-blinkon700-Cursor/lCursor,sm:block-blinkwait0-blinkoff300-blinkon300"
    vim.keymap.set({ "n", "v" }, "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
  end
end)
--          ╔═════════════════════════════════════════════════════════╗
--          ║                          FileType                       ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
  vim.filetype.add({
    extension = {
      ["http"] = "http",
      ["json"] = "jsonc",
      ["map"] = "json",
      ["mdx"] = "markdown",
    },
    filename = {
      ["xhtml"] = "html",
      ["tsconfig.json"] = "jsonc",
      ['.yamlfmt'] = 'yaml',
    },
    pattern = {
      ["%.env%.[%w_.-]+"] = "sh",
      [".gitconfig.*"] = "gitconfig",
    },
  })
end)
