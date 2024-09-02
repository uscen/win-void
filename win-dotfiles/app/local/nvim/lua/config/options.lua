-----------------------------------------------------------
-- Set leader key:
-----------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.opt.termbidi = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.undofile = true
vim.opt.undolevels = 10000
-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1
vim.o.cursorline = false
vim.opt.showmatch = true
vim.opt.foldmethod = "marker"
vim.opt.colorcolumn = ""
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.linebreak = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.pumblend = 0
vim.opt.showmode = false
vim.opt.pumheight = 8
vim.opt.confirm = true
-----------------------------------------------------------
-- Code folding options:
-----------------------------------------------------------
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-----------------------------------------------------------
-- Indent BlankLine
-----------------------------------------------------------
vim.opt.list = false
vim.opt.listchars:append("eol:⤸")
vim.opt.listchars:append("tab:│ ")
vim.opt.listchars:append("space:⋅")
--------------------------------------------------------
-- Tabs, indent:
-----------------------------------------------------------
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.shiftround = true
-------------------------------------------------------------
-- Use ripgrep as grep tool:
-------------------------------------------------------------
vim.opt.grepprg = "rg --vimgrep --no-heading"
vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
-----------------------------------------------------------
-- Disable some builtin providers:
-------------------------------------------------------------
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
