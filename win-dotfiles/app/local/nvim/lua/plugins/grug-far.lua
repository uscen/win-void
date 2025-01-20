-----------------------------------------------------------
-- Spectre
-----------------------------------------------------------
return {
	"MagicDuck/grug-far.nvim",
	opts = { headerMaxWidth = 80 },
	cmd = "GrugFar",
	keys = {
		{
			"<leader>rs",
			function()
				require("grug-far").grug_far({
					prefills = { search = vim.fn.expand("<cword>"), flags = vim.fn.expand("%") },
				})
			end,
			mode = { "n", "v" },
			desc = "Search and Replace",
		},
		{
			"<leader>rr",
			function()
				local grug = require("grug-far")
				local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
				grug.open({
					transient = true,
					prefills = {
						filesFilter = ext and ext ~= "" and "*." .. ext or nil,
					},
				})
			end,
			mode = { "n", "v" },
			desc = "Search and Replace",
		},
	},
	config = function()
		require("grug-far").setup({
			keymaps = {
				close = { n = "<c-c>", i = "<c-c>" },
			},
		})
	end,
}
