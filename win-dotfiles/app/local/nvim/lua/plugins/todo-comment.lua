-----------------------------------------------------------
-- todo-comments.nvim
-----------------------------------------------------------
return {
	"folke/todo-comments.nvim",
	cmd = { "TodoTrouble", "TodoTelescope" },
	event = { "BufReadPost", "BufNewFile" },
	config = true,
	keys = {
		{ "<leader>nt", "<cmd>TodoTelescope<cr>", desc = "Todo" },
	},
}
