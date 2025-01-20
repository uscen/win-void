-----------------------------------------------------------
--  Leap AutoJumps
-----------------------------------------------------------
return {
	{
		"ggandor/leap.nvim",
		event = "VeryLazy",
		config = function()
			-- vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
			vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
			vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")
			vim.keymap.set({ "n", "x", "o" }, "gA", function()
				require("leap.treesitter").select()
			end)
			-- Linewise.
			vim.keymap.set({ "n", "x", "o" }, "ga", 'V<cmd>lua require("leap.treesitter").select()<cr>')
		end,
	},
}
