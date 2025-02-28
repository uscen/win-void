-----------------------------------------------------------
-- Diagnostic
-----------------------------------------------------------
vim.diagnostic.config({ signs = false, virtual_text = false })
-----------------------------------------------------------
-- Set leader key:
-----------------------------------------------------------
vim.g.mapleader = " "
-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.schedule(function()
  vim.opt.clipboard = "unnamed,unnamedplus"
end)
vim.opt.completeopt   = { "menu", "menuone", "preview" }
vim.opt.compatible    = false
vim.opt.swapfile      = false
vim.opt.writebackup   = false
vim.opt.backup        = false
vim.opt.undofile      = true
vim.opt.undolevels    = 100
vim.opt.timeoutlen    = 300
vim.opt.ttimeoutlen   = 10
-----------------------------------------------------------
-- Shell
-----------------------------------------------------------
vim.opt.sh            = "nu"
vim.opt.shellslash    = true
vim.opt.shelltemp     = false
vim.opt.shellcmdflag  = "--stdin --no-newline -c"
vim.opt.shellredir    = "out+err> %s"
vim.opt.shellxescape  = ""
vim.opt.shellxquote   = ""
vim.opt.shellquote    = ""
-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
vim.opt.number        = true
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
vim.opt.modeline      = false
vim.opt.showmode      = false
vim.opt.ruler         = false
vim.wo.signcolumn     = "no"
vim.o.fillchars       = 'eob: '
--------------------------------------------------------
-- Tabs, indent:
-----------------------------------------------------------
vim.opt.tabstop       = 2
vim.opt.softtabstop   = 2
vim.opt.shiftwidth    = 2
vim.opt.expandtab     = true
-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
vim.opt.hidden        = true
vim.opt.history       = 100
vim.opt.lazyredraw    = true
vim.opt.synmaxcol     = 240
vim.opt.updatetime    = 300
