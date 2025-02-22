return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_ui_contrast = "high"
    vim.g.gruvbox_material_float_style = "dim"
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_dim_inactive_windows = 1
    vim.g.gruvbox_material_colors_override = {
      bg0 = { '#141617', '234' },
      bg2 = { '#1b1b1b', '235' }
    }
    vim.cmd.colorscheme('gruvbox-material')
  end
}
