-----------------------------------------------------------
-- Set leader key:
-----------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-----------------------------------------------------------
-- SHELL
-----------------------------------------------------------
if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
	local opt = vim.opt
	-- use git-bash for `:!`, `:ter`
	-- windows only, convert \ to / when expanding file names
	opt.shellslash = true
	-- defaults to cmd.exe
	opt.shell = vim.fs.normalize("bash.exe")
	-- opt.shell = "bash.exe" -- WARN: sometimes mistakenly points to wsl bash

	-- defaults to "/s /c" for cmd.exe
	opt.shellcmdflag = "-c"
	-- default value works
	opt.shellpipe = "2>&1| tee"
	-- Windows: may default to "\"" when 'shell' contains 'sh'
	opt.shellquote = ""
	opt.shellxquote = ""
	-- defaults to ">", 'bash' uses:
	opt.shellredir = ">%s 2>&1"
	-- defualt value works
	opt.shellxescape = ""
end
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
vim.opt.numberwidth = 4
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
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
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
