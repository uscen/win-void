-----------------------------------------------------------
-- resession
-----------------------------------------------------------
return {
	"stevearc/resession.nvim",
	opts = {},
	config = function()
		local resession = require("resession")
		resession.setup({
			autosave = {
				enabled = true,
				interval = 60,
				notify = true,
			},
		})
		-- Resession does NOTHING automagically, so we have to set up some keymaps
		vim.keymap.set("n", "<leader>qs", resession.save)
		vim.keymap.set("n", "<leader>ql", resession.load)
		vim.keymap.set("n", "<leader>qd", resession.delete)
	end,
}
