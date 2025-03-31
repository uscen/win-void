--          ╔═════════════════════════════════════════════════════════╗
--          ║                     Emmet LSP                           ║
--          ╚═════════════════════════════════════════════════════════╝
return {
  cmd = { "emmet-language-server", "--stdio" },
  filetypes = {
    'css',
    'eruby',
    'html',
    'htmldjango',
    'javascriptreact',
    'less',
    'pug',
    'sass',
    'scss',
    'typescriptreact',
    'htmlangular',
  },
  init_options = {
    showSuggestionsAsSnippets = true,
  },
  root_markers = { 'package.json', '.git' }
}
