--          ╔═════════════════════════════════════════════════════════╗
--          ║                     Html LSP                            ║
--          ╚═════════════════════════════════════════════════════════╝
return {
  cmd = { "emmet-language-server", "--stdio" },
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "pug",
    "typescriptreact",
  },
  init_options = {
    showSuggestionsAsSnippets = true,
  },
  root_markers = { 'package.json', '.git' }
}
