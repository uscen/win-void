--          ╔═════════════════════════════════════════════════════════╗
--          ║                     Close Unused Buffers                ║
--          ╚═════════════════════════════════════════════════════════╝
local id = vim.api.nvim_create_augroup('startup', {
  clear = false,
})

local persistbuffer = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  vim.fn.setbufvar(bufnr, 'bufpersist', 1)
end

vim.api.nvim_create_autocmd({ 'BufRead' }, {
  group = id,
  pattern = { '*' },
  callback = function()
    vim.api.nvim_create_autocmd({ 'InsertEnter', 'BufModifiedSet' }, {
      buffer = 0,
      once = true,
      callback = function()
        persistbuffer()
      end,
    })
  end,
})

local function close_unused_buffers()
  local curbufnr = vim.api.nvim_get_current_buf()
  local buflist = vim.api.nvim_list_bufs()

  -- remove grapple buffers from buflist
  local grapple_ok, grapple = pcall(require, 'grapple')
  if grapple_ok then
    local tags = grapple.tags()
    for tag_key, tag in pairs(tags) do
      local filename = tag.path
      local bufnr = vim.fn.bufnr(filename)
      for i, v in ipairs(buflist) do
        if v == bufnr then
          table.remove(buflist, i)
        end
      end
    end
  end

  for _, bufnr in ipairs(buflist) do
    if vim.bo[bufnr].buflisted and bufnr ~= curbufnr and (vim.fn.getbufvar(bufnr, 'bufpersist') ~= 1) then
      vim.cmd('bd ' .. tostring(bufnr))
    end
  end
end

vim.keymap.set('n', '<Leader>db', close_unused_buffers, { silent = true, desc = 'Close unused buffers' })

-- close unused buffers before exiting nvim
vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
  group = vim.api.nvim_create_augroup('close unused buffers', { clear = true }),
  pattern = '*',
  callback = close_unused_buffers,
})
