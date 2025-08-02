--          ╔═════════════════════════════════════════════════════════╗
--          ║                       Statusline                        ║
--          ╚═════════════════════════════════════════════════════════╝
-- a function to obtain and format the file name:==============================================================
local function file_name()
  local filename = vim.fn.expand("%:t")
  if filename == "" then
    filename = "[no name]"
  end
  if string.match(filename, "plugin") then
    filename = "FILE"
  end
  if string.match(filename, "main") then
    filename = "PICKER"
  end
  if vim.bo.buftype == "terminal" then
    filename = "TERMINAL"
  end
  -- change highlight group based on if the file has been modified:=============================================
  local highlight_group = vim.bo.modified and filename ~= "[no name]" and "statusline_modifiedfile" or "statusline_file"
  return "%#" .. highlight_group .. "# " .. filename .. " "
end

-- a function to obtain file type:============================================================================
local function filetype()
  local ft = string.format(" %s ", vim.bo.filetype):upper()
  return "%#statusline_filetype#" .. ft .. "%*"
end

-- a function to obtain and format the current mode::========================================================
local function current_mode()
  local mode = vim.fn.mode()
  local mode_aliases = {
    n = "no",
    i = "in",
    v = "vi",
    V = "vl",
    t = "te",
    c = "co",
    s = "se",
    [""] = "vb",
  }
  mode = mode and mode_aliases[mode] and mode_aliases[mode]:upper() or "?"
  return "%#statusline_mode# " .. mode .. " "
end

-- a function to obtain and format the diagnostics:=========================================================
local function diagnostics()
  local icons = {
    error = " ",
    warn = " ",
    info = " ",
    hint = " ",
  }
  local result = {}
  local num_warn = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN  })
  local num_error   = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local num_hint    = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT  })
  local num_info    = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO  })
  if num_error > 0 then
    table.insert(result, "%#DiagnosticError#" .. icons.error .. num_error)
  end
  if num_warn > 0 then
    table.insert(result, "%#DiagnosticWarn#" .. icons.warn .. num_warn)
  end
  if num_hint > 0 then
    table.insert(result, "%#DiagnosticHint#" .. icons.hint .. num_hint)
  end
  if num_info > 0 then
    table.insert(result, "%#DiagnosticInfo#" .. icons.info .. num_info)
  end
  return #result > 0 and "%#statusline_diagnostics# " .. table.concat(result, " ") .. " " or ""
end

-- a function to display the current search position:=========================================================
local function search_position()
  local ok, result = pcall(vim.fn.searchcount, { maxcount = 999, timeout = 500 })
  if not ok or result.total == 0 then
    return ""
  end
  return "%#statusline_misc# " .. vim.fn.getreg("/") .. " [" .. result.current .. "/" .. result.total .. "] "
end

-- a function to assign highlight group to the separator====================================================
local function separator()
  local highlight_group = "statusline_separator"
  return "%#" .. highlight_group .. "#%="
end

local function miscellaneous()
  local reg = vim.fn.reg_recording()
  if reg == "" then
    return search_position()
  else
    return "%#statusline_misc# recording @" .. reg
  end
end

-- a function to call and place the statusline components:==================================================
function Status_line()
  return table.concat({
    current_mode(),
    file_name(),
    diagnostics(),
    separator(),
    miscellaneous(),
    filetype()
  })
end

-- default with statusline but can be toggled with <leader>st:===============================================
vim.opt["laststatus"] = 3
vim.keymap.set( "n", "<leader>st",
  function()
    if vim.o.laststatus == 0 then
      vim.cmd("set laststatus=3")
    else
      vim.cmd("set laststatus=0")
    end
  end
)

vim.cmd("set statusline=%!v:lua.Status_line()")
vim.cmd([[
  augroup Statusline
    au!
    au WinEnter,BufEnter * setlocal cursorline
    au WinLeave,BufLeave * setlocal nocursorline
]])

-- set colors for each statusline components:==============================================================
local group_styles = {
  ["statusline_separator"]        = { fg = "#1e2527", bg = "NONE" },
  ["statusline_diagnostics"]      = { fg = "#cacaca", bg = "#141b1e" },
  ["statusline_file"]             = { fg = "#cacaca", bg = "#1e2527", bold = true },
  ["statusline_mode"]             = { fg = "#b3b9b8", bg = "#404749", bold = true },
  ["statusline_filetype"]         = {link = "statusline_mode"},
  ["statusline_modifiedfile"]     = { link = "statusline_file" },
  ["statusline_misc"]             = {link = "statusline_file"},
}
for group, style in pairs(group_styles) do
  vim.api.nvim_set_hl(0, group, style)
end
