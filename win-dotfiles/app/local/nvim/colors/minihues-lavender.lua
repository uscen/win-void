--          ╔═════════════════════════════════════════════════════════╗
--          ║                       minihues-lavender                 ║
--          ╚═════════════════════════════════════════════════════════╝
local hues = require("mini.hues")
local opts = {
  accent = "azure",
  background = "#232030",
  foreground = "#c7c6cd",
}
hues.setup(opts)
vim.g.colors_name = "minihues-lavender"
