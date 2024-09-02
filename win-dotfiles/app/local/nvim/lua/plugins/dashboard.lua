-----------------------------------------------------------
-- Dashboard
-----------------------------------------------------------
return {
	"nvimdev/dashboard-nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VimEnter",
	keys = {
		{ "<leader>d", "<Cmd>Dashboard<CR>", desc = "Choose Buffer to Close" },
	},
	config = function()
		local version = vim.version()
		local header = {
			"                                  ",
			"                                  ",
			"                                  ",
			"                                  ",
			"                                  ",
			"                                  ",
			"                                  ",
			"                                  ",
			"           ▄ ▄                    ",
			"       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄      ",
			"       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █      ",
			"    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █      ",
			"  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄   ",
			"  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄ ",
			"▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █ ",
			"█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █ ",
			"    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█     ",
			"                                  ",
			"N E O V I M - v " .. version.major .. "." .. version.minor,
			"",
		}

		local center = {
			{
				desc = "Find File                     ",
				keymap = "",
				key = "f",
				icon = "  ",
				action = "Telescope find_files",
			},
			{
				desc = "Recents",
				keymap = "",
				key = "r",
				icon = "  ",
				action = "Telescope oldfiles",
			},

			{
				desc = "Browse Files",
				keymap = "",
				key = "b",
				icon = "  ",
				action = "Oil",
			},

			{
				desc = "New File",
				keymap = "",
				key = "n",
				icon = "  ",
				action = "enew",
			},

			{
				desc = "Load Last Session",
				keymap = "",
				key = "l",
				icon = "  ",
				action = "require('persistence').load({ last = true })",
			},

			{
				desc = "Update Plugins",
				keymap = "",
				key = "u",
				icon = "  ",
				action = "Lazy update",
			},

			{
				desc = "Manage Extensions",
				keymap = "",
				key = "e",
				icon = "  ",
				action = "Mason",
			},

			{
				desc = "Config",
				keymap = "",
				key = "c",
				icon = "  ",
				action = "Telescope find_files cwd=~/.config/nvim",
			},
			{
				desc = "Exit",
				keymap = "",
				key = "q",
				icon = "  ",
				action = "exit",
			},
		}

		vim.api.nvim_create_autocmd("Filetype", {
			pattern = "dashboard",
			group = vim.api.nvim_create_augroup("Dashboard_au", { clear = true }),
			callback = function()
				vim.cmd([[
            setlocal buftype=nofile
            setlocal nonumber norelativenumber nocursorline noruler fillchars=eob:\
            nnoremap <buffer> <F2> :h news.txt<CR>
        ]])
			end,
		})

		require("dashboard").setup({
			theme = "doom",
			config = {
				header = header,
				center = center,
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return { "Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
				end,
			},
		})
	end,
}
