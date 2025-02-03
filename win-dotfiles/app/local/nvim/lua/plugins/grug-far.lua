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
				require("grug-far").open({
					prefills = { paths = vim.fn.expand("%"), search = vim.fn.expand("<cword>") },
				})
			end,
			mode = { "n", "v" },
			desc = "Search And Replace Select Word In Current Buffer",
		},
		{
			"<leader>rv",
			function()
				require("grug-far").with_visual_selection({ prefills = { paths = vim.fn.expand("%") } })
			end,
			mode = { "n", "v" },
			desc = "Search And Replace Visual Selection In Current Buffer",
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
			desc = "Search And Replace",
		},
	},
	config = function()
		require("grug-far").setup({
			keymaps = {
				replace = { n = "<c-r>,", i = "<c-r>" },
				close = { n = "<c-c>", i = "<c-c>" },
			},
		})
	end,
}
