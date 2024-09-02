-----------------------------------------------------------
-- Noice & Notifictions
-----------------------------------------------------------
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	enabled = false,
	dependencies = {
		{ "MunifTanjim/nui.nvim", lazy = true },
		{
			"rcarriga/nvim-notify",
			lazy = true,
			event = "VeryLazy",
			keys = {
				{
					"<leader>un",
					function()
						require("notify").dismiss({ silent = true, pending = true })
					end,
					desc = "Delete all Notifications",
				},
			},
			opts = {
				stages = "static",
				render = "default",
				timeout = 1200,
				minimum_width = 50,
				icons = { ERROR = "", WARN = "", INFO = "", DEBUG = "", TRACE = "✎" },
				level = vim.log.levels.INFO,
				fps = 20,
				background_colour = "#282828",
				on_open = function(win)
					vim.api.nvim_win_set_config(win, { zindex = 100 })
				end,
			},
		},
	},
	opts = {
		cmdline = {
			enabled = true,
			view = "cmdline",
			format = {
				cmdline = { icon = "  " },
				search_down = { icon = "  " },
				search_up = { icon = "  " },
				filter = { icon = "  " },
				lua = { icon = " 󰢱 " },
				help = { icon = "  " },
				inc_rename = {
					pattern = "^:%s*IncRename%s+",
					icon = " ",
					conceal = true,
				},
			},
		},
		presets = {
			bottom_search = true,
			command_palette = false,
			long_message_to_split = true,
			inc_rename = true,
			lsp_doc_border = true,
		},
		messages = {
			enabled = true,
			view = "mini",
			view_error = "mini",
			view_warn = "mini",
		},
		lsp = {
			progress = {
				enabled = true,
				format = "lsp_progress",
				format_done = "lsp_progress_done",
				throttle = 1000 / 30,
				view = "mini",
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
	},
}
