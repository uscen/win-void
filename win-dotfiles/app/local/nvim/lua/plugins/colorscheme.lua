-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
return {
	"sainnhe/gruvbox-material",
	priority = 1000,
	config = function()
		vim.g.gruvbox_material_background = "hard"
		vim.g.gruvbox_material_foreground = "mix"
		vim.g.gruvbox_material_enable_bold = false
		vim.g.gruvbox_material_enable_italic = false
		vim.g.gruvbox_material_disable_italic_comment = true
		vim.g.gruvbox_material_better_performance = true
		vim.cmd([[colorscheme gruvbox-material]])
		-- Mini-Tabline highlight groups
		vim.api.nvim_set_hl(0, "MiniTablineCurrent", { bg = "#1d2021" })
		vim.api.nvim_set_hl(0, "MiniTablineVisible", { link = "Normal" })
		vim.api.nvim_set_hl(0, "MiniTablineHidden", { link = "Comment" })
		vim.api.nvim_set_hl(0, "MiniTablineFill", { link = "Normal" })
		vim.api.nvim_set_hl(0, "MiniTablineTabpagesection", { link = "Comment" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", { link = "Comment" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible", { link = "Comment" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", { link = "Comment" })
		-- Others highlight groups
		vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
		vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
		vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
		vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
		vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { link = "Comment" })
	end,
}
