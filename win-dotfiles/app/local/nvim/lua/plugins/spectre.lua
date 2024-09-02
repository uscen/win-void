-----------------------------------------------------------
-- Spectre
-----------------------------------------------------------
return {
	"nvim-pack/nvim-spectre",
	keys = {
		{
			"<leader>rr",
			'<cmd>lua require("spectre").open_file_search()<CR>',
			{ desc = "Search/replace on current file" },
		},
		{
			"<leader>rs",
			'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
			{ desc = "Search/replace Select Word In file" },
		},
		{
			"ra",
			'<cmd>lua require("spectre").toggle()<cr>',
			desc = "Search/replace text in the workspace",
		},
	},
	config = function()
		require("spectre").setup({
			open_cmd = "tabnew",
			live_update = true,
			ignore_filetypes = { "NvimTree", "neo-tree" },
			ignore_buftypes = {
				nofile = true,
				"NvimTree",
				"neo-tree",
				"go",
			},
			popup = {
				delay_ms = 0,
				inc_ms = 5,
				blend = 0,
				width = 70,
				winhl = "PMenu",
			},
			mapping = {
				["run_replace"] = {
					map = "rr",
					cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
					desc = "replace all",
				},
			},
		})
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("SpectreMappings", { clear = true }),
			pattern = "spectre_panel",
			callback = function()
				vim.keymap.set(
					"n",
					"<c-c>",
					":tabclose<CR>",
					{ buffer = 0, noremap = true, silent = true, nowait = true }
				)
			end,
		})
	end,
}
