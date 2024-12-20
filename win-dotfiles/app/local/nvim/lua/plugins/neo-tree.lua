-----------------------------------------------------------
--  File Explore
-----------------------------------------------------------
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>e", "<Cmd>Neotree toggle left<cr>", desc = "Explorer NeoTree (Left)" },
		{ "<leader>fe", "<Cmd>Neotree toggle float<cr>", desc = "Explorer NeoTree (Float)" },
	},
	opts = {
		close_if_last_window = true,
		popup_border_style = "rounded",
		enable_git_status = true,
		enable_modified_markers = true,
		enable_diagnostics = true,
		sort_case_insensitive = true,
		default_component_configs = {
			indent = {
				with_markers = true,
				with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
			modified = {
				symbol = " ",
				highlight = "NeoTreeModified",
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "",
				default = "",
			},
			git_status = {
				symbols = {
					added = "",
					deleted = "",
					modified = "",
					renamed = "",
					untracked = "",
					ignored = "",
					unstaged = "",
					staged = "",
					conflict = "",
				},
			},
		},
		window = {
			position = "float",
			width = 35,
			mappings = {
				["<TAB>"] = "set_root",
				["<C-h>"] = "navigate_up",
				["<C-b>"] = "open_split",
				["<C-v>"] = "open_vsplit",
				["s"] = false,
				["S"] = false,
				["."] = "toggle_hidden",
			},
		},

		filesystem = {
			use_libuv_file_watcher = true,
			hijack_netrw_behavior = "open_default",
			follow_current_file = {
				enabled = true,
				leave_dirs_open = false,
			},
			filtered_items = {
				hide_dotfiles = true,
				hide_gitignored = true,
				hide_by_name = {
					"node_modules",
				},
				never_show = {
					".DS_Store",
					"thumbs.db",
				},
			},
		},
		source_selector = {
			winbar = true,
			sources = {
				{ source = "filesystem", display_name = "   Files " },
				{ source = "buffers", display_name = "   Bufs " },
				{ source = "git_status", display_name = "   Git " },
			},
		},
		event_handlers = {
			{
				event = "neo_tree_window_after_open",
				handler = function(args)
					if args.position == "left" or args.position == "right" then
						vim.cmd("wincmd =")
					end
				end,
			},
			{
				event = "neo_tree_window_after_close",
				handler = function(args)
					if args.position == "left" or args.position == "right" then
						vim.cmd("wincmd =")
					end
				end,
			},
		},
	},
}
