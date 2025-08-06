local function run_git_command(command_args)
  local result = vim.fn.system(command_args)
  if vim.v.shell_error ~= 0 then
    print("Error: " .. result)
  else
    print("Command successful!")
  end
end

local function git_commit(commit_message)
  run_git_command({ "git", "commit", "-m", commit_message })
end

local function git_add(files)
  run_git_command({ "git", "add", files })
end

local function git_status()
  local result = vim.fn.system({ "git", "status" })
  print(result)
end

local function git_log()
  local result = vim.fn.system({ "git", "log" })
  print(result)
end

local function git_init()
  local result = vim.fn.system({ "git", "init" })
  print(result)
end

local function git_reset(files)
  run_git_command({ "git", "reset", files })
end

local function git_push()
  run_git_command({ "git", "push" })
  print("Successfully pushed to remote repo")
end

local function prompt_user_input(callback, prompt_text, default_value)
  vim.ui.input({
    prompt = prompt_text,
    default = default_value or "",
    width = 60
  }, function(value)
    if value then  -- Only proceed if user didn't cancel with Esc
      callback(value)
    end
  end)
end

vim.api.nvim_create_user_command("G", function(opts)
  local subcommand = opts.args

  if subcommand == "commit" then
    prompt_user_input(function(commit_message)
      git_commit(commit_message)
    end, "Commit Message")
  elseif subcommand == "add" then
    prompt_user_input(function(files)
      git_add(files)
    end, "Files to Add")
  elseif subcommand == "reset" then
    prompt_user_input(function(files)
      git_reset(files)
    end, "Files to reset")
  elseif subcommand == "status" then
    git_status()
  elseif subcommand == "log" then
    git_log()
  elseif subcommand == "push" then
    git_push()
  elseif subcommand == "init" then
    git_init()
  else
    print("Unknown Git subcommand: " .. subcommand)
  end
end, {
  nargs = 1,
  complete = function()
    return { "commit", "add", "reset", "status", "log", "init", "push" }
  end,
})
