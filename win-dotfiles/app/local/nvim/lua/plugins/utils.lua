-----------------------------------------------------------
-- Utils:
-----------------------------------------------------------
return {
  -----------------------------------------------------------
  -- rainbow-delimiters.nvim
  -----------------------------------------------------------
  {
    "hiphish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
  },
  -----------------------------------------------------------
  -- tailwind-fold.nvim:
  -----------------------------------------------------------
  {
    "razak17/tailwind-fold.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    keys = {
      { "<leader>lt", "<cmd>TailwindFoldToggle<cr>", desc = "Toggle TailwindCss Fold" },
    },
    opts = {}
  },
}
