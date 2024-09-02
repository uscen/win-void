-----------------------------------------------------------
-- Mason
-----------------------------------------------------------
return {
  -----------------------------------------------------------
  -- mason.nvim
  -----------------------------------------------------------
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ui = {
        icons = {
          package_installed = "",
          package_pending = "",
          package_uninstalled = "",
        },
      },
      log_level = vim.log.levels.OFF,
    },
  },
  -----------------------------------------------------------
  -- mason-lspconfig.nvim
  -----------------------------------------------------------
  {
    "williamboman/mason-lspconfig.nvim",
    cmd = { "LspInstall", "LspUninstall" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        "somesass_ls",
        "emmet_ls",
        "tsserver",
        "tailwindcss",
        "jsonls",
        "bashls",
        "pyright",
      },
    },
  },
}
