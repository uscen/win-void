--          ╔═════════════════════════════════════════════════════════╗
--          ║                       Big File                          ║
--          ╚═════════════════════════════════════════════════════════╝
local size = 1.5 * 1024 * 1024 -- 1.5MB
vim.filetype.add({
  pattern = {
    [".*"] = {
      function(path, buf)
        return vim.bo[buf] and vim.bo[buf].filetype ~= "bigfile" and path and
            vim.fn.getfsize(path) > size and "bigfile" or nil
      end,
    },
  },
})

local function on_bigfile(ev)
  vim.b.minianimate_disable = true
  vim.b.minicursorword_disable = true
  vim.b.miniindentscope_disable = true
  vim.schedule(function() vim.bo[ev.buf].syntax = ev.ft end)
  local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(ev.buf), ":p:~:.")
  vim.notify(("Big file detected `%s`."):format(path))
end

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("on_bigfile", { clear = true }),
  pattern = "bigfile",
  callback = function(ev)
    vim.api.nvim_buf_call(ev.buf, function()
      on_bigfile({
        buf = ev.buf,
        ft = vim.filetype.match({ buf = ev.buf }) or "",
      })
    end)
  end,
})
