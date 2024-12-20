-----------------------------------------------------------
-- UndoTree:
-----------------------------------------------------------
return {
	"mbbill/undotree",
	event = "VeryLazy",
	keys = {
		{ "<leader>uu", "<cmd>UndotreeToggle<cr>", desc = "Next buffer" },
	},
	cofig = function()
		local undotree = require("undotree")
		undotree.setup()
	end,
}
