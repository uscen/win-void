--          ╔═════════════════════════════════════════════════════════╗
--          ║                          Plugins                        ║
--          ╚═════════════════════════════════════════════════════════╝
--          ┌─────────────────────────────────────────────────────────┐
--                Clone 'mini.nvim manually in a way that it gets
--                            managed by 'mini.deps'
--          └─────────────────────────────────────────────────────────┘
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/echasnovski/mini.nvim",
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.nvim | helptags ALL")
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Deps                           │
--          ╰─────────────────────────────────────────────────────────╯
require("mini.deps").setup({ path = { package = path_package } })
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local now_if_args = vim.fn.argc(-1) > 0 and now or later
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Misc                           │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require('mini.misc').setup_auto_root({ '.git', "package.json" }, vim.fs.dirname)
  require('mini.misc').setup_restore_cursor()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Trailspace                     │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.trailspace").setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.SplitJoin                      │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.splitjoin").setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Extra                          │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.extra").setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Git                            │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.git").setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Diff                           │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.diff").setup({ view = { style = 'sign' } })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.keymaps                        │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  local map_multistep = require('mini.keymap').map_multistep
  map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
  map_multistep('i', '<BS>', { 'minipairs_bs' })
  map_multistep('i', '<C-j>', { 'pmenu_next' })
  map_multistep('i', '<C-k>', { 'pmenu_prev' })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Notify                         │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  local win_config = function()
    local has_statusline = vim.o.laststatus > 0
    local pad = vim.o.cmdheight + (has_statusline and 1 or 0)
    return { anchor = 'SE', col = vim.o.columns, row = vim.o.lines - pad }
  end
  require('mini.notify').setup({ window = { config = win_config } })
  vim.notify = require('mini.notify').make_notify()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Surround                       │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.surround").setup({
    n_lines = 500,
    custom_surroundings = {
      ["("] = { output = { left = "(", right = ")" } },
      ["["] = { output = { left = "[", right = "]" } },
      ["{"] = { output = { left = "{", right = "}" } },
      ["<"] = { output = { left = "<", right = ">" } },
    },
    mappings = {
      add = "ys",
      delete = "ds",
      replace = "cs",
    },
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Hipatterns                     │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.hipatterns").setup({
    highlighters = {
      fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
      hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
      todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
      note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
      hex_color = require("mini.hipatterns").gen_highlighter.hex_color({ priority = 200 }),
      hex_shorthand = {
        pattern = '()#%x%x%x()%f[^%x%w]',
        group = function(_, _, data)
          local match = data.full_match
          local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
          local hex_color = '#' .. r .. r .. g .. g .. b .. b
          return require('mini.hipatterns').compute_hex_color_group(hex_color, 'bg')
        end,
      },
    },
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Pairs                          │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.pairs").setup({
    skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
    skip_ts = { "string" },
    skip_unbalanced = true,
    markdown = true,
    modes = { insert = true, command = true, terminal = true },
    mappings = {
      -- Prevents the action if the cursor is just before any character or next to a "\".
      ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\][%s%)%]%}]" },
      ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\][%s%)%]%}]" },
      ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\][%s%)%]%}]" },
      -- This is default (prevents the action if the cursor is just next to a "\").
      [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
      ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
      ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
      -- Prevents the action if the cursor is just before or next to any character.
      ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^%w][^%w]", register = { cr = false } },
      ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%w][^%w]", register = { cr = false } },
      ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^%w][^%w]", register = { cr = false } },
      ["<"] = { action = "closeopen", pair = "<>", neigh_pattern = "[^%S][^%S]", register = { cr = false } },
    },
  })
  local cr_action = function()
    if vim.fn.pumvisible() ~= 0 then
      local item_selected = vim.fn.complete_info()['selected'] ~= -1
      return item_selected and '\25' or '\25\r'
    else
      return require('mini.pairs').cr()
    end
  end
  vim.keymap.set('i', '<CR>', cr_action, { expr = true })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Ai                             │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.ai").setup({
    custom_textobjects = {
      r = require("mini.extra").gen_ai_spec.diagnostic(),
      a = require("mini.extra").gen_ai_spec.buffer(),
      i = require("mini.extra").gen_ai_spec.indent(),
      d = require("mini.extra").gen_ai_spec.number(),
      c = require("mini.extra").gen_ai_spec.line(),
      e = {
        {
          -- __-1, __-U, __-l, __-1_, __-U_, __-l_
          '[^_%-]()[_%-]+()%w()()[%s%p]',
          '^()[_%-]+()%w()()[%s%p]',
          -- __-123SNAKE
          '[^_%-]()[_%-]+()%d+%u[%u%d]+()()',
          '^()[_%-]+()%d+%u[%u%d]+()()',
          -- __-123snake
          '[^_%-]()[_%-]+()%d+%l[%l%d]+()()',
          '^()[_%-]+()%d+%l[%l%d]+()()',
          -- __-SNAKE, __-SNAKE123
          '[^_%-]()[_%-]+()%u[%u%d]+()()',
          '^()[_%-]+()%u[%u%d]+()()',
          -- __-snake, __-Snake, __-snake123, __-Snake123
          '[^_%-]()[_%-]+()[%u%l][%l%d]+()()',
          '^()[_%-]+()[%u%l][%l%d]+()()',
          -- UPPER, UPPER123, UPPER-__, UPPER123-__
          -- No support: 123UPPER
          '[^_%-%u]()()%u[%u%d]+()[_%-]*()',
          '^()()%u[%u%d]+()[_%-]*()',
          -- UPlower, UPlower123, UPlower-__, UPlower123-__
          '%u%u()()[%l%d]+()[_%-]*()',
          -- lower, lower123, lower-__, lower123-__
          '[^_%-%u%l%d]()()[%l%d]+()[_%-]*()',
          '^()()[%l%d]+()[_%-]*()',
          -- Camel, Camel123, Camel-__, Camel123-__
          '[^_%-%u]()()%u[%l%d]+()[_%-]*()',
          '^()()%u[%l%d]+()[_%-]*()',
        },
      },
    },
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Pick                           │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.pick").setup({
    mappings = {
      choose           = "<Tab>",
      move_down        = "<C-j>",
      move_up          = "<C-k>",
      toggle_preview   = "<C-p>",
      choose_in_split  = '<C-v>',
      choose_in_vsplit = '<C-s>',
    },
    options = {
      use_cache = true,
      content_from_bottom = false
    },
    window = {
      config = {
        height = 20,
        width = 999,
      },
      prompt_caret = "|",
      prompt_prefix = "󱓇 ",
    },
  })
  vim.ui.select = MiniPick.ui_select
  -- Pick Directory  Form Current Directory: ===========================================
  local function directory_pick()
    local root_dir = vim.fn.getcwd()
    local fd_output = vim.fn.systemlist('fd --type d --exclude ".*" . "' .. root_dir .. '"')
    MiniPick.start({
      source = {
        items = fd_output,
        name = 'Directories (fd)',
        choose = function(item)
          vim.schedule(function()
            vim.fn.chdir(item)
            require("mini.files").open(item)
          end)
        end,
      },
    })
  end
  vim.keymap.set('n', '<leader>fn', directory_pick)
  -- Pick Directory  Form Zoxide : ======================================================
  local function zoxide_pick()
    local zoxide_output = vim.fn.systemlist('zoxide query -ls')
    local directories = {}
    for _, line in ipairs(zoxide_output) do
      local path = line:match("%d+%.%d+%s+(.*)")
      if path then
        table.insert(directories, path)
      end
    end
    MiniPick.start({
      source = {
        items = directories,
        name = 'Directories (zoxide)',
        choose = function(item)
          vim.schedule(function()
            vim.fn.chdir(item)
            require("mini.files").open(item)
          end)
        end,
      },
    })
  end
  vim.keymap.set('n', '<leader>fd', zoxide_pick)
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Tabline                        │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
  require("mini.tabline").setup({
    show_icons = true,
    tabpage_section = 'right',
    format = function(buf_id, label)
      local suffix = vim.bo[buf_id].modified and "● " or ""
      return MiniTabline.default_format(buf_id, label) .. suffix
    end,
  })
  -- hide when only One Buffer: =====================================================
  local get_n_listed_bufs = function()
    local n = 0
    for _, buf_id in ipairs(vim.api.nvim_list_bufs()) do
      n = n + (vim.bo[buf_id].buflisted and 1 or 0)
    end
    return n
  end
  vim.api.nvim_create_autocmd({
    'BufEnter',
    'BufWinEnter',
    'BufAdd',
    'BufDelete',
  }, {
    desc = 'Hide the tabline when empty',
    group = group,
    -- Schedule because 'BufDelete' is triggered when buffer is still present
    callback = vim.schedule_wrap(function() vim.o.showtabline = get_n_listed_bufs() > 1 and 2 or 0 end),
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Starter                        │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
  local starter = require("mini.starter")
  local pad = string.rep(" ", 0)
  local new_section = function(name, action, section)
    return { name = name, action = action, section = pad .. section }
  end
  starter.setup({
    evaluate_single = true,
    items = {
      new_section("Projects Folders", "e $HOME/Projects/", "Project"),
      new_section("Dotfiles Folders", "e $HOME/win-void/", "Project"),
      new_section("Neovim Folders", "e $HOME/win-void/win-dotfiles/app/local/nvim/", "Project"),
      new_section("Find Files", "Pick files", "Picker"),
      new_section("Recent Files", "Pick oldfiles", "Picker"),
      new_section("Browser Files", "lua MiniFiles.open()", "Picker"),
      new_section("Update Plugins", "DepsUpdate", "Config"),
      new_section("Lazy Plugins", "Lazy", "Config"),
      new_section("Manage Extensions", "Mason", "Config"),
      new_section("Edit New", "ene | startinsert", "Builtin"),
      new_section("Quit Neovim", "qa", "Builtin"),
    },
    content_hooks = {
      function(content)
        local blank_content_line = { { type = 'empty', string = '' } }
        local section_coords = starter.content_coords(content, 'section')
        -- Insert backwards to not affect coordinates
        for i = #section_coords, 1, -1 do
          table.insert(content, section_coords[i].line + 1, blank_content_line)
        end
        return content
      end,
      starter.gen_hook.adding_bullet("» "),
      starter.gen_hook.aligning('center', 'center'),
    },
    header = [[
            ▄ ▄
        ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄
        █ ▄ █▄█ ▄▄▄ █ █▄█ █ █
     ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █
   ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
   █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄
 ▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █
 █▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █
     █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█
        ]],
    footer = '',
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Completion                     │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
  -- enable configured language servers 0.11: ========================================
  local lsp_configs = { "lua", "html", "css", "emmet", "json", "tailwind", "typescript", "eslint", "prisma" }
  vim.lsp.config("*", {
    capabilities = {
      textDocument = {
        semanticTokens = {
          multilineTokenSupport = true,
        }
      }
    },
    root_markers = {
      '.git'
    },
  })
  for _, config in ipairs(lsp_configs) do
    vim.lsp.enable(config)
  end
  -- enable Mini.Completion: ==============================================================
  require("mini.completion").setup({
    delay = { completion = 50, info = 40, signature = 30, },
    window = {
      info = { border = "single" },
      signature = { border = "single" },
    },
    mappings = {
      force_twostep = '<C-n>',
      force_fallback = '<C-S-n>',
      scroll_down = '<C-f>',
      scroll_up = '<C-b>',
    },
    lsp_completion = {
      source_func = 'omnifunc',
      process_items = function(items, base)
        return require('mini.completion').default_process_items(items, base, {
          filtersort = 'fuzzy',
          kind_priority = {
            Snippet = 99,
          },
        })
      end,
    },
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Snippets                       │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
  -- Languge Patterns: ==============================================================
  local markdown        = { 'markdown.json' }
  local webHtmlPatterns = { 'html.json', "ejs.json" }
  local webJsTsPatterns = { 'web/javascript.json' }
  local webPatterns     = { 'web/*.json' }
  local lang_patterns   = {
    markdown_inline = markdown,
    html = webHtmlPatterns,
    ejs = webHtmlPatterns,
    tsx = webPatterns,
    javascriptreact = webPatterns,
    typescriptreact = webPatterns,
    javascript = webJsTsPatterns,
    typescript = webJsTsPatterns,
  }
  -- Expand Patterns: ===============================================================
  local match_strict    = function(snips)
    -- Do not match with whitespace to cursor's left ================================
    -- return require('mini.snippets').default_match(snips, { pattern_fuzzy = '%S+' })
    -- Match exact from the start to the end of the string ==========================
    return require('mini.snippets').default_match(snips, { pattern_fuzzy = '^%S+$' })
  end
  -- Setup Snippets ==================================================================
  require('mini.snippets').setup({
    snippets = {
      require('mini.snippets').gen_loader.from_file('~/AppData/Local/nvim/snippets/global.json'),
      require('mini.snippets').gen_loader.from_lang({ lang_patterns = lang_patterns })
    },
    mappings = {
      expand = '<C-e>',
      jump_next = '<C-l>',
      jump_prev = '<C-h>',
      stop = '<C-c>',
    },
    expand   = {
      match = match_strict,
      insert = function(snippet)
        return require('mini.snippets').default_insert(snippet, {
          empty_tabstop = '',
          empty_tabstop_final = ''
        })
      end
    },
  })
  require('mini.snippets').start_lsp_server()
  -- Expand Snippets Or complete by Tab ===============================================
  local expand_or_complete = function()
    if #MiniSnippets.expand({ insert = false }) > 0 then
      vim.schedule(MiniSnippets.expand); return ''
    end
    return vim.fn.pumvisible() == 1 and
        (vim.fn.complete_info().selected == -1 and vim.keycode('<c-n><c-y>') or vim.keycode('<c-y>')) or "<Tab>"
  end
  vim.keymap.set('i', '<Tab>', expand_or_complete, { expr = true })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Files                          │
--          ╰─────────────────────────────────────────────────────────╯
now_if_args(function()
  require("mini.files").setup({
    mappings = {
      go_in_plus  = "<Tab>",
      go_out_plus = "<C-h>",
      synchronize = "<C-s>",
      close       = "q",
      reset       = "gh",
      mark_goto   = "gb",
      go_in       = "",
      go_out      = "",
    },
    content = {
      filter = function(fs_entry)
        local ignore = { "node_modules", "build", "depes", "incremental" }
        local filter_hidden = not vim.tbl_contains(ignore, fs_entry.name)
        return filter_hidden and not vim.startswith(fs_entry.name, ".")
      end,
    },
    windows = {
      max_number = 1,
      width_focus = 999,
    },
  })
  -- BookMarks: ==========================================================================
  local minifiles_augroup = vim.api.nvim_create_augroup('ec-mini-files', {})
  vim.api.nvim_create_autocmd('User', {
    group = minifiles_augroup,
    pattern = 'MiniFilesExplorerOpen',
    callback = function()
      MiniFiles.set_bookmark('c', vim.fn.stdpath('config'), { desc = 'Config' })
      MiniFiles.set_bookmark('m', vim.fn.stdpath('data') .. '/site/pack/deps/start/mini.nvim', { desc = 'mini.nvim' })
      MiniFiles.set_bookmark('p', vim.fn.stdpath('data') .. '/site/pack/deps/opt', { desc = 'Plugins' })
      MiniFiles.set_bookmark('w', vim.fn.getcwd, { desc = 'Working directory' })
    end,
  })
  -- Toggle dotfiles : ===================================================================
  local toggle = { enabled = true }
  local toggle_dotfiles = function()
    function toggle:bool()
      self.enabled = not self.enabled
      return self.enabled
    end

    local is_enabled = not toggle:bool()
    require("mini.files").refresh({
      content = {
        filter = function(fs_entry)
          local ignore = { "node_modules", "build", "depes", "incremental" }
          local filter_hidden = not vim.tbl_contains(ignore, fs_entry.name)
          return is_enabled and true or (filter_hidden and not vim.startswith(fs_entry.name, "."))
        end,
      },
    })
  end
  vim.api.nvim_create_autocmd("User", {
    pattern = "MiniFilesBufferCreate",
    callback = function(args) vim.keymap.set("n", ".", toggle_dotfiles, { buffer = args.data.buf_id }) end,
  })
  -- Open In Splits : ==================================================================
  local map_split = function(buf_id, lhs, direction)
    local rhs = function()
      -- Make new window and set it as target
      local cur_target = MiniFiles.get_explorer_state().target_window
      local new_target = vim.api.nvim_win_call(cur_target, function()
        vim.cmd(direction .. ' split')
        return vim.api.nvim_get_current_win()
      end)
      MiniFiles.set_target_window(new_target)
    end
    -- Adding `desc` will result into `show_help` entries
    local desc = 'Split ' .. direction
    vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
  end
  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
      local buf_id = args.data.buf_id
      map_split(buf_id, 'v', 'belowright horizontal')
      map_split(buf_id, 's', 'belowright vertical')
    end,
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Icons                          │
--          ╰─────────────────────────────────────────────────────────╯
now_if_args(function()
  require("mini.icons").setup({
    file = {
      ['.eslintrc.js'] = { glyph = '󰱺', hl = 'MiniIconsYellow' },
      ['.node-version'] = { glyph = '', hl = 'MiniIconsGreen' },
      ['.prettierrc'] = { glyph = '', hl = 'MiniIconsPurple' },
      ['.yarnrc.yml'] = { glyph = '', hl = 'MiniIconsBlue' },
      ['eslint.config.js'] = { glyph = '󰱺', hl = 'MiniIconsYellow' },
      ['package.json'] = { glyph = '', hl = 'MiniIconsGreen' },
      ['tsconfig.json'] = { glyph = '', hl = 'MiniIconsAzure' },
      ['tsconfig.build.json'] = { glyph = '', hl = 'MiniIconsAzure' },
      ['yarn.lock'] = { glyph = '', hl = 'MiniIconsBlue' },
      ['vite.config.ts'] = { glyph = '', hl = 'MiniIconsYellow' },
      ['pnpm-lock.yaml'] = { glyph = '', hl = 'MiniIconsYellow' },
      ['pnpm-workspace.yaml'] = { glyph = '', hl = 'MiniIconsYellow' },
      ['.dockerignore'] = { glyph = '󰡨', hl = 'MiniIconsBlue' },
      ['react-router.config.ts'] = { glyph = '', hl = 'MiniIconsRed' },
      ['bun.lockb'] = { glyph = '', hl = 'MiniIconsGrey' },
      ['bun.lock'] = { glyph = '', hl = 'MiniIconsGrey' },
    },
    directory = {
      ['.vscode'] = { glyph = '', hl = 'MiniIconsBlue' },
      ['app'] = { glyph = '󰀻', hl = 'MiniIconsRed' },
      ['routes'] = { glyph = '󰑪', hl = 'MiniIconsGreen' },
      ['config'] = { glyph = '', hl = 'MiniIconsGrey' },
      ['configs'] = { glyph = '', hl = 'MiniIconsGrey' },
      ['server'] = { glyph = '󰒋', hl = 'MiniIconsCyan' },
      ['api'] = { glyph = '󰒋', hl = 'MiniIconsCyan' },
      ['web'] = { glyph = '󰖟', hl = 'MiniIconsBlue' },
      ['client'] = { glyph = '󰖟', hl = 'MiniIconsBlue' },
      ['database'] = { glyph = '󰆼', hl = 'MiniIconsOrange' },
      ['db'] = { glyph = '󰆼', hl = 'MiniIconsOrange' },
      ['cspell'] = { glyph = '󰓆', hl = 'MiniIconsPurple' },
    },
  })
  later(MiniIcons.mock_nvim_web_devicons)
  later(MiniIcons.tweak_lsp_kind)
end)
--          ╔═════════════════════════════════════════════════════════╗
--          ║                      Treesitter                         ║
--          ╚═════════════════════════════════════════════════════════╝
now_if_args(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'master',
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })
  local ensure_installed = {
    'bash', 'powershell', 'nu', 'c', 'cpp', 'python', 'regex',
    'html', 'css', 'scss', 'javascript', 'typescript', 'tsx', 'prisma',
    'json', 'jsonc', 'toml', 'yaml', 'lua', 'luadoc', 'vim', 'vimdoc', 'markdown', 'markdown_inline',
    "git_config", "git_rebase", "gitcommit", "gitignore", "gitattributes", "diff",
  }
  require('nvim-treesitter.configs').setup({
    ensure_installed = ensure_installed,
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = { enable = false },
    textobjects = { enable = false },
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                      TS Auto Close/Rename               │
--          ╰─────────────────────────────────────────────────────────╯
now_if_args(function()
  add("windwp/nvim-ts-autotag")
  require('nvim-ts-autotag').setup()
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                    TS Rainbow delimiters                │
--          ╰─────────────────────────────────────────────────────────╯
now_if_args(function()
  add("hiphish/rainbow-delimiters.nvim")
  require('rainbow-delimiters.setup').setup()
end)
--          ╔═════════════════════════════════════════════════════════╗
--          ║                         Formatting                      ║
--          ╚═════════════════════════════════════════════════════════╝
now_if_args(function()
  add('stevearc/conform.nvim')
  require('conform').setup({
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      jsx = { "prettier" },
      tsx = { "prettier" },
      svelte = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      liquid = { "prettier" },
      c = { "clang_format" },
      lua = { "stylua" },
      python = { "black" },
      tex = { "latexindent" },
      xml = { "xmllint" },
      svg = { "xmllint" },
      sql = { "sqlfluff" },
      java = { "google-java-format" },
      groovy = { "npm-groovy-lint" },
      ['_'] = { 'trim_whitespace' },
    },
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 1000, lsp_format = "fallback" }
    end,
  })
  vim.keymap.set({ "n", "v" }, "<leader>l", function()
    require("conform").format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    })
  end)
end)
--          ╔═════════════════════════════════════════════════════════╗
--          ║                          NVIM                           ║
--          ╚═════════════════════════════════════════════════════════╝
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Neovim Colorscheme                  │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
  vim.cmd.colorscheme("minibase-core")
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Neovim Options                      │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
  -- Global:  =================================================================
  vim.g.mapleader               = vim.keycode("<space>")
  vim.g.maplocalleader          = vim.g.mapleader
  -- Use ripgrep as grep tool: ================================================
  vim.opt.grepprg               = "rg --vimgrep --no-heading"
  vim.opt.grepformat            = "%f:%l:%c:%m,%f:%l:%m"
  vim.opt.path                  = ".,,**"
  -- Shell: =-================================================================
  vim.opt.sh                    = "nu"
  vim.opt.shellslash            = true
  vim.opt.shelltemp             = false
  vim.opt.shellcmdflag          = "--stdin --no-newline -c"
  vim.opt.shellredir            = "out+err> %s"
  vim.opt.shellxescape          = ""
  vim.opt.shellxquote           = ""
  vim.opt.shellquote            = ""
  -- General: ================================================================
  vim.opt.clipboard             = "unnamedplus"
  vim.opt.wildmenu              = true
  vim.opt.wildignorecase        = true
  vim.opt.wildmode              = "longest:full,full"
  vim.opt.wildoptions           = "fuzzy,pum"
  vim.opt.completeopt           = 'menuone,noselect,popup,fuzzy'
  vim.opt.complete              = '.,w,b,kspell'
  vim.opt.switchbuf             = "usetab"
  vim.opt.splitkeep             = 'screen'
  vim.opt.compatible            = false
  vim.opt.swapfile              = false
  vim.opt.writebackup           = false
  vim.opt.backup                = false
  vim.opt.undofile              = true
  vim.opt.shada                 = { "'10", "<0", "s10", "h" }
  -- Spelling ================================================================
  vim.opt.spell                 = false
  vim.opt.spelllang             = 'en'
  vim.opt.spelloptions          = 'camel'
  vim.opt.dictionary            = vim.fn.stdpath('config') .. '/misc/dict/english.txt'
  -- UI: ====================================================================
  vim.opt.termguicolors         = true
  vim.opt.number                = true
  vim.opt.relativenumber        = false
  vim.opt.cursorline            = false
  vim.opt.splitright            = true
  vim.opt.splitbelow            = true
  vim.opt.confirm               = true
  vim.opt.breakindent           = true
  vim.opt.copyindent            = true
  vim.opt.laststatus            = 0
  vim.opt.cmdheight             = 0
  vim.opt.cedit                 = '^F'
  vim.opt.pumwidth              = 20
  vim.opt.pumblend              = 8
  vim.opt.pumheight             = 8
  vim.opt.showmatch             = false
  vim.opt.wrap                  = false
  vim.opt.list                  = false
  vim.opt.modeline              = false
  vim.opt.showmode              = false
  vim.opt.ruler                 = false
  vim.opt.cedit                 = '^F'
  vim.opt.showbreak             = "↪"
  vim.opt.winborder             = "double"
  vim.opt.colorcolumn           = '+1'
  vim.opt.backspace             = "indent,eol,start"
  vim.opt.cursorlineopt         = "screenline,number"
  vim.opt.shortmess             = "FOSWaco"
  vim.wo.signcolumn             = "yes"
  vim.opt.statuscolumn          = ""
  vim.opt.mousescroll           = "ver:3,hor:0"
  vim.opt.guifont               = "JetBrainsMono NF:h9"
  vim.opt.guicursor             =
  "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait100-blinkoff700-blinkon700-Cursor/lCursor,sm:block-blinkwait0-blinkoff300-blinkon300"
  vim.opt.fillchars             = table.concat(
    { 'eob: ', 'fold:╌', 'horiz:═', 'horizdown:╦', 'horizup:╩', 'vert:║', 'verthoriz:╬', 'vertleft:╣', 'vertright:╠' },
    ','
  )
  vim.opt.listchars             = table.concat({ 'extends:…', 'nbsp:␣', 'precedes:…', 'tab:> ' }, ',')
  -- Editing:  ================================================================
  vim.opt.cindent               = true
  vim.opt.autoindent            = true
  vim.opt.expandtab             = true
  vim.opt.ignorecase            = true
  vim.opt.incsearch             = true
  vim.opt.infercase             = true
  vim.opt.shiftwidth            = 2
  vim.opt.smartcase             = true
  vim.opt.smartindent           = true
  vim.opt.gdefault              = true
  vim.opt.tabstop               = 2
  vim.opt.softtabstop           = 2
  vim.o.whichwrap               = vim.o.whichwrap .. "<>[]hl"
  vim.opt.breakindentopt        = "list:-1"
  vim.opt.iskeyword             = '@,48-57,_,192-255,-'
  vim.opt.formatlistpat         = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]
  vim.opt.virtualedit           = "block"
  vim.opt.formatoptions         = "rqnl1j"
  vim.opt.formatexpr            = "v:lua.require'conform'.formatexpr()"
  -- Folds:  ================================================================
  vim.opt.foldenable            = false
  vim.opt.foldmethod            = 'indent'
  vim.opt.foldlevel             = 1
  vim.opt.foldnestmax           = 10
  vim.g.markdoptwn_folding      = 1
  vim.opt.foldtext              = ''
  -- Memory: ================================================================
  vim.opt.lazyredraw            = true
  vim.opt.hidden                = true
  vim.opt.history               = 100
  vim.opt.synmaxcol             = 200
  vim.opt.updatetime            = 200
  vim.opt.timeoutlen            = 300
  vim.opt.ttimeoutlen           = 0
  vim.opt.redrawtime            = 10000
  vim.opt.maxmempattern         = 20000
  -- Disable health checks for these providers:. ===========================
  vim.g.loaded_python_provider  = 0
  vim.g.loaded_python3_provider = 0
  vim.g.loaded_ruby_provider    = 0
  vim.g.loaded_perl_provider    = 0
  vim.g.loaded_node_provider    = 0
  -- Disable builtin plugins: ===============================================
  local disabled_built_ins      = {
    "osc52",
    "parser",
    "health",
    "man",
    "tohtml",
    "2html",
    "remote",
    "shadafile",
    "spellfile",
    "editorconfig",
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "matchparen",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
    "tutor",
    "rplugin",
    "synmenu",
    "optwin",
    "compiler",
    "bugreport",
    "ftplugin",
  }
  for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
  end
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Neovim Diagnostics                  │
--          ╰─────────────────────────────────────────────────────────╯
local diagnostic_opts = {
  severity_sort = false,
  update_in_insert = false,
  virtual_lines = false,
  virtual_text = { current_line = true, severity = { min = 'ERROR', max = 'ERROR' } },
  underline = { severity = { min = 'HINT', max = 'ERROR' } },
  signs = {
    priority = 9999,
    severity = {
      min = 'WARN',
      max = 'ERROR',
    },
    text = {
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.ERROR] = " ",
    },
    -- interference With Mini.Diff ====================================================
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
      [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
      [vim.diagnostic.severity.HINT] = "DiagnosticHint",
    },
  },
}
-- Use `later()` to avoid sourcing `vim.diagnostic` on startup: ======================
later(function() vim.diagnostic.config(diagnostic_opts) end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Neovim automads                     │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  -- Remove Space && Last_Lines =====================================================
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = "MiniTrailspace",
    callback = function()
      MiniTrailspace.trim()
      MiniTrailspace.trim_last_lines()
    end,
  })
  -- Don't Comment New Line ========================================================
  vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('CustomSettings', {}),
    callback = function()
      vim.cmd('setlocal formatoptions-=c formatoptions-=o')
    end,
  })
  -- Highlight Yank ================================================================
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    callback = function()
      vim.highlight.on_yank({ higroup = 'CurSearch', timeout = 200 })
    end,
  })
  -- Create directories when saving files: ========================================
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("UserConfig", {}),
    callback = function()
      local dir = vim.fn.expand('<afile>:p:h')
      if vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, 'p')
      end
    end,
  })
  -- Auto-close terminal when process exits: ========================================
  vim.api.nvim_create_autocmd("TermClose", {
    group = vim.api.nvim_create_augroup("UserConfig", {}),
    callback = function()
      if vim.v.event.status == 0 then
        vim.api.nvim_buf_delete(0, {})
      end
    end,
  })
  -- Eable FormatOnSave =============================================================
  vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
    vim.notify("Format On Save Enable")
  end, {
    desc = "Re-enable autoformat-on-save",
  })
  -- Disable FormatOnSave ===========================================================
  vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
      vim.b.disable_autoformat = true
    else
      vim.g.disable_autoformat = true
    end
    vim.notify("Format On Save Disable")
  end, {
    desc = "Disable autoformat-on-save",
    bang = true,
  })
  -- Qucikfix List: ==================================================================
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function(event)
      local opts = { buffer = event.buf, silent = true }
      vim.keymap.set('n', '<C-j>', '<cmd>cn<CR>zz<cmd>wincmd p<CR>', opts)
      vim.keymap.set('n', '<C-k>', '<cmd>cN<CR>zz<cmd>wincmd p<CR>', opts)
      vim.keymap.set('n', '<Tab>', '<CR>', opts)
    end
  })
  -- close some filetypes with <q>: : =====================================================
  vim.api.nvim_create_autocmd('FileType', {
    pattern = {
      'qf',
      'man',
      'help',
      'query',
      'notify',
      'lspinfo',
      'startuptime',
      'checkhealth',
    },
    callback = function(event)
      local bo = vim.bo[event.buf]
      if bo.filetype ~= 'markdown' or bo.buftype == 'help' then
        -- bo.buflisted = false
        vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
      end
    end,
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Neovim keymaps                      │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  -- General: =======================================================================
  vim.keymap.set("n", "<C-s>", ":silent up<CR>")
  vim.keymap.set("i", "<C-s>", "<ESC> :up<CR>")
  vim.keymap.set("n", "<C-c>", "cit")
  vim.keymap.set("n", "<ESC>", ":nohl<CR>")
  vim.keymap.set('n', '<Space>', '<Nop>')
  vim.keymap.set("n", "<leader>qq", ":qa<CR>")
  vim.keymap.set("n", "<leader>wq", ":close<CR>")
  vim.keymap.set("n", "<leader>q", ":close<CR>")
  vim.keymap.set("n", "ycc", "yygccp", { remap = true })
  vim.keymap.set("n", "J", "mzJ`z:delmarks z<CR>")
  vim.keymap.set("x", "/", "<Esc>/\\%V")
  vim.keymap.set("x", "R", ":s###g<left><left><left>")
  vim.keymap.set("v", "y", "y`]")
  vim.keymap.set("v", "p", "p`]")
  vim.keymap.set("n", "p", "p`]")
  vim.keymap.set("v", "p", '"_dP')
  vim.keymap.set("x", "gr", '"_dP')
  vim.keymap.set("v", "<", "<gv")
  vim.keymap.set("v", ">", ">gv")
  vim.keymap.set("c", "%%", "<C-R>=expand('%:h').'/'<cr>")
  vim.keymap.set("n", "<leader>nc", ":e ~/.config/nvim/init.lua<CR>")
  -- Focus : =======================================================================
  vim.keymap.set("n", "<C-h>", "<C-w>h")
  vim.keymap.set("n", "<C-j>", "<C-w>j")
  vim.keymap.set("n", "<C-k>", "<C-w>k")
  vim.keymap.set("n", "<C-l>", "<C-w>l")
  -- Center:  ======================================================================
  vim.keymap.set("n", "n", "nzzzv")
  vim.keymap.set("n", "N", "Nzzzv")
  vim.keymap.set("n", "<C-d>", "<C-d>zz")
  vim.keymap.set("n", "<C-u>", "<C-u>zz")
  -- Resize:  ======================================================================
  vim.keymap.set("n", "<C-Up>", ":resize +2<CR>")
  vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
  vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
  vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")
  -- Move: ========================================================================
  vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
  vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
  -- Split: ========================================================================
  vim.keymap.set('n', '<leader>v', ':split<CR>')
  vim.keymap.set('n', '<leader>s', ':vsplit<CR>')
  -- Theme: ========================================================================
  vim.keymap.set("n", "<leader>ud", "<cmd>set background=dark<CR>")
  vim.keymap.set("n", "<leader>ul", "<cmd>set background=light<CR>")
  vim.keymap.set("n", "<leader>ur", "<cmd>colorscheme randomhue<CR>")
  -- Go to end of visual selection: =================================================
  -- Subtitle Keys: =================================================================
  vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
  vim.keymap.set('n', 'S',
    function() return ':%s/\\<' .. vim.fn.escape(vim.fn.expand('<cword>'), '/\\') .. '\\>/' end, { expr = true })
  -- Buffers: =======================================================================
  vim.keymap.set("n", "<Tab>", ":bnext<CR>")
  vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")
  vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
  vim.keymap.set("n", "<leader>bp", ":bprevious<CR>")
  vim.keymap.set("n", "<leader>bd", ":bd<CR>")
  vim.keymap.set("n", "<leader>bm", function() require("mini.misc").zoom() end)
  vim.keymap.set("n", "<leader>m", function() require("mini.misc").zoom() end)
  vim.keymap.set('n', '<space>bb', function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.bo[buf].buflisted and buf ~= vim.api.nvim_get_current_buf() then
        vim.cmd('silent! bd ' .. buf)
      end
    end
  end)
  -- Terminal: =====================================================================
  vim.keymap.set({ "n", "t" }, "<C-t>", "<CMD>FloatTermToggle<CR>", { noremap = true, silent = true })
  vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { noremap = true, silent = true })
  vim.keymap.set("n", "<leader>t", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 20)
    vim.cmd("startinsert")
  end)
  -- Picker ======================================================================
  vim.keymap.set("n", "<leader>fb", "<CMD>Pick buffers include_current=false<CR>")
  vim.keymap.set("n", "<leader>ff", "<CMD>Pick files<CR>")
  vim.keymap.set("n", "<leader>fr", "<CMD>Pick oldfiles<CR>")
  vim.keymap.set("n", "<leader>ft", "<CMD>Pick grep_live<CR>")
  vim.keymap.set("n", "<leader>fe", "<CMD>Pick explorer<CR>")
  vim.keymap.set("n", "<leader>fg", "<CMD>Pick git_files<CR>")
  vim.keymap.set("n", "<leader>fc", "<CMD>Pick git_commits<CR>")
  vim.keymap.set("n", "<leader>fo", "<CMD>Pick options<CR>")
  vim.keymap.set("n", "<leader>fp", "<CMD>Pick registers<CR>")
  vim.keymap.set("n", "<leader>fk", "<CMD>Pick keymaps<CR>")
  vim.keymap.set("n", "<leader>fu", "<CMD>Pick colorschemes<CR>")
  vim.keymap.set("n", "gR", "<Cmd>Pick lsp scope='references'<CR>")
  vim.keymap.set("n", "gD", "<Cmd>Pick lsp scope='definition'<CR>")
  vim.keymap.set("n", "gI", "<Cmd>Pick lsp scope='declaration'<CR>")
  -- Git: =======================================================================
  vim.keymap.set("n", "<leader>ga", "<cmd>:Git add .<CR>")
  vim.keymap.set("n", "<leader>gc", "<cmd>:Git commit<CR>")
  vim.keymap.set("n", "<leader>gC", "<Cmd>Git commit --amend<CR>")
  vim.keymap.set("n", "<leader>gp", "<cmd>:Git push -u origin main<CR>")
  vim.keymap.set("n", "<leader>gP", "<cmd>:Git pull<CR>")
  vim.keymap.set("n", "<leader>gd", "<Cmd>Git diff<CR>")
  vim.keymap.set("n", "<leader>gD", "<Cmd>Git diff -- %<CR>")
  vim.keymap.set("n", "<leader>gs", "<Cmd>lua MiniGit.show_at_cursor()<CR>")
  vim.keymap.set("n", "<leader>gl", [[<Cmd>Git log --pretty=format:\%h\ \%as\ │\ \%s --topo-order<CR>]])
  vim.keymap.set("n", "<leader>gh", [[<Cmd>lua MiniDiff.toggle_overlay()<CR>]])
  vim.keymap.set("n", "<leader>gx", [[<Cmd>lua MiniGit.show_at_cursor()<CR>]])
  -- Explorer: ==================================================================
  vim.keymap.set("n", "<leader>e",
    function() require("mini.files").open(vim.bo.buftype ~= "nofile" and vim.api.nvim_buf_get_name(0) or nil, true) end)
  vim.keymap.set("n", "<leader>E", function() require("mini.files").open(vim.uv.cwd(), true) end)
end)
--          ╔═════════════════════════════════════════════════════════╗
--          ║                          Neovide                        ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
  if vim.g.neovide then
    vim.keymap.set({ "n", "v" }, "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
  end
end)
--          ╔═════════════════════════════════════════════════════════╗
--          ║                          FileType                       ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
  vim.filetype.add({
    extension = {
      ["http"] = "http",
      ["json"] = "jsonc",
      ["map"] = "json",
      ["mdx"] = "markdown",
      ["ejs"] = "ejs"
    },
    filename = {
      ["xhtml"] = "html",
      ["tsconfig.json"] = "jsonc",
      ['.yamlfmt'] = 'yaml',
    },
    pattern = {
      ["%.env%.[%w_.-]+"] = "sh",
      [".gitconfig.*"] = "gitconfig",
    },
  })
end)
