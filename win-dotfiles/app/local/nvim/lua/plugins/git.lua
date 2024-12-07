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
			signcolumn = true,
			numhl = false,
			linehl = false,
			word_diff = false,
			watch_gitdir = { interval = 1000, follow_files = true },
			attach_to_untracked = true,
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol",
				delay = 0,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = "      <author>, <author_time:%R> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000,
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		},
	},
}
