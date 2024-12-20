-----------------------------------------------------------
-- Auto-Paris
-----------------------------------------------------------
return {
	"windwp/nvim-autopairs",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local nvim_autopairs = require("nvim-autopairs")
		local nvim_autopairs_completion = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")

		nvim_autopairs.setup({
			check_ts = true,
			map_cr = true,
			map_complete = true,
			auto_select = false,
			map_char = {
				all = "(",
				tex = "{",
			},
		})
		cmp.event:on("confirm_done", nvim_autopairs_completion.on_confirm_done())
	end,
}
