-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({
			compile = false,
			terminalColors = true,
			transparent = true,
			dimInactive = false,
			commentStyle = { italic = false },
			keywordStyle = { italic = false },
			statementStyle = { bold = false },
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none",
						},
					},
				},
			},
		})
		-- setup must be called before loading
		require("kanagawa").load("dragon")
	end,
}
