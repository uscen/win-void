--------------------------------------------------
-- Border Style:
--------------------------------------------------
require("full-border"):setup({
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.PLAIN,
})
--------------------------------------------------
-- Search Jump Aka Flash:
--------------------------------------------------
require("searchjump"):setup({
	opt_unmatch_fg = "#282828",
	opt_match_str_fg = "#141617",
	opt_match_str_bg = "#a9b665",
	opt_lable_fg = "#ebdbb2",
	opt_lable_bg = "#d8a657",
})
--------------------------------------------------
-- Git integrations:
--------------------------------------------------
require("git"):setup()
--------------------------------------------------
-- Starship integrations
--------------------------------------------------
require("starship"):setup()
--------------------------------------------------
-- Disable Status:
--------------------------------------------------
require("no-status"):setup()
