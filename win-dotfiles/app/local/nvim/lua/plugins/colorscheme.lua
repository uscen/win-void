-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
return {
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		enabled = true,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_background = "medium"
			vim.g.gruvbox_material_inlay_hints_background = "dimmed"
			vim.g.gruvbox_material_float_style = "dim"
			vim.g.gruvbox_material_current_word = "grey background"
			vim.g.gruvbox_material_transparent_background = 0
			vim.g.gruvbox_material_better_performance = 1
			vim.cmd([[
			colorscheme gruvbox-material
			]])
		end,
	},
}
