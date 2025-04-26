--          ╔═════════════════════════════════════════════════════════╗
--          ║                     Toggle Terminal                     ║
--          ╚═════════════════════════════════════════════════════════╝
local group = vim.api.nvim_create_augroup("terminal", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  desc = "terminal options",
  group = group,
  callback = function()
    vim.o.number = false
    vim.opt_local.buflisted = false
    vim.cmd.startinsert()
  end,
})

local floating_terminal_state = {
  buf = -1,
  win = -1,
  insert = nil,
  winview = nil,
}

local function update_terminal_size(win)
  local height = math.floor(vim.o.lines * 0.3)
  vim.api.nvim_win_set_config(win, {
    relative = "editor",
    height = height,
    width = vim.o.columns,
    row = vim.o.lines - height,
    col = 0,
  })
end

vim.keymap.set({ "n", "t" }, "<C-t>", function()
  if not vim.api.nvim_win_is_valid(floating_terminal_state.win) then
    if not vim.api.nvim_buf_is_valid(floating_terminal_state.buf) then
      floating_terminal_state.buf = vim.api.nvim_create_buf(false, true)
    end
    floating_terminal_state.win = vim.api.nvim_open_win(floating_terminal_state.buf, true, {
      relative = "editor",
      border = "single",
      height = math.floor(vim.o.lines * 0.3),
      width = vim.o.columns,
      row = vim.o.lines - math.floor(vim.o.lines * 0.3),
      col = 0,
    })
    vim.wo[floating_terminal_state.win].winhl = "Normal:Normal,FloatBorder:FloatBorder"

    if vim.bo[floating_terminal_state.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    elseif floating_terminal_state.insert then
      vim.cmd.startinsert()
    else
      vim.fn.winrestview(floating_terminal_state.winview)
    end
  else
    floating_terminal_state.insert = (vim.api.nvim_get_mode().mode == "t")
    if not floating_terminal_state.insert then
      floating_terminal_state.winview = vim.fn.winsaveview()
    end
    update_terminal_size(floating_terminal_state.win)
    vim.api.nvim_win_hide(floating_terminal_state.win)
  end
end, { desc = "toggle floating terminal" })

vim.api.nvim_create_autocmd("VimResized", {
  group = group,
  callback = function()
    if floating_terminal_state.win ~= -1 and vim.api.nvim_win_is_valid(floating_terminal_state.win) then
      update_terminal_size(floating_terminal_state.win)
    end
  end,
})
