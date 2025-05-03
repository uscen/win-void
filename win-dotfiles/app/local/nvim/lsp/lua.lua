--          ╔═════════════════════════════════════════════════════════╗
--          ║                     Lua LSP                             ║
--          ╚═════════════════════════════════════════════════════════╝
return {
  cmd = { "lua-language-server" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        library = { vim.env.VIMRUNTIME, "${3rd}/luv/library" },
      },
      telemetry = {
        enable = false,
      },
    },
  },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", "luarc.lua", ".git" },
}
