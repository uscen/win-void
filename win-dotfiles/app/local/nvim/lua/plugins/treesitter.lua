-----------------------------------------------------------
-- Editor
-----------------------------------------------------------
return {
	-----------------------------------------------------------
	-- nvim-treesitter
	-----------------------------------------------------------
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "windwp/nvim-ts-autotag" },
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ensure_installed = {
				-- 'base',
				"lua",
				"luadoc",
				"luap",
				"cpp",
				"markdown",
				"markdown_inline",
				"git_config",
				"git_rebase",
				"gitcommit",
				"gitignore",
				-- 'gitattributes',
				"diff",
				"vim",
				"vimdoc",
				-- 'regex',
				"bash",
				"toml",
				"ssh_config",
				"zathurarc",
				"json",
				"printf",
				"ini",
				-- 'fullstack'
				"tsx",
				"typescript",
				"javascript",
				"html",
				"css",
			},
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
			context_commentstring = { enable = true, enable_autocmd = false },
			matchup = { enable = true, include_match_words = true, enable_quotes = true },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
			-- Use the bash ts parser for zsh
			vim.treesitter.language.register("bash", "zsh")
		end,
	},

	-----------------------------------------------------------
	-- nvim-treesitter-context
	-----------------------------------------------------------
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = "nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("treesitter-context").setup({
				max_lines = 3,
			})
			vim.cmd([[ highlight TreesitterContext guibg=#202020 ]])
		end,
	},

	-----------------------------------------------------------
	-- vim-matchup
	-----------------------------------------------------------
	{
		"andymass/vim-matchup",
		dependencies = "nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			vim.g.matchup_matchparen_offscreen = {}
			vim.g.matchup_matchparen_deferred = 1
		end,
	},

	-----------------------------------------------------------
	-- vim-cool
	-----------------------------------------------------------
	{
		"romainl/vim-cool",
		keys = { "/", "?", "*", "#", "g*", "g#", "n", "N" },
	},

	-----------------------------------------------------------
	-- treesj
	-----------------------------------------------------------
	{
		"Wansmer/treesj",
		dependencies = "nvim-treesitter/nvim-treesitter",
		opts = { max_join_length = 150 },
		keys = {
			{
				"<leader>t",
				function()
					return require("treesj").toggle()
				end,
				desc = "Toggle node under cursor",
			},
			{
				"<leader>j",
				function()
					return require("treesj").join()
				end,
				desc = "Join node under cursor",
			},
			{
				"<leader>s",
				function()
					return require("treesj").split()
				end,
				desc = "Split node under cursor",
			},
		},
	},

	-----------------------------------------------------------
	-- nvim-ts-autotag
	-----------------------------------------------------------
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},

	-----------------------------------------------------------
	-- ts-comment.nvim
	-----------------------------------------------------------
	{

		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
		enabled = vim.fn.has("nvim-0.10") == 1,
	},

	-----------------------------------------------------------
	-- rainbow-delimiters.nvim
	-----------------------------------------------------------
	{
		"hiphish/rainbow-delimiters.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
	},

	-----------------------------------------------------------
	-- indentition
	-----------------------------------------------------------
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	-----------------------------------------------------------
	-- Current Word
	-----------------------------------------------------------
	{
		"dominikduda/vim_current_word",
		enabled = false,
	},
}
