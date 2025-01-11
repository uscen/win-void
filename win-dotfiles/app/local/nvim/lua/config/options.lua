-----------------------------------------------------------
-- Set leader key:
-----------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.opt.mouse = "a"
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
vim.opt.swapfile = false
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.cmd([[
let &shell = 'nu'
let &shellcmdflag = '-c'
let &shellquote = ""
let &shellxquote = ""
]])
-----------------------------------------------------------
-- Files and Others
-----------------------------------------------------------
vim.opt.termbidi = true
vim.opt.fileencoding = "utf-8"
vim.opt.autochdir = true
vim.opt.hidden = true
vim.opt.whichwrap = "b,s,<,>,[,],h,l"
vim.opt.iskeyword:append("-,_")
-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.scrolloff = 0
vim.o.cursorline = true
vim.opt.showmatch = true
vim.opt.colorcolumn = ""
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.linebreak = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.pumblend = 0
vim.opt.showmode = false
vim.opt.pumheight = 8
vim.opt.confirm = true
vim.opt.virtualedit = "block"
-----------------------------------------------------------
-- Code folding options:
-----------------------------------------------------------
-- vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.opt.foldmethod = "marker"
-----------------------------------------------------------
-- Indent BlankLine
-----------------------------------------------------------
vim.opt.list = false
vim.opt.listchars:append("eol:⤸")
vim.opt.listchars:append("tab:│ ")
vim.opt.listchars:append("space:⋅")
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
--------------------------------------------------------
-- Tabs, indent:
-----------------------------------------------------------
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
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
-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Lua module loader
vim.loader.enable()
-- Disable nvim intro
vim.opt.shortmess:append("sI")
-- Disable builtin plugins
local disabled_built_ins = {
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
-----------------------------------------------------------
-- Neovide:
-------------------------------------------------------------
vim.g.neovide_theme = "dark"
