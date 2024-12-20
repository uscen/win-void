-----------------------------------------------------------
-- Git
-----------------------------------------------------------
return {
	-----------------------------------------------------------
	-- LazyGit
	-----------------------------------------------------------
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open Lazy Git" },
			{ "<leader>gf", "<cmd>LazyGitCurrentFile<cr>", desc = "Open Lazy Git" },
		},
		config = function()
			vim.g.lazygit_floating_window_winblend = 1
			vim.g.lazygit_floating_window_use_plenary = 1
			vim.g.lazygit_floating_window_scaling_factor = 0.9
		end,
	},
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
