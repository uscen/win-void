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
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Lspconfig                           │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
  local lsp_configs = { "html", "css", "json", "typescript", "lua" }
  for _, config in ipairs(lsp_configs) do
    vim.lsp.enable(config)
  end
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Icons                          │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
  require("mini.icons").setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Ai                             │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.ai").setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.SplitJoin                      │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.diff").setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.diff                           │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.splitjoin").setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Extra                          │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.extra").setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Paris                          │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.pairs").setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Completion                     │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
  require("mini.completion").setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Snippets                       │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
  require("mini.snippets").setup({
    snippets = { require("mini.snippets").gen_loader.from_lang() }
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Tabline                        │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
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
      -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
      fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
      hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
      todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
      note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
      -- Highlight hex color strings (`#rrggbb`) using that color
      hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
    },
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Base16                         │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
  require("mini.base16").setup({
    palette = {
      base00 = "#141617",
      base01 = "#141617",
      base02 = "#282828",
      base03 = "#5a524c",
      base04 = "#bdae93",
      base05 = "#ddc7a1",
      base06 = "#ebdbb2",
      base07 = "#fbf1c7",
      base08 = "#ea6962",
      base09 = "#e78a4e",
      base0A = "#d8a657",
      base0B = "#a9b665",
      base0C = "#89b482",
      base0D = "#89b482",
      base0E = "#a9b665",
      base0F = "#bd6f3e",
    },
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Files                          │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
  require("mini.files").setup({
    mappings = {
      close = "q",
      go_in = "l",
      go_in_plus = "<Tab>",
      go_out = "h",
      go_out_plus = "<C-h>",
      mark_goto = "'",
      mark_set = "m",
      reset = "gh",
      reveal_cwd = "@",
      show_help = "g?",
      synchronize = "<C-s>",
      trim_left = "<",
      trim_right = ">",
    },
    windows = {
      max_number = 1,
      width_focus = 999,
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
    },
    window = {
      config = {
        height = 20,
        width = 999,
      },
      prompt_cursor = "▏",
      prompt_prefix = "» ",
    },
  })
  vim.ui.select = MiniPick.ui_select
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     formatter                           │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  add("stevearc/conform.nvim")
  local conform = require("conform")
  conform.setup({
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      svelte = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      liquid = { "prettier" },
      lua = { "stylua" },
      python = { "isort" },
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
--          │                     Neovim Options                      │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
  -- Diagnostics ================================================================
  vim.diagnostic.config({ signs = false, virtual_text = false, update_in_insert = false })
  -- Global:  =================================================================
  vim.g.mapleader = " "
  -- General: ================================================================
  vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
  end)
  vim.opt.completeopt      = 'menuone,noselect,fuzzy'
  vim.opt.complete         = '.,b,kspell'
  vim.opt.compatible       = false
  vim.opt.swapfile         = false
  vim.opt.writebackup      = false
  vim.opt.backup           = false
  vim.opt.spell            = false
  vim.opt.undofile         = true
  vim.opt.shada            = { "'10", "<0", "s10", "h" }
  -- UI: ====================================================================
  vim.opt.number           = true
  vim.opt.splitright       = true
  vim.opt.splitbelow       = true
  vim.opt.termguicolors    = true
  vim.opt.confirm          = true
  vim.opt.showmatch        = true
  vim.opt.laststatus       = 0
  vim.opt.cmdheight        = 0
  vim.opt.pumblend         = 10
  vim.opt.pumheight        = 10
  vim.opt.pumwidth         = 40
  vim.opt.wrap             = false
  vim.opt.modeline         = false
  vim.opt.showmode         = false
  vim.opt.ruler            = false
  vim.wo.signcolumn        = "no"
  vim.opt.statuscolumn     = ""
  vim.opt.fillchars        = "eob: "
  -- Editing:  ================================================================
  vim.opt.autoindent       = true
  vim.opt.expandtab        = true
  vim.opt.ignorecase       = true
  vim.opt.incsearch        = true
  vim.opt.infercase        = true
  vim.opt.shiftwidth       = 2
  vim.opt.smartcase        = true
  vim.opt.smartindent      = true
  vim.opt.tabstop          = 2
  vim.opt.virtualedit      = 'block'
  vim.o.formatoptions      = 'rqnl1j'
  -- Memory: ================================================================
  vim.opt.hidden           = true
  vim.opt.history          = 100
  vim.opt.lazyredraw       = true
  vim.opt.synmaxcol        = 200
  vim.opt.updatetime       = 250
  vim.opt.timeoutlen       = 300
  -- Disable builtin plugins
  local disabled_built_ins = {
    "osc52",
    "parser",
    "health",
    "man",
    "tohtml",
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
--          │                     Neovim keymaps                      │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  -- Basic Keymaps: ================================================================
  vim.keymap.set("n", "<C-s>", ":up<CR>")
  vim.keymap.set("i", "<C-s>", "<ESC> :up<CR>")
  vim.keymap.set("n", "<leader>qq", ":qa<CR>")
  vim.keymap.set("n", "<leader>wq", ":close<CR>")
  vim.keymap.set("n", "<ESC>", ":nohl<CR>")
  -- Move around: ==================================================================
  vim.keymap.set("n", "<C-h>", "<C-w>h")
  vim.keymap.set("n", "<C-j>", "<C-w>j")
  vim.keymap.set("n", "<C-k>", "<C-w>k")
  vim.keymap.set("n", "<C-l>", "<C-w>l")
  -- Bufferline Keys: ==============================================================
  vim.keymap.set("n", "<Tab>", ":bnext<CR>")
  vim.keymap.set("n", "<S-Tab>", ":bprev<CR>")
  vim.keymap.set("n", "<leader>bd", ":bd<CR>")
  vim.keymap.set("n", "<leader>bb", ":%bd<CR><C-O>:bd#<CR>")
  -- Move lines up and down in visual mode =========================================
  vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
  vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
  -- Move inside completion list with <TAB> ========================================
  vim.keymap.set("i", "<C-j>", [[pumvisible() ? "\<C-n>" : "\<C-j>"]], { expr = true })
  vim.keymap.set("i", "<C-k>", [[pumvisible() ? "\<C-p>" : "\<C-k>"]], { expr = true })
  vim.keymap.set("i", "<Tab>", [[pumvisible() ? (complete_info().selected == -1 ? "\<C-n>\<C-y>" : "\<C-y>") : "\<Tab>"]],
    { expr = true })
  -- Mini Pick =====================================================================
  vim.keymap.set("n", "<leader>fb", "<CMD>Pick buffers include_current=false<CR>")
  vim.keymap.set("n", "<leader>ff", "<CMD>Pick files<CR>")
  vim.keymap.set("n", "<leader>fr", "<CMD>Pick oldfiles<CR>")
  vim.keymap.set("n", "<leader>ft", "<CMD>Pick grep_live<CR>")
  vim.keymap.set("n", "<leader>fe", "<CMD>Pick explorer<CR>")
  vim.keymap.set("n", "<leader>fg", "<CMD>Pick git_files<CR>")
  vim.keymap.set("n", "<leader>fc", "<CMD>Pick git_commits<CR>")
  vim.keymap.set("n", "<leader>fo", "<CMD>Pick options<CR>")
  vim.keymap.set("n", "<leader>fp", "<CMD>Pick registers<CR>")
  vim.keymap.set("n", "gr", "<Cmd>Pick lsp scope='references'<CR>")
  vim.keymap.set("n", "gd", "<Cmd>Pick lsp scope='definition'<CR>")
  vim.keymap.set("n", "gD", "<Cmd>Pick lsp scope='declaration'<CR>")
  -- Mini Diff: ==================================================================
  vim.keymap.set("n", "<leader>gh", MiniDiff.toggle_overlay)
  -- Mini Files: =================================================================
  vim.keymap.set("n", "<leader>e", "<CMD>lua MiniFiles.open()<CR>")
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Neovim automads                     │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
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
      vim.highlight.on_yank()
    end,
  })
  -- highlight (Jsx,Tsx) ===========================================================
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascriptreact", "typescriptreact" },
    callback = function()
      vim.cmd [[
        syntax match jsxTag "</\?[A-Z]\k*\>"
        highlight link jsxTag htmlTagName
      ]]
      vim.api.nvim_set_hl(0, 'htmlTagName', { fg = '#e78a4e' })
    end
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                 Highlight groups                        │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
  -- Pmenu: =====================================================================
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1d2021", fg = "#ebdbb2" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#a9b665", fg = "#141617" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#1d2021" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#1d2021" })
  vim.api.nvim_set_hl(0, "PmenuExtra", { link = "Pmenu" })
  vim.api.nvim_set_hl(0, "PmenuKind", { link = "Pmenu" })
  vim.api.nvim_set_hl(0, "PmenuExtraSel", { link = "PmenuSel" })
  vim.api.nvim_set_hl(0, "PmenuKindSel", { link = "PmenuSel" })
  -- Tabline :===================================================================
  vim.api.nvim_set_hl(0, "MiniTablineCurrent", { fg = "#a9b665", bg = "#141617", bold = true, italic = true })
  vim.api.nvim_set_hl(0, "MiniTablineHidden", { fg = "#928374", bg = "#141617", bold = true, italic = true })
  vim.api.nvim_set_hl(0, "MiniTablineVisible", { link = "MiniTablineCurrent" })
  vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", { link = "MiniTablineCurrent" })
  vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible", { link = "MiniTablineCurrent" })
  vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", { link = "MiniTablineHidden" })
  vim.api.nvim_set_hl(0, "MiniTablineTabpagesSection", { link = "MiniTablineCurrent" })
  vim.api.nvim_set_hl(0, "MiniTablineFill", { link = "MiniTablineCurrent" })
end)
--          ╔═════════════════════════════════════════════════════════╗
--          ║                          Neovide                        ║
--          ╚═════════════════════════════════════════════════════════╝
now(function()
  if vim.g.neovide then
    vim.g.neovide_scroll_animation_length = 0.1
    vim.opt.mousescroll = "ver:10,hor:6"
    vim.opt.linespace = -1
    vim.g.neovide_theme = "dark"

    vim.g.neovide_floating_shadow = true
    vim.g.neovide_floating_z_height = 2
    vim.g.neovide_light_angle_degrees = 45
    vim.g.neovide_light_radius = 15

    vim.g.neovide_floating_blur_amount_x = 10.0
    vim.g.neovide_floating_blur_amount_y = 10.0

    vim.o.guicursor =
    "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait100-blinkoff700-blinkon700-Cursor/lCursor,sm:block-blinkwait0-blinkoff300-blinkon300"
    vim.g.neovide_cursor_animation_length = 0.03
    vim.g.neovide_cursor_smooth_blink = true
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
  end
end)
