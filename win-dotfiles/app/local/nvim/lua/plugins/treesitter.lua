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
				"query",
				"c",
				"cpp",
				"markdown",
				"markdown_inline",
				"git_config",
				"git_rebase",
				"gitcommit",
				"gitignore",
				"gitattributes",
				"diff",
				"vim",
				"vimdoc",
				"regex",
				"bash",
				"powershell",
				"toml",
				"yaml",
				"ssh_config",
				"zathurarc",
				"jq",
				"json",
				"json5",
				"printf",
				"ini",
				"nu",
				-- 'fullstack'
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"scss",
			},
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
			context_commentstring = { enable = true, enable_autocmd = true },
			matchup = { enable = true, include_match_words = true, enable_quotes = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>ss",
					node_incremental = "<leader>si",
					scope_incremental = "<leader>sc",
					node_decremental = "<leader>sd",
				},
			},
		},
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
				"<leader>k",
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
		-- indent guides for Neovim
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local ibl = require("ibl")
			ibl.setup({
				indent = {
					char = "│",
					tab_char = "│",
					-- highlight = highlight,
				},
				scope = {
					enabled = false,
				},
				vim.opt.listchars:append("space: "),
			})
		end,
	},
	{
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},
}
