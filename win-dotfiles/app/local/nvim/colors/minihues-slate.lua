--          ╔═════════════════════════════════════════════════════════╗
--          ║                       minihues-slate                    ║
--          ╚═════════════════════════════════════════════════════════╝
local hues = require("mini.hues")
local opts = {
  accent = "azure",
  background = "#1a2331",
  foreground = "#c3c7cd",
}
hues.setup(opts)
vim.g.colors_name = "minihues-slate"
