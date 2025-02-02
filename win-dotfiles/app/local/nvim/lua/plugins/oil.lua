-----------------------------------------------------------
-- Oil
-----------------------------------------------------------
return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>o", "<cmd>Oil<cr>", desc = "Oil NoNFloatings" },
			{ "<leader>e", "<cmd>OilToggle<cr>", desc = "Oil NFloatings Toggle" },
			{ "<leader>fo", "<cmd>Oil --float<cr>", desc = "Oil Floatings" },
			{ "<leader>fe", "<cmd>Oil --float<cr>", desc = "Oil Floatings" },
		},
		opts = {
			default_file_explorer = true,
			delete_to_trash = false,
			skip_confirm_for_simple_edits = true,
			border = "single",
			win_options = {
				wrap = true,
				signcolumn = "yes:2",
			},
			view_options = {
				show_hidden = false,
				natural_order = true,
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git"
				end,
			},
			progress = {
				max_width = 0.9,
				min_width = { 40, 0.4 },
				width = nil,
				max_height = { 10, 0.9 },
				min_height = { 5, 0.1 },
				height = nil,
				border = "rounded",
				minimized_border = "none",
				win_options = {
					winblend = 0,
				},
			},
			float = {
				padding = 2,
				max_width = 0,
				max_height = 0,
				border = "rounded",
				win_options = {
					winblend = 0,
				},
				progress = {
					max_width = 0.9,
					min_width = { 40, 0.4 },
					width = nil,
					max_height = { 10, 0.9 },
					min_height = { 5, 0.1 },
					height = nil,
					border = "rounded",
					minimized_border = "none",
					win_options = {
						winblend = 0,
					},
				},
				-- This is the config that will be passed to nvim_open_win.
				-- Change values here to customize the layout
				override = function(conf)
					return conf
				end,
			},
			use_default_keymaps = false,
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-l>"] = "actions.select",
				["<TAB>"] = "actions.select",
				["<C-TAB>"] = "actions.parent",
				["<C-h>"] = "actions.parent",
				["<C-v>"] = "actions.select_split",
				["<C-b>"] = "actions.select_vsplit",
				["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-r>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["H"] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
			},
		},
	},
	{
		"SirZenith/oil-vcs-status",
		config = function()
			require("oil-vcs-status").setup({
				__newentry = true,
				status_symbol = {
					added = "",
					copied = "󰆏",
					deleted = "",
					ignored = "",
					modified = "",
					renamed = "",
					typechanged = "󰉺",
					unmodified = " ",
					unmerged = "",
					untracked = "",
					external = "",

					upstream_added = "󰈞",
					upstream_copied = "󰈢",
					upstream_deleted = "",
					upstream_ignored = " ",
					upstream_modified = "󰏫",
					upstream_renamed = "",
					upstream_typechanged = "󱧶",
					upstream_unmodified = " ",
					upstream_unmerged = "",
					upstream_untracked = " ",
					upstream_external = "",
				},
				status_priority = {
					upstream_ignored = 0,
					upstream_untracked = 1,
					upstream_unmodified = 2,
					upstream_external = 2,
					upstream_copied = 3,
					upstream_renamed = 3,
					upstream_typechanged = 3,
					upstream_deleted = 4,
					upstream_modified = 4,
					upstream_added = 4,
					upstream_unmerged = 5,
					ignored = 10,
					untracked = 11,
					unmodified = 12,
					external = 12,
					copied = 13,
					renamed = 13,
					typechanged = 13,
					deleted = 14,
					modified = 14,
					added = 14,
					unmerged = 15,
				},
			})
		end,
	},
}
