-----------------------------------------------------------
-- colorscheme:
-----------------------------------------------------------
return {
  "rebelot/kanagawa.nvim",
  config = function()
    require('kanagawa').setup({
      transparent = true,
      overrides = function()
        return {
          FloatBorder = { bg = "NONE" },
          NormalFloat = { bg = "NONE" },
          CursorLine = { bg = "#252535" },
        }
      end,
    })
    vim.cmd("colorscheme kanagawa-dragon")
  end
}
