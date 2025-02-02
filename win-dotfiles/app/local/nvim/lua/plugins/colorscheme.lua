-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
return {
	"sainnhe/gruvbox-material",
	priority = 1000,
	config = function()
		vim.g.gruvbox_material_background = "hard"
		vim.g.gruvbox_material_foreground = "mix"
		vim.g.gruvbox_material_float_style = "dim"
		vim.g.gruvbox_material_enable_bold = false
		vim.g.gruvbox_material_enable_italic = false
		vim.g.gruvbox_material_disable_italic_comment = true
		vim.g.gruvbox_material_better_performance = true
		vim.cmd([[colorscheme gruvbox-material]])
		-- highlight groups:
		vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
		vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { link = "Comment" })
	end,
}
