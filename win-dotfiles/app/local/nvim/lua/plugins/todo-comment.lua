-----------------------------------------------------------
-- todo-comments.nvim
-----------------------------------------------------------
return {
	"folke/todo-comments.nvim",
	cmd = { "TodoTrouble", "TodoTelescope" },
	event = { "BufReadPost", "BufNewFile" },
	enabled = false,
	config = true,
	keys = {
		{ "<leader>nt", "<cmd>TodoTelescope<cr>", desc = "Todo" },
	},
}
