-----------------------------------------------------------
-- Mini-Paris
-----------------------------------------------------------
return {
  'echasnovski/mini.pick',
  version = '*',
  keys = {
    {
      "<leader>ff",
      function()
        require('mini.pick').builtin.files()
      end,
      mode = { "n", "v" },
      desc = "Find File",
    },
    {
      "<leader>fb",
      function()
        require('mini.pick').builtin.buffers()
      end,
      mode = { "n", "v" },
      desc = "Find File",
    },
  },
  opts = {
    mappings = {
      choose           = '<Tab>',
      move_down        = '<C-j>',
      move_up          = '<C-k>',
      choose_in_split  = '<C-v>',
      choose_in_vsplit = '<C-b>',
      toggle_preview   = '<C-p>',
    },
  }
}
