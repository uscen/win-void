-----------------------------------------------------------
-- Colorscheme:
-----------------------------------------------------------
return {
  'sainnhe/everforest',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.everforest_background                = "hard"
    vim.g.everforest_ui_contrast               = "high"
    vim.g.everforest_float_style               = "dim"
    vim.g.everforest_diagnostic_virtual_text   = "highlighted"
    vim.g.everforest_transparent_background    = 2
    vim.g.everforest_diagnostic_text_highlight = 1
    vim.g.everforest_diagnostic_line_highlight = 1
    vim.g.everforest_dim_inactive_windows      = 1
    vim.g.everforest_better_performans         = 1
    vim.cmd.colorscheme("everforest")
  end
}
