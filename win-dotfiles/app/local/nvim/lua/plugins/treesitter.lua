-----------------------------------------------------------
-- nvim-treesitter
-----------------------------------------------------------
return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
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
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<leader>ss",
        node_incremental = "<leader>ss",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
