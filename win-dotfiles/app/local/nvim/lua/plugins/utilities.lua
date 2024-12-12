-----------------------------------------------------------
-- tailwind-fold.nvim:
-----------------------------------------------------------
return {
	"razak17/tailwind-fold.nvim",
	opts = {},
	keys = {
		{ "<leader>lt", "<cmd>TailwindFoldToggle<cr>", desc = "Open Lazy Git" },
	},
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	event = "VeryLazy",
	config = function()
		require("tailwind-fold").setup({
			symbol = "…",
			highlight = {
				fg = "#38BDF8",
			},
			ft = {
				"html",
				"svelte",
				"astro",
				"vue",
				"typescriptreact",
				"javascriptreact",
				"php",
				"blade",
				"tsx",
				"eruby",
				"edge",
				"htmldjango",
			},
		})
	end,
}
