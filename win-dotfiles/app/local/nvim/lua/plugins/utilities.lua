-----------------------------------------------------------
-- tailwind-fold.nvim:
-----------------------------------------------------------
return {
	"razak17/tailwind-fold.nvim",
	keys = {
		{ "<leader>lt", "<cmd>TailwindFoldToggle<cr>", desc = "Toggle TailwindFoldToggle" },
	},
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	event = "VeryLazy",
	config = function()
		require("tailwind-fold").setup({
			symbol = "…",
			highlight = {
				fg = "#89b482",
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
