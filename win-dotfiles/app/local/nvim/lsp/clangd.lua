--          ╔═════════════════════════════════════════════════════════╗
--          ║                     Clang LSP                           ║
--          ╚═════════════════════════════════════════════════════════╝
return {
  cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
  filetypes = { "c", "cpp" },
  root_markers = { ".git", "compile_commands.json" },
  init_options = {
    fallbackFlag = { "-std=c++17" },
  },
  settings = {},
}
