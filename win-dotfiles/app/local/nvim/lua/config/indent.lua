-----------------------------------------------------------
-- Indent Guide:
-----------------------------------------------------------
-- Define the guide and padding characters
local Guide = "│"
local Padding = " "

-- Function to update the indent guides
local function SIGUpdate()
  vim.opt_local.listchars = vim.o.listchars
  vim.opt_local.listchars:remove("leadmultispace")
  vim.opt_local.listchars:append({
    leadmultispace = Guide .. string.rep(Padding, (vim.bo.shiftwidth - 1)),
  })
end

-- Setup function to configure the indent guides
local function setup_indent_guides(guide, padding)
  if guide ~= nil then
    Guide = guide
  end
  if padding ~= nil then
    Padding = padding
  end

  -- Create an autocommand group
  local group = vim.api.nvim_create_augroup("SimpleIndentGuides", {})

  -- Update guides when shiftwidth changes
  vim.api.nvim_create_autocmd("OptionSet", {
    pattern = "shiftwidth",
    group = group,
    callback = SIGUpdate,
  })

  -- Update guides when entering a buffer
  vim.api.nvim_create_autocmd("BufWinEnter", {
    group = group,
    callback = SIGUpdate,
  })

  -- Enable list mode to show the guides
  vim.opt.list = true
end

-- Call the setup function to initialize the indent guides
setup_indent_guides()
