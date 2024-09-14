-----------------------------------------------------------
--  Telescope
-----------------------------------------------------------
return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	dependencies = {
		"nvim-lua/popup.nvim",
		"jvgrootveld/telescope-zoxide",
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{
			"<C-p>",
			function()
				require("telescope.builtin").find_files({
					-- cwd = require("lazy.core.config").options.root
				})
			end,
			desc = "Find Files",
		},
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({
					-- cwd = require("lazy.core.config").options.root
				})
			end,
			desc = "Find Files",
		},
		{
			"<leader>fr",
			function()
				require("telescope.builtin").oldfiles({
					-- cwd = require("lazy.core.config").options.root
				})
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep({
					-- cwd = require("lazy.core.config").options.root
				})
			end,
			desc = "Live grep file content",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Search opened buffers",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Search help manual page",
		},
		{
			"<leader>fd",
			function()
				require("telescope").extensions.zoxide.list()
			end,
			desc = "Change Into Directory",
		},
		{
			"<leader>cd",
			function()
				require("telescope").extensions.zoxide.list()
			end,
			desc = "Change Into Directory",
		},
		{
			";z",
			function()
				require("telescope").extensions.zoxide.list()
			end,
			desc = "Change Into Directory",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local z_utils = require("telescope._extensions.zoxide.utils")
		local TelescopeColor = {
			TelescopeMatching = { fg = "#d8a657" },
			TelescopeSelection = { fg = "#0d0e0f", bg = "#689d6a", bold = true },

			TelescopePromptPrefix = { bg = "#0d0e0f" },
			TelescopePromptNormal = { bg = "#0d0e0f" },
			TelescopeResultsNormal = { bg = "#0d0e0f" },
			TelescopePreviewNormal = { bg = "#0d0e0f" },
			TelescopePromptBorder = { bg = "#0d0e0f", fg = "#0d0e0f" },
			TelescopeResultsBorder = { bg = "#0d0e0f", fg = "#0d0e0f" },
			TelescopePreviewBorder = { bg = "#0d0e0f", fg = "#0d0e0f" },
			TelescopePromptTitle = { bg = "#ea6962", fg = "#0d0e0f" },
			TelescopeResultsTitle = { fg = "#0d0e0f" },
			TelescopePreviewTitle = { bg = "#a9b665", fg = "#0d0e0f" },
		}

		for hl, col in pairs(TelescopeColor) do
			vim.api.nvim_set_hl(0, hl, col)
		end

		telescope.setup({
			-- (other Telescope configuration...)
			extensions = {
				zoxide = {
					prompt_title = "[ Walking on the shoulders of TJ ]",
					mappings = {
						default = {
							after_action = function(selection)
								print("Update to (" .. selection.z_score .. ") " .. selection.path)
							end,
						},
						["<C-s>"] = {
							before_action = function(selection)
								print("before C-s")
							end,
							action = function(selection)
								vim.cmd.edit(selection.path)
							end,
						},
						-- Opens the selected entry in a new split
						["<C-q>"] = { action = z_utils.create_basic_command("split") },
					},
				},
			},
			defaults = {
				layout_strategy = "vertical",
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = { mirror = false },
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				sorting_strategy = "ascending",
				prompt_prefix = "  ",
				selection_caret = " ",
				winblend = 0,
				file_ignore_patterns = {
					"vendor/*",
					"%.lock",
					"__pycache__/*",
					"%.sqlite3",
					"%.ipynb",
					"node_modules/*",
					"%.jpg",
					"%.jpeg",
					"%.png",
					"%.svg",
					"%.avif",
					"%.otf",
					"%.ttf",
					".git/",
					"%.webp",
					".dart_tool/",
					".github/",
					".gradle/",
					".idea/",
					".settings/",
					".vscode/",
					"__pycache__/",
					"build/",
					"env/",
					"gradle/",
					"node_modules/",
					"target/",
					"%.pdb",
					"%.dll",
					"%.class",
					"%.exe",
					"%.cache",
					"%.ico",
					"%.pdf",
					"%.dylib",
					"%.jar",
					"%.docx",
					"%.met",
					"smalljre_*/*",
					".vale/",
					"%.burp",
					"%.mp4",
					"%.mkv",
					"%.rar",
					"%.zip",
					"%.7z",
					"%.tar",
					"%.bz2",
					"%.epub",
					"%.flac",
					"%.tar.gz",
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,

						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,

						["<C-c>"] = actions.close,
						--
						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,

						["<CR>"] = actions.select_default,
						["<C-s>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,

						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,

						["<PageUp>"] = actions.results_scrolling_up,
						["<PageDown>"] = actions.results_scrolling_down,

						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-l>"] = actions.complete_tag,
						["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
					},

					n = {
						["<esc>"] = actions.close,
						["<CR>"] = actions.select_default,
						["<C-s>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,

						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["H"] = actions.move_to_top,
						["M"] = actions.move_to_middle,
						["L"] = actions.move_to_bottom,

						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,
						["gg"] = actions.move_to_top,
						["G"] = actions.move_to_bottom,

						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,

						["<PageUp>"] = actions.results_scrolling_up,
						["<PageDown>"] = actions.results_scrolling_down,

						["?"] = actions.which_key,
					},
				},
				dynamic_preview_title = true,
				path_display = { "truncate" },
			},
			pickers = {
				find_files = {
					theme = "dropdown",
				},
				oldfiles = {
					theme = "dropdown",
				},
				grep_string = {
					theme = "dropdown",
				},
				live_grep = {
					theme = "dropdown",
				},
				registers = {
					theme = "dropdown",
				},
				diagnostics = {
					theme = "dropdown",
				},
				buffers = {
					sort_lastused = true,
				},
			},
		})
	end,
}
