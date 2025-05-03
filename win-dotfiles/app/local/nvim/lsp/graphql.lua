--          ╔═════════════════════════════════════════════════════════╗
--          ║                       Ggraphql LSP                      ║
--          ╚═════════════════════════════════════════════════════════╝
return {
  cmd = { "graphql-lsp", "server", "-m", "stream" },
  filetypes = { "graphql", "typescriptreact", "javascriptreact" },
  single_file_support = true,
}
