--------------------------------------------------
-- Border Style:
--------------------------------------------------
require("full-border"):setup({
  -- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
  type = ui.Border.PLAIN,
})
--------------------------------------------------
-- Starship:
--------------------------------------------------
require("starship"):setup({
  hide_flags = false,
  flags_after_prompt = true,
  config_file = "~/.config/starship.toml",
})
--------------------------------------------------
-- Git integrations:
--------------------------------------------------
require("git"):setup()
--------------------------------------------------
-- Disable Status:
--------------------------------------------------
require("no-status"):setup()
