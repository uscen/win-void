--          ╔═════════════════════════════════════════════════════════╗
--          ║                       minihues-charcoal                 ║
--          ╚═════════════════════════════════════════════════════════╝
local hues = require("mini.hues")
local opts = {
  accent = "azure",
  background = "#181A1F",
  foreground = "#A9B2C3",
}
hues.setup(opts)
vim.g.colors_name = "minihues-charcoal"
