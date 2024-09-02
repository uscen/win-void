-----------------------------------------------------------
-- Maximize Window
-----------------------------------------------------------
return {
	"szw/vim-maximizer",
	event = "VeryLazy",
	keys = {
		{ "<leader>wm", "<cmd>MaximizerToggle<CR>", { desc = "Maximize current window" } },
	},
}
