-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      contrast = "hard",
      bold = false,
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
    })
    vim.cmd("colorscheme gruvbox")
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
  end,
}
