-----------------------------------------------------------
--  Leap AutoJumps
-----------------------------------------------------------
return {
	{
		"ggandor/leap.nvim",
		event = "VeryLazy",
		config = function()
			vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
			vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
			vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")
		end,
	},
	{
		"ggandor/flit.nvim",
		config = function()
			require("flit").setup({
				keys = { f = "f", F = "F", t = "t", T = "T" },
				labeled_modes = "v",
				multiline = false,
				opts = {},
			})
		end,
	},
}
