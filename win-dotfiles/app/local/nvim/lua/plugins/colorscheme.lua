-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
return {
  "sainnhe/gruvbox-material",
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_foreground = "mix"
    vim.g.gruvbox_material_float_style = "dim"
    vim.g.gruvbox_material_enable_bold = 0
    vim.g.gruvbox_material_enable_italic = 0
    vim.g.gruvbox_material_disable_italic_comment = 1
    vim.g.gruvbox_material_better_performance = 1
    vim.cmd([[colorscheme gruvbox-material]])
    -- highlight groups:
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
    vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { link = "Comment" })
  end,
}
