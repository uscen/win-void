-----------------------------------------------------------
-- nvim-treesitter
-----------------------------------------------------------
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  opts = {
    ensure_installed = {
      -- 'base',
      "powershell",
      "python",
      "bash",
      "nu",
      "c",
      "jq",
      "json",
      "jsdoc",
      "vim",
      "vimdoc",
      "lua",
      "luadoc",
      "regex",
      "diff",
      "query",
      "printf",
      "toml",
      "yaml",
      "xml",
      "markdown",
      "markdown_inline",
      "git_config",
      "git_rebase",
      "gitcommit",
      "gitignore",
      "gitattributes",
      -- 'fullstack'
      "javascript",
      "typescript",
      "tsx",
      "html",
      "css",
      "prisma",
      "scss",
    },
    highlight = { enable = true },
    indent = { enable = true },
    textobjects = { enable = false },
    incremental_selection = { enable = false },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
