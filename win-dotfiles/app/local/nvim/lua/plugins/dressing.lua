-----------------------------------------------------------
-- Dressings
-----------------------------------------------------------
return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("dressing").setup({
			select = {
				telescope = require("telescope.themes").get_dropdown({
					borderchars = {
						prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
						results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
						preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					},
				}),
			},
			input = {
				border = "single",
			},
		})
	end,
}
