-----------------------------------------------------------
-- Fun Effect
-----------------------------------------------------------
return {
	---- > 🍁 Fun little plugin that can be used as a screensaver and on your dashboard
	"folke/drop.nvim",
	event = "VimEnter",
	ft = { "dashboard" },
	config = function()
		if not vim.g.neovide then
			require("drop").setup({
				theme = "leaves",
				max = 10,
				interval = 250,
				screensaver = 1000 * 60 * 15,
				filetypes = { "dashboard", "alpha", "starter" },
			})
		end
	end,
}
