-----------------------------------------------------------
-- Git
-----------------------------------------------------------
return {
	-----------------------------------------------------------
	-- Gitsigns
	-----------------------------------------------------------
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>ga",
				"<cmd>Gitsigns toggle_linehl<CR> <BAR> <cmd>Gitsigns toggle_deleted<CR> <BAR> <cmd>Gitsigns toggle_word_diff<CR>",
				desc = "Toggle ALL Gitsigns",
			},
			{
				"<leader>gl",
				"<cmd>Gitsigns toggle_linehl<CR>",
				desc = "Toggle Gitsigns linehl",
			},
			{
				"<leader>gd",
				"<cmd>Gitsigns toggle_deleted<CR>",
				desc = "Toggle Gitsigns deleted",
			},
			{
				"<leader>gw",
				"<cmd>Gitsigns toggle_word_diff<CR>",
				desc = "Toggle Gitsigns worddiff",
			},
		},
		opts = {
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "契" },
				topdelete = { text = "契" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
		},
	},
}
