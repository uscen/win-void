-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
return {
  "sainnhe/everforest",
  config = function()
    vim.g.everforest_background                = "hard"
    vim.g.everforest_ui_contrast               = "high"
    vim.g.everforest_float_style               = "dim"
    vim.g.everforest_diagnostic_virtual_text   = "highlighted"
    vim.g.everforest_transparent_background    = 2
    vim.g.everforest_diagnostic_text_highlight = 1
    vim.g.everforest_diagnostic_line_highlight = 1
    vim.g.everforest_disable_italic_comment    = 1
    vim.g.everforest_dim_inactive_windows      = 1
    vim.g.everforest_better_performans         = 1
    vim.cmd.colorscheme("everforest")
    -- Change Highlighted Groups:
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "MiniTablineFill", { link = "Normal" })
    vim.api.nvim_set_hl(0, "MiniTablineCurrent", { link = "NormalFloat" })
    vim.api.nvim_set_hl(0, "MiniTablineVisible", { link = "Comment" })
    vim.api.nvim_set_hl(0, "MiniTablineHidden", { link = "Comment" })
  end
}
