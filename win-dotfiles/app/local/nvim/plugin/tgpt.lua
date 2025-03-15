--          ╔═════════════════════════════════════════════════════════╗
--          ║                       Tgpt Ai                           ║
--          ╚═════════════════════════════════════════════════════════╝
-- Helpers to create a buffer and open a window
local state = {
  buf = nil,
  win = nil,
  job_id = nil
}

-- Create window Buffer in bottom placement
local createBuffer = function()
  if state.win and vim.api.nvim_win_is_valid(state.win) then
    vim.api.nvim_win_close(state.win, true)
  end

  local WIDTH = vim.api.nvim_get_option("columns")
  local HEIGHT = vim.api.nvim_get_option("lines")

  state.buf = vim.api.nvim_create_buf(false, true)
  state.win = vim.api.nvim_open_win(state.buf, true, {
    relative = 'editor',
    width = math.floor(WIDTH * 0.8),
    height = math.floor(HEIGHT * 0.3),
    col = math.floor((WIDTH - (WIDTH * 0.8)) / 2),
    row = HEIGHT - 1,
    anchor = 'SW',
    style = 'minimal',
    border = 'rounded'
  })

  vim.api.nvim_win_set_option(state.win, 'wrap', true)
  vim.api.nvim_win_set_option(state.win, 'number', false)
  vim.api.nvim_win_set_option(state.win, 'relativenumber', false)
end

-- Function for interactive chat
local InteractiveChat = function()
  createBuffer()
  vim.api.nvim_command("startinsert")
  vim.fn.termopen("tgpt -i", {
    on_exit = function()
      local win_id = vim.api.nvim_get_current_win()
      vim.api.nvim_win_close(win_id, true)
    end
  })
end

-- Function to rate the code in the current buffer
local RateMyCode = function()
  local file = vim.api.nvim_buf_get_name(0)
  local prompt = "cat " .. file .. " | tgpt 'Rate the code' "
  createBuffer()
  vim.fn.termopen(prompt)
end

-- Function to check for bugs in the current buffer
local CheckForBugs = function()
  local file = vim.api.nvim_buf_get_name(0)
  local prompt = "cat " .. file .. " | tgpt 'Check for bugs' "
  createBuffer()
  vim.fn.termopen(prompt)
end

-- Check if tgpt is installed and set up commands
local result = vim.fn.executable("tgpt")
if result == 1 then
  vim.api.nvim_create_user_command("Chat", InteractiveChat, { nargs = 0 })
  vim.api.nvim_create_user_command("RateMyCode", RateMyCode, { nargs = 0 })
  vim.api.nvim_create_user_command("CheckForBugs", CheckForBugs, { nargs = 0 })
else
  print(
    "[tgpt.nvim] tgpt is not installed on your system\nplease visit the tgpt GitHub page for instructions: https://github.com/aandrew-me/tgpt")
end
