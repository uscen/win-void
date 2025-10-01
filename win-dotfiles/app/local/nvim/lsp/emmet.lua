--          ╔═════════════════════════════════════════════════════════╗
--          ║                     Html LSP                            ║
--          ╚═════════════════════════════════════════════════════════╝
return {
  cmd = { 'emmet-language-server', '--stdio' },
  filetypes = { 'html', 'ejs', 'css', 'less', 'sass', 'scss', 'javascriptreact', 'typescriptreact', },
  init_options = { showSuggestionsAsSnippets = true, },
  root_markers = { 'package.json', '.git' },
}
