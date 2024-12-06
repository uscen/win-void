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
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_float_style = "dim"
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
}
