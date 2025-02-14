-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
return {
  "neanias/everforest-nvim",
  config = function()
    require("everforest").setup({
      background = "hard",
      transparent_background_level = 2,
      disable_italic_comments = true,
    })
    vim.cmd([[colorscheme everforest]])
    -- Change Highlighted Groups:
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "MiniTablineFill", { link = "Normal" })
    vim.api.nvim_set_hl(0, "MiniTablineCurrent", { link = "NormalFloat" })
    vim.api.nvim_set_hl(0, "MiniTablineVisible", { link = "Comment" })
    vim.api.nvim_set_hl(0, "MiniTablineHidden", { link = "Comment" })
  end
}
