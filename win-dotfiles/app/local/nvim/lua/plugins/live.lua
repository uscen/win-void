-----------------------------------------------------------
--  Live Server
-----------------------------------------------------------
return {
	"barrett-ruth/live-server.nvim",
	build = "npm install -g live-server",
	cmd = { "LiveServerToggle", "LiveServerStart", "LiveServerStop" },
	keys = {
		{ "<leader>lt", "<Cmd>LiveServerToggle<CR>", desc = "Toggle Live Server" },
	},
	config = true,
}
