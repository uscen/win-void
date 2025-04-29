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
--          │                     Mini.deps                           │
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
--          │                     Mini.misc                           │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require('mini.misc').setup_auto_root { '.git' }
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
--          │                     Mini.Ai                             │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.ai").setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.diff                           │
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
--          │                     Mini.operators                      │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require('mini.operators').setup()
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
      hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
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
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Files                          │
--          ╰─────────────────────────────────────────────────────────╯
now_if_args(function()
  require("mini.files").setup({
    mappings = {
      close = "q",
      go_in = "l",
      go_in_plus = "<Tab>",
      go_out = "h",
      go_out_plus = "<C-h>",
      reset = "gh",
      synchronize = "<C-s>",
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
  -- Expand Snippets Or complete by Tab ===============================================
  expand_or_complete = function()
    if #MiniSnippets.expand({ insert = false }) > 0 then
      vim.schedule(MiniSnippets.expand); return ''
    end
    return vim.fn.pumvisible() == 1 and (vim.fn.complete_info().selected == -1 and "<C-n><C-y>" or "<C-y>") or
        "<Tab>"
  end
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Completion                     │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
  -- enable configured language servers 0.11: ========================================
  local lsp_configs = { "lua", "html", "css", "emmet", "json", "tailwind", "typescript", "markdown" }
  for _, config in ipairs(lsp_configs) do
    vim.lsp.enable(config)
  end
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
      return { timeout_ms = 500, lsp_format = "fallback" }
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
  vim.opt.pumblend              = 10
  vim.opt.pumheight             = 10
  vim.opt.wrap                  = false
  vim.opt.breakindent           = true
  vim.opt.copyindent            = true
  vim.opt.modeline              = false
  vim.opt.showmode              = false
  vim.opt.ruler                 = false
  vim.opt.colorcolumn           = '+1'
  vim.opt.cursorlineopt         = "screenline,number"
  vim.opt.shortmess             = "FOSWaco"
  vim.wo.signcolumn             = "no"
  vim.opt.statuscolumn          = ""
  vim.opt.fillchars             = { eob = " " }
  vim.opt.listchars             = {
    tab = "▏ ",
    trail = "·",
    extends = "»",
    precedes = "«",
  }
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
  vim.opt.virtualedit           = "block"
  vim.opt.formatoptions         = "rqnl1j"
  vim.o.formatexpr              = "v:lua.require'conform'.formatexpr()"
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
  vim.opt.updatetime            = 250
  vim.opt.timeoutlen            = 300
  -- Disable health checks for these providers:. ===========================
  vim.g.loaded_python_provider  = 0
  vim.g.loaded_python3_provider = 0
  vim.g.loaded_ruby_provider    = 0
  vim.g.loaded_perl_provider    = 0
  vim.g.loaded_node_provider    = 0
  -- Disable builtin plugins: ===============================================
  vim.opt.shortmess:append("sI")
  local disabled_built_ins = {
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
  signs = { priority = 9999, severity = { min = 'WARN', max = 'ERROR' } },
  underline = { severity = { min = 'HINT', max = 'ERROR' } },
  virtual_text = { current_line = true, severity = { min = 'ERROR', max = 'ERROR' } },
  virtual_lines = false,
  severity_sort = false,
  update_in_insert = false,
}
-- Use `later()` to avoid sourcing `vim.diagnostic` on startup
later(function() vim.diagnostic.config(diagnostic_opts) end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Neovim automads                     │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  -- Remove Space && Last_Lines ====================================================
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
      vim.highlight.on_yank({ timeout = 200 })
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
  -- Disable FormatOnSave =============================================================
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
  -- use gl,gh to move: =============================================================
  vim.keymap.set("n", "gh", "^")
  vim.keymap.set("n", "gl", "$")
  vim.keymap.set("v", "gh", "^")
  vim.keymap.set("v", "gl", "$")
  -- Bufferline Keys: ==============================================================
  vim.keymap.set("n", "<Tab>", ":bnext<CR>")
  vim.keymap.set("n", "<S-Tab>", ":bprev<CR>")
  vim.keymap.set("n", "<leader>bd", ":bd<CR>")
  vim.keymap.set("n", "<leader>bb", function()
    vim.cmd("silent update")
    local bufs = vim.tbl_filter(function(buf)
      return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype ~= "terminal"
    end, vim.api.nvim_list_bufs())
    if #bufs > 0 then vim.cmd("bdelete " .. table.concat(bufs, " ")) end
    vim.cmd("silent! bdelete# | e# | bd# | '\"")
  end)
  -- Subtitle Keys: =================================================================
  vim.keymap.set('', 'S', function()
    local cmd = ':%s//gcI<Left><Left><Left><Left>'
    return vim.fn.mode() == 'n' and string.format(cmd, '%s') or string.format(cmd, 's')
  end, { expr = true })
  --  Magick: ===================================================================
  vim.keymap.set("n", "ycc", "yygccp", { remap = true })
  vim.keymap.set("n", "J", "mzJ`z:delmarks z<cr>")
  vim.keymap.set("x", "/", "<Esc>/\\%V")
  vim.keymap.set("x", "R", ":s###g<left><left><left>", { desc = "Start replacement in the visual selected region" })
  -- Move lines up and down in visual mode =========================================
  vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
  vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
  -- Move inside completion list with <TAB> ========================================
  vim.keymap.set("i", "<C-j>", [[pumvisible() ? "\<C-n>" : "\<C-j>"]], { expr = true })
  vim.keymap.set("i", "<C-k>", [[pumvisible() ? "\<C-p>" : "\<C-k>"]], { expr = true })
  vim.keymap.set("i", "<C-p>", [[pumvisible() ? "\<C-e>" : "\<C-p>"]], { expr = true })
  vim.keymap.set("i", "<S-Tab>",
    [[pumvisible() ? (complete_info().selected == -1 ? "\<C-n>\<C-y>" : "\<C-y>") : "\<S-Tab>"]], { expr = true })
  vim.keymap.set('i', '<Tab>', expand_or_complete, { expr = true })
  -- Mini Pick =====================================================================
  vim.keymap.set('n', '<leader>fd', zoxide_pick)
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
  vim.keymap.set("n", "gr", "<Cmd>Pick lsp scope='references'<CR>")
  vim.keymap.set("n", "gd", "<Cmd>Pick lsp scope='definition'<CR>")
  vim.keymap.set("n", "gD", "<Cmd>Pick lsp scope='declaration'<CR>")
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
end)
--          ╔═════════════════════════════════════════════════════════╗
--          ║                          Neovide                        ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
  if vim.g.neovide then
    -- General Animations: ==============================================================
    vim.opt.mousescroll = "ver:10,hor:6"
    vim.opt.linespace = -1
    vim.g.neovide_theme = "auto"
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_fullscreen = false
    vim.g.neovide_confirm_quit = false
    vim.g.neovide_remember_window_size = true
    vim.g.experimental_layer_grouping = true
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_detach_on_quit = "always_detach"
    vim.g.neovide_opacity = 1
    vim.g.neovide_normal_opacity = 1
    vim.g.neovide_underline_stroke_scale = 1.5
    -- Padding Animations: =============================================================
    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0
    -- Floating Animations: =============================================================
    vim.g.neovide_floating_shadow = true
    vim.g.neovide_floating_z_height = 5
    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0
    vim.g.neovide_light_angle_degrees = 45
    vim.g.neovide_light_radius = 5
    vim.g.floaterm_winblend = 15
    vim.g.neovide_floating_corner_radius = 0.0
    -- Cursor Animations: ===============================================================
    vim.o.guicursor =
    "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait100-blinkoff700-blinkon700-Cursor/lCursor,sm:block-blinkwait0-blinkoff300-blinkon300"
    vim.g.neovide_scroll_animation_length = 0.1
    vim.g.neovide_cursor_animation_length = 0.05
    vim.g.neovide_cursor_trail_length = 0.01
    vim.g.neovide_cursor_unfocused_outline_width = 0.125
    vim.g.neovide_cursor_smooth_blink = true
    vim.g.neovide_cursor_animate_command_line = true
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_animate_in_insert_mode = true
    vim.g.neovide_cursor_animate_in_normal_mode = true
    vim.g.neovide_cursor_animate_in_visual_mode = true
    vim.g.neovide_cursor_animate_in_replace_mode = true
    vim.g.neovide_cursor_animate_in_command_mode = true
    -- VFX Animations: ==================================================================
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
    vim.g.neovide_cursor_vfx_opacity = 200.0
    vim.g.neovide_cursor_vfx_particle_speed = 10.0
    vim.g.neovide_cursor_vfx_particle_curl = 0.77
    vim.g.neovide_cursor_vfx_particle_density = 3.25
    vim.g.neovide_cursor_vfx_particle_lifetime = 1.33
    vim.g.neovide_cursor_vfx_particle_phase = 12.1
    -- Resize Fonts:  ===================================================================
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
      ["env"] = "dotenv",
      ["http"] = "http",
      ["json"] = "jsonc",
      ["map"] = "json",
      ["mdx"] = "markdown",
    },
    filename = {
      ["xhtml"] = "html",
      ["tsconfig.json"] = "jsonc",
      [".env"] = "dotenv",
      [".envrc"] = "sh",
      ['.yamlfmt'] = 'yaml',
    },
    pattern = {
      ["%.env%.[%w_.-]+"] = "dotenv",
      [".gitconfig.*"] = "gitconfig",
    },
  })
end)
