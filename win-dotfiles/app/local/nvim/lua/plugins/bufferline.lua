-----------------------------------------------------------
-- bufferline
-----------------------------------------------------------
return {
	-----------------------------------------------------------
	-- bufdel
	-----------------------------------------------------------
	{
		"ojroques/nvim-bufdel",
		keys = {
			{ "<leader>bd", "<Cmd>BufDel<CR>", desc = "Close Current Buffer" },
			{ "<leader>bo", "<Cmd>BufDelOthers<CR>", desc = "Close Others Buffers" },
			{ "<leader>qq", "<Cmd>BufDelAll<CR>", desc = "Close All Buffers" },
		},
		opts = {
			next = "tabs",
			quit = true,
		},
	},
}
