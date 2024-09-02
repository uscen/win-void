-----------------------------------------------------------
--  Markdown Glow
-----------------------------------------------------------
return {
	"ellisonleao/glow.nvim",
	cmd = { "Glow" },
	keys = {
		{ "<leader>m", "<cmd>Glow<cr>:resize +1000<cr>:vertical resize +1000<cr>", desc = "Prev buffer" },
	},
	init = function() -- Specifies code to run before this plugin is loaded.
		local style = nil
		if vim.g.style == "light" then
			style = "light"
		else
			style = "dark"
		end
		require("glow").setup({
			style = style,
			border = "rounded",
			width = vim.fn.winwidth(0),
		})
	end,
}
