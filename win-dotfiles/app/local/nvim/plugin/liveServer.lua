--          ╔═════════════════════════════════════════════════════════╗
--          ║                       Live server                       ║
--          ╚═════════════════════════════════════════════════════════╝
_G.LiveServerNvim = _G.LiveServerNvim or {}
LiveServerNvim.defaultConfig = {
  custom = {},
  serverPath = vim.fn.stdpath("data") .. "/live-server/",
  open = "folder",
}

-- Check if live-server installed: =============================================================================
local function is_installed()
  return vim.fn.filereadable(LiveServerNvim.defaultConfig.serverPath .. "node_modules/.bin/live-server") == 1
end
-- Notifactions Functions: =====================================================================================
local function notify(level, msg)
  vim.notify(msg, level, { title = "live-server" })
end
local function show_error_message(message)
  vim.notify(message, vim.log.levels.ERROR, { title = "live-server-nvim" })
end

local function show_info_message(message)
  vim.notify(message, vim.log.levels.INFO, { title = "live-server-nvim" })
end

-- Find the root project directory: ============================================================================
local function findRootProject()
  local dir = vim.fn.expand("%:p:h")
  while dir ~= '/' do
    if vim.fn.isdirectory(dir .. "/.git") == 1 or
        vim.fn.filereadable(dir .. "/package.json") == 1 or
        vim.fn.filereadable(dir .. "/index.html") == 1 then
      return dir
    end
    dir = vim.fn.fnamemodify(dir, ":h")
  end
  return vim.fn.getcwd()
end

local function getOpen(is_file)
  if is_file then
    -- Allow serving any file type when using -f flag: =========================================================
    return vim.fn.expand("%:p")
  end

  if LiveServerNvim.defaultConfig.open == "folder" then
    return findRootProject()
  else
    return vim.fn.getcwd()
  end
end

local function buildCommandList()
  local cmdTable = { LiveServerNvim.defaultConfig.serverPath .. "node_modules/.bin/live-server" }
  for _, option in ipairs(LiveServerNvim.defaultConfig.custom) do
    table.insert(cmdTable, option:gsub("%s", ""))
  end
  return cmdTable
end

local function removeAnsiCodes(inputString)
  return inputString:gsub("\27%[%d+;?%d*[mK]", "")
end

local function onStdout(_, data)
  local output = table.concat(data)
  local strippedOutput = removeAnsiCodes(output)
  if strippedOutput:match("http") then
    show_info_message(strippedOutput)
  end
end

function LiveServerNvim.install()
  local serverPath = LiveServerNvim.defaultConfig.serverPath
  if is_installed() then
    notify(vim.log.levels.INFO, "live-server already installed")
    return
  end

  show_info_message("Installing live-server to " .. serverPath)

  if vim.fn.executable("npm") == 0 then
    show_error_message("npm not found! Please install Node.js and npm first.")
    return
  end

  local installCmd = { "npm", "i", "live-server", "--prefix", serverPath }
  vim.fn.jobstart(installCmd, {
    on_exit = function(_, code)
      if code == 0 then
        show_info_message("live-server installed at " .. serverPath)
      else
        show_error_message("Installation failed. Check npm setup")
      end
    end,
  })
end

function LiveServerNvim.start(arg)
  local serving_file = arg == "-f"
  local realPath = getOpen(serving_file)

  if not is_installed() then
    notify(vim.log.levels.ERROR, "live-server not installed. Run :LiveServerInstall")
    return
  end

  if not realPath then
    show_error_message("Could not determine path to serve")
    return
  end

  local cmdTable = buildCommandList()
  table.insert(cmdTable, realPath)

  LiveServerNvim.SESSION_JOB = vim.fn.jobstart(cmdTable, {
    on_stdout = onStdout,
    stdout_buffered = true,
  })
end

function LiveServerNvim.stop()
  if not LiveServerNvim.SESSION_JOB then
    show_info_message("live-server not running!")
  else
    vim.fn.jobstop(LiveServerNvim.SESSION_JOB)
    LiveServerNvim.SESSION_JOB = nil
    show_info_message("Stopped live-server")
  end
end

function LiveServerNvim.toggle()
  if LiveServerNvim.SESSION_JOB then
    LiveServerNvim.stop()
  else
    LiveServerNvim.start()
  end
end

function LiveServerNvim.setup(config)
  LiveServerNvim.defaultConfig = vim.tbl_deep_extend(
    "force",
    LiveServerNvim.defaultConfig,
    config or {}
  )
end

--          ╔═════════════════════════════════════════════════════════╗
--          ║                   Create User Commands                  ║
--          ╚═════════════════════════════════════════════════════════╝
vim.cmd("command! -nargs=? LiveServerStart lua LiveServerNvim.start(<f-args>)")
vim.cmd("command! LiveServerStop lua LiveServerNvim.stop()")
vim.cmd("command! LiveServerToggle lua LiveServerNvim.toggle()")
vim.cmd("command! LiveServerInstall lua LiveServerNvim.install()")
