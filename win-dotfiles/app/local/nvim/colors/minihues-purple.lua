--          ╔═════════════════════════════════════════════════════════╗
--          ║                       minihues-purple                   ║
--          ╚═════════════════════════════════════════════════════════╝
local hues = require("mini.hues")
local opts = {
  accent = "purple",
  background = "#151025",
  foreground = "#B6BCBF",
}
hues.setup(opts)
vim.g.colors_name = "minihues-purple"
