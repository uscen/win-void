-----------------------------------------------------------
-- Editor
-----------------------------------------------------------
return {
  -----------------------------------------------------------
  -- nvim-treesitter
  -----------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        -- 'base',
        "lua",
        "luadoc",
        "query",
        "c",
        "cpp",
        "markdown",
        "markdown_inline",
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "gitattributes",
        "diff",
        "vim",
        "vimdoc",
        "regex",
        "bash",
        "powershell",
        "toml",
        "xml",
        "yaml",
        "ssh_config",
        "zathurarc",
        "jq",
        "json",
        "json5",
        "printf",
        "ini",
        "nu",
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
      auto_install = true,
      context_commentstring = { enable = true, enable_autocmd = true },
      matchup = { enable = true, include_match_words = true, enable_quotes = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>ss",
          node_incremental = "<leader>si",
          scope_incremental = "<leader>sc",
          node_decremental = "<leader>sd",
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
