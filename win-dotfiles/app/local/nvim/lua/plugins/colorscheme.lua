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
			vim.cmd([[
			colorscheme gruvbox-material
			]])
		end,
	},
}
