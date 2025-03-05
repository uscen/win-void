--          ╔═════════════════════════════════════════════════════════╗
--          ║                          MVIM                           ║
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
--          │                     Mini.Icons                          │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
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
--          │                     Mini.Tabline                        │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
	require("mini.tabline").setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Surround                       │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
	require("mini.surround").setup({
		mappings = {
			add = "S",
			delete = "ds",
			replace = "cs",
		},
	})
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Completion                     │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
	require("mini.completion").setup({
		window = {
			info = { border = "solid" },
			signature = { border = "solid" },
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
later(function()
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
--          ╔═════════════════════════════════════════════════════════╗
--          ║                          Mason                          ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
	add("williamboman/mason.nvim")
	require("mason").setup()
end)
--          ╔═════════════════════════════════════════════════════════╗
--          ║                          Lspconfig                      ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
	add("neovim/nvim-lspconfig")
	local lspconfig = require("lspconfig")
	lspconfig.html.setup({})
	lspconfig.cssls.setup({})
	lspconfig.vtsls.setup({})
	lspconfig.tailwindcss.setup({})
end)
--          ╔═════════════════════════════════════════════════════════╗
--          ║                          Formatter                      ║
--          ╚═════════════════════════════════════════════════════════╝
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
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Neovim Options                      │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
	vim.g.mapleader = " "
	-- General
	vim.schedule(function()
		vim.opt.clipboard = "unnamedplus"
	end)
	vim.opt.completeopt = { "menu", "menuone", "preview" }
	vim.opt.compatible = false
	vim.opt.swapfile = false
	vim.opt.writebackup = false
	vim.opt.backup = false
	vim.opt.undofile = true
	vim.opt.shada = { "'10", "<0", "s10", "h" }
	-- UI
	vim.opt.number = true
	vim.opt.splitright = true
	vim.opt.splitbelow = true
	vim.opt.termguicolors = true
	vim.opt.ignorecase = true
	vim.opt.smartcase = true
	vim.opt.hlsearch = true
	vim.opt.confirm = true
	vim.opt.showmatch = true
	vim.opt.laststatus = 0
	vim.opt.cmdheight = 0
	vim.opt.pumblend = 0
	vim.opt.pumheight = 8
	vim.opt.wrap = false
	vim.opt.modeline = false
	vim.opt.showmode = false
	vim.opt.ruler = false
	vim.wo.signcolumn = "no"
	vim.o.fillchars = "eob: "
	-- Tabs
	vim.opt.tabstop = 2
	vim.opt.softtabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.expandtab = true
	-- Memory
	vim.opt.hidden = true
	vim.opt.history = 100
	vim.opt.lazyredraw = true
	vim.opt.synmaxcol = 200
	vim.opt.updatetime = 250
	vim.opt.timeoutlen = 300
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Neovim autocmds                     │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
	-- Highlight on yank
	vim.api.nvim_create_autocmd("TextYankPost", {
		callback = function()
			vim.highlight.on_yank({ higroup = "CurSearch", timeout = 200 })
		end,
	})
	-- Don't Comment New Line
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "*",
		callback = function()
			vim.opt_local.formatoptions:remove({ "r", "o" })
		end,
	})
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Neovim keymaps                      │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
	-- Basic Keymaps:
	vim.keymap.set("n", "<C-s>", ":up<CR>")
	vim.keymap.set("i", "<C-s>", "<ESC> :up<CR>")
	vim.keymap.set("n", "<leader>qq", ":qa<CR>")
	vim.keymap.set("n", "<ESC>", ":nohl<CR>")
	-- Move lines up and down in visual mode
	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
	-- Bufferline Keys
	vim.keymap.set("n", "<Tab>", ":bnext<CR>")
	vim.keymap.set("n", "<S-Tab>", ":bprev<CR>")
	vim.keymap.set("n", "<leader>bd", ":bd<CR>")
	vim.keymap.set("n", "<leader>bb", ":%bd<CR><C-O>:bd#<CR>")
	-- Move inside completion list with <TAB>
	vim.keymap.set("i", "<C-j>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
	vim.keymap.set("i", "<C-k>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
	-- Mini Pick
	vim.keymap.set("n", "<leader>fb", "<CMD>Pick buffers include_current=false<CR>", { desc = "Pick Buffers" })
	vim.keymap.set("n", "<leader>ff", "<CMD>Pick files<CR>", { desc = "Pick Files" })
	vim.keymap.set("n", "<leader>fr", "<CMD>Pick oldfiles<CR>", { desc = "Pick Recent Files" })
	vim.keymap.set("n", "<leader>ft", "<CMD>Pick grep_live<CR>", { desc = "Pick Text From Files" })
	vim.keymap.set("n", "<leader>fe", "<CMD>Pick explorer<CR>", { desc = "Picker Explorer" })
	vim.keymap.set("n", "<leader>fg", "<CMD>Pick git_files<CR>", { desc = "Pick Project Files" })
	vim.keymap.set("n", "<leader>fc", "<CMD>Pick git_commits<CR>", { desc = "Pick Git Commits" })
	vim.keymap.set("n", "<leader>fo", "<CMD>Pick options<CR>", { desc = "Pick Neovim Options" })
	vim.keymap.set("n", "<leader>fp", "<CMD>Pick registers<CR>", { desc = "Pick Neovim Registers" })
	vim.keymap.set("n", "gr", "<Cmd>Pick lsp scope='references'<CR>", { desc = "[G]oto [R]eferences" })
	vim.keymap.set("n", "gd", "<Cmd>Pick lsp scope='definition'<CR>", { desc = "[G]oto [D]definition" })
	vim.keymap.set("n", "gD", "<Cmd>Pick lsp scope='declaration'<CR>", { desc = "[G]oto [D]eclaration" })
	-- Mini Pick
	vim.keymap.set("n", "<leader>gh", MiniDiff.toggle_overlay)
	-- Mini Files
	vim.keymap.set("n", "<leader>e", "<CMD>lua MiniFiles.open()<CR>", { desc = "Files Manager" })
end)
