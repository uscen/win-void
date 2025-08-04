--          ╔═════════════════════════════════════════════════════════╗
--          ║                       Statusline                        ║
--          ╚═════════════════════════════════════════════════════════╝
-- global: ======================================================================================================
local fade_start = "▓▒░"
local fade_end = "░▒▓"
local filetype_icons = {
  ["typescript"] = "",
  ["javascript"] = "",
  ["javascriptreact"] = "",
  ["typescriptreact"] = "",
  ["svelte"] = "",
  ["python"] = "",
  ["java"] = "",
  ["html"] = "",
  ["css"] = "",
  ["scss"] = "",
  ["php"] = "",
  ["kotlin"] = "",
  ["markdown"] = "",
  ["sh"] = "",
  ["zsh"] = "",
  ["vim"] = "",
  ["rust"] = "",
  ["c"] = "",
  ["cpp"] = "",
  ["cs"] = "",
  ["go"] = "",
  ["lua"] = "",
  ["conf"] = "",
  ["haskell"] = "",
  ["ruby"] = "",
  ["file"] = "",
}
local function pad_string(str, left_pad, right_pad)
  local left = string.rep(" ", left_pad or 0)
  local right = string.rep(" ", right_pad or 0)
  return left .. str .. right
end
-- a function to obtain file type: =================================================================================
local function filetype()
  local ft = vim.bo.filetype
  local ft_icons_or_name = filetype_icons[ft] and filetype_icons[ft] or ""
  return "%#StatuslineFade#".. fade_start .. "%#statusline_filetype#" .. pad_string(ft_icons_or_name, 1,3) .. "%*"
end
-- a function to obtain and format the file name: ==================================================================
local function file_name()
  local filename = string.format(vim.fn.expand("%:t"))
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
  -- change highlight group based on if the file has been modified: =============================================
  local highlight_group = vim.bo.modified and filename ~= "[no name]" and "statusline_modifiedfile" or "statusline_file"
  local modified_indicator = vim.bo.modified and '' or " "
  return "%#" .. highlight_group .. "# " .. pad_string(filetype_icons["file"], 2, 1) ..  pad_string(filename, 1,1).. modified_indicator .. " " .. "%#StatuslineFade1#".. fade_start
end
-- a function to obtain and format the current mode: ===========================================================
local function current_mode()
  local mode = vim.fn.mode()
  local mode_aliases = {
    ["n"] = "N",
    ["no"] = "N",
    ["v"] = "V",
    ["V"] = "VL",
    [""] = "VB",
    ["s"] = "S",
    ["S"] = "SL",
    [""] = "SB",
    ["i"] = "I",
    ["ic"] = "I",
    ["R"] = "R",
    ["Rv"] = "VR",
    ["c"] = "C",
    ["cv"] = "EX",
    ["ce"] = "X",
    ["r"] = "P",
    ["rm"] = "M",
    ["r?"] = "C",
    ["!"] = "SH",
    ["t"] = "T",
  }
  mode = mode and mode_aliases[mode] and mode_aliases[mode]:upper() or "?"
  return "%#statusline_mode#" .. pad_string(mode, 2,1) .. " " .. "%#StatuslineFade#".. fade_end
end
-- a function to obtain and format the LSP: ====================================================================
local function stbufnr()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end
local function lsp()
  if rawget(vim, "lsp") then
    for _, client in ipairs(vim.lsp.get_clients()) do
      if client.attached_buffers[stbufnr()] and client.name ~= "mini.snippets" then
        return "%#StatuslineFade1#".. fade_end .. "%#statusline_misc#" .. pad_string("   [LSP]", 1, 2)
      end
    end
  end
  return "%#StatuslineFade1#".. fade_end .. "%#statusline_misc# " .. pad_string(" [NOLSP]", 1, 2)
end
-- a function to assign highlight group to the separator: ======================================================
local function separator()
  local highlight_group = "statusline_separator"
  return "%#" .. highlight_group .. "#%="
end
-- a function to call and place the statusline components: =====================================================
function Status_line()
  local curr_ft = vim.bo.filetype
  local disabled_filetypes = {
    "ministarter",
  }
  if vim.tbl_contains(disabled_filetypes, curr_ft) then
    return nil
  end
  return table.concat({
    current_mode(),
    file_name(),
    separator(),
    lsp(),
    filetype()
  })
end
-- default with statusline but can be toggled with <leader>st: ================================================
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
-- set colors for each statusline components: =================================================================
local group_styles = {
  ["Statusline"]                  = { fg = "#181616", bg = "#181616" },
  ["statusline_diagnostics"]      = { fg = "#c5c9c5", bg = "#141b1e" },
  ["statusline_file"]             = { fg = "#8a9a7b", bg = "#201d1d", bold = true },
  ["statusline_mode"]             = { fg = "#181616", bg = "#8a9a7b", bold = true },
  ["StatuslineFade"]              = { fg = "#201d1d", bg = "#8a9a7b", bold = true },
  ["StatuslineFade1"]             = { fg = "#201d1d", bg = "#181616", bold = true },
  ["statusline_separator"]        = {link = "Statusline"},
  ["statusline_filetype"]         = {link = "statusline_mode"},
  ["statusline_modifiedfile"]     = { link = "statusline_file" },
  ["statusline_misc"]             = {link = "statusline_file"},
}
for group, style in pairs(group_styles) do
  vim.api.nvim_set_hl(0, group, style)
end
