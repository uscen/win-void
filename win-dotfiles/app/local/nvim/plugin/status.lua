--          ╔═════════════════════════════════════════════════════════╗
--          ║                       Statusline                        ║
--          ╚═════════════════════════════════════════════════════════╝
-- Speartor: ==================================================================================================
local fade_start = "█▓▒░ "
local fade_end   = " ░▒▓█"

-- Function to add padding to both sides of a string:=========================================================
local function pad_string(str, left_pad, right_pad)
  local left = string.rep(" ", left_pad or 0)
  local right = string.rep(" ", right_pad or 0)
  return left .. str .. right
end

-- a function to obtain and format the file name:==============================================================
local function file_name()
  local filename = string.format(vim.fn.expand("%:t")):upper()
  if filename == "" then
    filename = "[NO NAME]"
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
  return "%#" .. highlight_group .. "# " .. pad_string(filename, 4,4) .. " " .. "%#StatuslineFade1#".. fade_end
end

-- a function to obtain file type:============================================================================
local function filetype()
  local ft = string.format(" %s ", vim.bo.filetype):upper()
  return "%#StatuslineFade#".. fade_start .. "%#statusline_filetype#" .. pad_string(ft, 1,4) .. "%*"
end

-- a function to obtain and format the current mode::========================================================
local function current_mode()
  local mode = vim.fn.mode()
  local mode_aliases = {
    n = "normal",
    i = "insert",
    t = "terminal",
    c = "command",
    s = "serch",
    v = "visual",
    V = "visual_line",
    [""] = "visual_block",
  }
  mode = mode and mode_aliases[mode] and mode_aliases[mode]:upper() or "?"
  return "%#statusline_mode#" .. pad_string(mode, 4,1) .. " " .. "%#StatuslineFade#".. fade_end
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
    table.insert(result, "%#DiagnosticError#" .. pad_string(icons.error .. num_error, 1, 1))
  end
  if num_warn > 0 then
    table.insert(result, "%#DiagnosticWarn#" .. pad_string(icons.warn .. num_warn, 1, 1))
  end
  if num_hint > 0 then
    table.insert(result, "%#DiagnosticHint#" .. pad_string(icons.hint .. num_hint, 1, 1))
  end
  if num_info > 0 then
    table.insert(result, "%#DiagnosticInfo#" .. pad_string(icons.info .. num_info, 1, 1))
  end
  return #result > 0 and "%#statusline_diagnostics# " .. table.concat(result, " ") .. " " or ""
end

-- a function to display the current search position:=========================================================
local function search_position()
  local ok, result = pcall(vim.fn.searchcount, { maxcount = 999, timeout = 500 })
  if not ok or result.total == 0 then
    return ""
  end
  return "%#StatuslineFade1#".. fade_start .. "%#statusline_misc# " .. pad_string(vim.fn.getreg("/"), 4,1) .. " [" .. result.current .. "/" .. result.total .. pad_string("] ", 0,4)
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
  ["Statusline"]                  = { fg = "#1e2527", bg = "#141b1e" },
  ["statusline_diagnostics"]      = { fg = "#cacaca", bg = "#141b1e" },
  ["statusline_file"]             = { fg = "#8ccf7e", bg = "#1e2527", bold = true },
  ["statusline_mode"]             = { fg = "#1e2527", bg = "#8ccf7e", bold = true },
  ["StatuslineFade"]              = { fg = "#1e2527", bg = "#8ccf7e", bold = true },
  ["StatuslineFade1"]              = { fg = "#141b1e", bg = "#1e2527", bold = true },
  ["statusline_separator"]        = {link = "Statusline"},
  ["statusline_filetype"]         = {link = "statusline_mode"},
  ["statusline_modifiedfile"]     = { link = "statusline_file" },
  ["statusline_misc"]             = {link = "statusline_file"},
}
for group, style in pairs(group_styles) do
  vim.api.nvim_set_hl(0, group, style)
end
