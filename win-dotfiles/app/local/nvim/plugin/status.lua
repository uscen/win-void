--          ╔═════════════════════════════════════════════════════════╗
--          ║                       Statusline                        ║
--          ╚═════════════════════════════════════════════════════════╝
M = {}
M.getMode = function()
  local CTRL_S = vim.api.nvim_replace_termcodes("<C-S>", true, true, true)
  local CTRL_V = vim.api.nvim_replace_termcodes("<C-V>", true, true, true)
  local modesTable = {
    ["n"] = { name = "N", hl = "%#MiniStatuslineModeNormal#" },
    ["v"] = { name = "V", hl = "%#MiniStatuslineModeVisual#" },
    ["V"] = { name = "V-LINE", hl = "%#MiniStatuslineModeVisual#" },
    [CTRL_V] = { name = "V-BLOCK", hl = "%#MiniStatuslineModeVisual#" },
    ["s"] = { name = "SEL", hl = "%#MiniStatuslineModeVisual#" },
    ["S"] = { name = "SEL-LINE", hl = "%#MiniStatuslineModeVisual#" },
    [CTRL_S] = { name = "SEL-BLOCK", hl = "%#MiniStatuslineModeVisual#" },
    ["i"] = { name = "I", hl = "%#MiniStatuslineModeInsert#" },
    ["R"] = { name = "R", hl = "%#MiniStatuslineModeReplace#" },
    ["c"] = { name = "CMD", hl = "%#MiniStatuslineModeCommand#" },
    ["r"] = { name = "PROMPT", hl = "%#MiniStatuslineModeOther#" },
    ["!"] = { name = "SH", hl = "%#MiniStatuslineModeOther#" },
    ["t"] = { name = "TERM", hl = "%#MiniStatuslineModeOther#" },
  }
  -- set a default option via metatable
  local modes = setmetatable(modesTable, {
    __index = function()
      return { name = "UNKNOWN", hl = "%#MiniStatuslineModeOther#" }
    end
  })
  return modes[vim.fn.mode()]
end


M.build = function()
  local modeInfo = M.getMode()
  local cwd = string.format("%s %s ", "󰝰", vim.fn.fnamemodify(vim.fn.getcwd(), ":t"))
  local filepath = "󰪷  " .. "%t"
  local filemodifier = "%m%r "
  return table.concat({
    modeInfo.hl,
    " ",
    modeInfo.name,
    " ",

    "%#MiniStatuslineFilename#",
    " ",
    filepath,
    filemodifier,


    "%#MiniStatuslineInactive#",
    "%=", --> spacer


    "%#MiniStatuslineFileinfo#",
    cwd,
  })
end


M.setup = function()
  vim.go.statusline = "%!v:lua.M.build()"
end

return M
