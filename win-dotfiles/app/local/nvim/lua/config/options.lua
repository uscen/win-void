-----------------------------------------------------------
-- Diagnostic
-----------------------------------------------------------
vim.diagnostic.config({ signs = false, virtual_text = false })
-----------------------------------------------------------
-- Set leader key:
-----------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.cmd([[
  colorscheme habamax
  highlight Normal guibg=#141617
  highlight NormalFloat guibg=#1b1b1b
  highlight FloatBorder guibg=#1b1b1b
  highlight StatusLine guibg=#1b1b1b
  highlight StatusLineNC guibg=#1b1b1b
]])
vim.schedule(function()
  vim.opt.clipboard = "unnamed,unnamedplus"
end)
vim.opt.completeopt  = { "menu", "menuone", "preview" }
vim.opt.compatible   = false
vim.opt.swapfile     = false
vim.opt.writebackup  = false
vim.opt.backup       = false
vim.opt.undofile     = true
vim.opt.undolevels   = 100
vim.opt.timeoutlen   = 300
-----------------------------------------------------------
-- Shell
-----------------------------------------------------------
vim.opt.sh           = "nu"
vim.opt.shellslash   = true
vim.opt.shelltemp    = false
vim.opt.shellcmdflag = "--stdin --no-newline -c"
vim.opt.shellredir   = "out+err> %s"
vim.opt.shellxescape = ""
vim.opt.shellxquote  = ""
vim.opt.shellquote   = ""
vim.o.fillchars      = 'eob: '
-----------------------------------------------------------
-- Files and Others
-----------------------------------------------------------
vim.opt.termbidi     = false
vim.opt.fileencoding = "utf-8"
vim.opt.autochdir    = true
vim.opt.whichwrap    = "b,s,<,>,[,],h,l"
vim.opt.iskeyword:append("-,_")
-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
vim.opt.background    = 'dark'
vim.opt.modeline      = false
vim.opt.number        = true
vim.opt.numberwidth   = 5
vim.opt.splitright    = true
vim.opt.splitbelow    = true
vim.opt.termguicolors = true
vim.opt.ignorecase    = true
vim.opt.smartcase     = true
vim.opt.hlsearch      = true
vim.opt.confirm       = true
vim.opt.showmatch     = true
vim.opt.laststatus    = 0
vim.opt.cmdheight     = 0
vim.opt.pumblend      = 0
vim.opt.pumheight     = 8
vim.opt.wrap          = false
vim.opt.showmode      = false
vim.opt.ruler         = false
vim.wo.signcolumn     = "no"
vim.opt.virtualedit   = "block"
--------------------------------------------------------
-- Tabs, indent:
-----------------------------------------------------------
vim.opt.tabstop       = 2
vim.opt.softtabstop   = 2
vim.opt.shiftwidth    = 2
vim.opt.expandtab     = true
vim.opt.smartindent   = true
vim.opt.shiftround    = true
-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
vim.opt.hidden        = true
vim.opt.history       = 100
vim.opt.lazyredraw    = true
vim.opt.synmaxcol     = 240
vim.opt.updatetime    = 250
-------------------------------------------------------------
-- Use ripgrep as grep tool:
-------------------------------------------------------------
vim.opt.grepprg       = "rg --vimgrep --no-heading"
vim.opt.grepformat    = "%f:%l:%c:%m,%f:%l:%m"
-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
vim.opt.shortmess:append("sI")
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
