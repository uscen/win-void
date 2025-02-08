-----------------------------------------------------------
-- Mini-Pick
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
      desc = "Find File",
    },
    {
      "<leader>fb",
      function()
        require('mini.pick').builtin.buffers()
      end,
      desc = "Find Buffer",
    },
    {
      "<leader>fg",
      function()
        require('mini.pick').builtin.grep_live()
      end,
      desc = "Find Word",
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
