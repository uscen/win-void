-----------------------------------------------------------
-- Completions
-----------------------------------------------------------
local cmp = require("cmp")
return {
  "hrsh7th/nvim-cmp",
  opts = {
    completion = {
      autocomplete = false,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
    }),
  },
}
