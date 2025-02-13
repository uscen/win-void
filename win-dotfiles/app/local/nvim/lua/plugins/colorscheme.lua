-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
return {
  "ellisonleao/gruvbox.nvim",
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
    -- Change Highlighted Groups:
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "MiniTablineFill", { link = "Normal" })
    vim.api.nvim_set_hl(0, "MiniTablineCurrent", { link = "NormalFloat" })
    vim.api.nvim_set_hl(0, "MiniTablineVisible", { link = "Comment" })
    vim.api.nvim_set_hl(0, "MiniTablineHidden", { link = "Comment" })
  end
}
