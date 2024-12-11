-----------------------------------------------------------
-- Editor
-----------------------------------------------------------
return {
	-----------------------------------------------------------
	-- nvim-treesitter
	-----------------------------------------------------------
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "windwp/nvim-ts-autotag", "nvim-treesitter/nvim-treesitter-textobjects" },
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
					init_selection = "<leader>ss", -- set to `false` to disable one of the mappings
					node_incremental = "<leader>si",
					scope_incremental = "<leader>sc",
					node_decremental = "<leader>sd",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
					},
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "V", -- linewise
						["@class.outer"] = "<c-v>", -- blockwise
					},
					include_surrounding_whitespace = true,
				},
			},
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
				mode = "cursor",
				max_lines = 3,
			})
			vim.cmd([[ highlight TreesitterContext guibg=#282828 ]])
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
	-- Current Wornd
	-----------------------------------------------------------
	{
		"RRethy/vim-illuminate",
		event = "BufReadPost",
		enabled = true,
		config = function()
			require("illuminate").configure({
				filetypes_denylist = { "alpha", "dashboard", "neo-tree", "toggleterm", "aerial" },
				min_count_to_highlight = 2,
			})

			if vim.g.colors_name ~= "serenity" then
				vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
				vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
				vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
			end
		end,
	},
	-----------------------------------------------------------
	-- indentition
	-----------------------------------------------------------
	{
		-- indent guides for Neovim
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowTeal",
				"RainbowGreen",
				"RainbowOrange",
				"RainbowCyan",
			}

			local hooks = require("ibl.hooks")
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#ea6962" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#fabd2f" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#458588" })
				vim.api.nvim_set_hl(0, "RainbowTeal", { fg = "#8ec07c" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#b8bb26" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#e78a4e" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#83a598" })
			end)

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
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
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
