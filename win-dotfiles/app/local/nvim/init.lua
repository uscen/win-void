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
--          │                     Mini.Misc                           │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require('mini.misc').setup_auto_root({ '.git', "package.json" }, vim.fs.dirname)
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Trailspace                     │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require("mini.trailspace").setup()
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = "MiniTrailspace",
    callback = function()
      MiniTrailspace.trim()
      MiniTrailspace.trim_last_lines()
    end,
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.keymaps                        │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  local map_multistep = require('mini.keymap').map_multistep
  map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
	map_multistep("i", "<BS>", { "minipairs_bs", "decrease_indent" })
  map_multistep('i', '<C-j>', { 'pmenu_next' })
  map_multistep('i', '<C-k>', { 'pmenu_prev' })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Notify                         │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  require('mini.notify').setup({
    lsp_progress = { enable = false, duration_last = 500 },
    window = {
      config = function()
        local has_statusline = vim.o.laststatus > 0
        local pad = vim.o.cmdheight + (has_statusline and 1 or 0)
        return { anchor = "SE", col = vim.o.columns, row = vim.o.lines - pad }
      end,
      max_width_share = 0.45,
    },
  })
  vim.notify = require('mini.notify').make_notify()
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
    n_lines = 500,
    search_method = "cover_or_nearest",
    mappings = {
      around = "a",
      inside = "i",
      around_next = "an",
      inside_next = "in",
      around_last = "al",
      inside_last = "il",
      goto_left = "{",
      goto_right = "}",
    },
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
			find = "sf",
			find_left = "sF",
			highlight = "sh",
			replace = "cs",
			update_n_lines = "sn",
			suffix_last = "l",
			suffix_next = "n",
    },
  })
  -- custom quotes surrounding rotation for quick access: ===========================
  local function SurroundOrReplaceQuotes()
    local word = vim.fn.expand('<cword>')
    local row, old_pos = unpack(vim.api.nvim_win_get_cursor(0))
    vim.fn.search(word, 'bc', row)
    local _, word_pos = unpack(vim.api.nvim_win_get_cursor(0))
    local line_str = vim.api.nvim_get_current_line()
    local before_word = line_str:sub(0, word_pos)
    local pairs_count = 0
    for _ in before_word:gmatch('["\'`]') do
      pairs_count = pairs_count + 1
    end
    if pairs_count % 2 == 0 then
      vim.cmd("normal ysiw\"")
      vim.api.nvim_win_set_cursor(0, { row, old_pos + 1 })
      return
    end
    for i = #before_word, 1, -1 do
      local char = before_word:sub(i, i)
      if char == "'" then
        vim.cmd("normal cs'\"")
        vim.api.nvim_win_set_cursor(0, { row, old_pos })
        return
      end
      if char == '"' then
        vim.cmd("normal cs\"`")
        vim.api.nvim_win_set_cursor(0, { row, old_pos })
        return
      end
      if char == '`' then
        vim.cmd("normal cs`'")
        vim.api.nvim_win_set_cursor(0, { row, old_pos })
        return
      end
    end
  end
  vim.keymap.set({ "n" }, "sq", SurroundOrReplaceQuotes)
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
    footer = table.concat({
     "An idiot admires complexity, a genius admires simplicity.",
     "",
      "It's - " .. os.date('%x %X'),
     "",
      "Pwd: " .. vim.fn.getcwd(),
    }, "\n"),
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Mini.Completion                     │
--          ╰─────────────────────────────────────────────────────────╯
now(function()
  -- enable Mini.Completion: ==============================================================
  require("mini.completion").setup({
    delay = { completion = 50, info = 40, signature = 30 },
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
      auto_setup = false,
      process_items = function(items, base)
        return require('mini.completion').default_process_items(items, base, {
          filtersort = 'fuzzy',
          kind_priority = {
            Text = -1,
            Snippet = 99,
          },
        })
      end,
    },
  })
  -- enable configured language servers 0.11: =================================================
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
          empty_tabstop_final = '†'
        })
      end
    },
  })
  require('mini.snippets').start_lsp_server({ match = false })
  -- Expand Snippets Or complete by Tab ===============================================
  local expand_or_complete = function()
    if #MiniSnippets.expand({ insert = false }) > 0 then
      vim.schedule(MiniSnippets.expand); return ''
    end
    return vim.fn.pumvisible() == 1 and
        (vim.fn.complete_info().selected == -1 and vim.keycode('<c-n><c-y>') or vim.keycode('<c-y>')) or "<Tab>"
  end
  vim.keymap.set('i', '<Tab>', expand_or_complete, { expr = true })
  -- exit snippet sessions on entering normal mode: =======================================
  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniSnippetsSessionStart',
    callback = function()
      vim.api.nvim_create_autocmd('ModeChanged', {
        pattern = '*:n',
        once = true,
        callback = function()
          while MiniSnippets.session.get() do
            MiniSnippets.session.stop()
          end
        end
      })
    end
  })
  -- exit snippets upon reaching final tabstop: ========================================
  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniSnippetsSessionJump',
    callback = function(args)
      if args.data.tabstop_to == '0' then MiniSnippets.session.stop() end
    end
  })
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
  vim.g.mapleader                = vim.keycode("<space>")
  vim.g.maplocalleader           = vim.g.mapleader
  -- Use ripgrep as grep tool: ================================================
  vim.opt.grepprg                = "rg --vimgrep --no-heading"
  vim.opt.grepformat             = "%f:%l:%c:%m,%f:%l:%m"
  vim.opt.path                   = ".,,**"
  -- Shell: =-================================================================
  vim.opt.sh                     = "nu"
  vim.opt.shellcmdflag           = "--stdin --no-newline -c"
  vim.opt.shellredir             = "out+err> %s"
  vim.opt.shellxescape           = ""
  vim.opt.shellxquote            = ""
  vim.opt.shellquote             = ""
  -- General: ================================================================
  vim.opt.undofile               = true
  vim.opt.wildmenu               = true
  vim.opt.wildignorecase         = true
  vim.opt.compatible             = false
  vim.opt.swapfile               = false
  vim.opt.writebackup            = false
  vim.opt.backup                 = false
  vim.opt.undolevels             = 1024
  vim.opt.fileencoding           = "utf-8"
  vim.opt.encoding               = "utf-8"
  vim.opt.clipboard              = "unnamedplus"
  vim.opt.wildmode               = "longest:full,full"
  vim.opt.wildoptions            = "fuzzy,pum"
  vim.opt.wildignore             = "*.zip,*.tar.gz,*.png,*.jpg,*.pdf,*.mp4,*.exe,*.pyc,*.o"
  vim.opt.omnifunc               = "v:lua.vim.lsp.omnifunc"
  vim.opt.completeopt            = "menu,menuone,popup,noselect,fuzzy"
  vim.opt.complete               = ".,w,b,kspell"
  vim.opt.switchbuf              = "usetab"
  vim.opt.shada                  = { "'10", "<0", "s10", "h" }
  vim.opt.undodir                = vim.fn.stdpath("data") .. "/undo"
  -- Spelling ================================================================
  vim.opt.spell                  = false
  vim.opt.spelllang              = "en_us"
  vim.opt.spelloptions           = "camel"
  vim.opt.spellsuggest           = "best,8"
  vim.opt.dictionary             = vim.fn.stdpath("config") .. "/misc/dict/english.txt"
  -- UI: ====================================================================
  vim.opt.number                 = true
  vim.opt.termguicolors          = true
  vim.opt.smoothscroll           = true
  vim.opt.splitright             = true
  vim.opt.splitbelow             = true
  vim.opt.cursorline             = true
  vim.opt.equalalways            = true
  vim.opt.title                  = true
  vim.opt.tgc                    = true
  vim.opt.relativenumber         = false
  vim.opt.list                   = false
  vim.opt.modeline               = false
  vim.opt.showmode               = false
  vim.opt.errorbells             = false
  vim.opt.emoji                  = false
  vim.opt.ruler                  = false
  vim.opt.numberwidth            = 3
  vim.opt.linespace              = 3
  vim.opt.laststatus             = 3
  vim.opt.cmdheight              = 0
  vim.opt.winwidth               = 20
  vim.opt.winminwidth            = 5
  vim.opt.scrolloff              = 5
  vim.opt.sidescrolloff          = 5
  vim.opt.showtabline            = 0
  vim.opt.cmdwinheight           = 30
  vim.opt.pumwidth               = 20
  vim.opt.pumblend               = 15
  vim.opt.pumheight              = 8
  vim.opt.titlelen               = 127
  vim.opt.colorcolumn            = "130"
  vim.opt.guicursor              = ""
  vim.opt.guifont                = "JetBrainsMono Nerd Font:h9"
  vim.opt.titlestring            = "%{getcwd()} : %{expand(\"%:r\")} [%M] ― Neovim"
  vim.opt.splitkeep              = 'screen'
  vim.opt.mousemodel             = "popup"
  vim.opt.mousescroll            = "ver:3,hor:6"
  vim.opt.showbreak              = '󰘍'
  vim.opt.winborder              = "double"
  vim.opt.backspace              = "indent,eol,start"
  vim.opt.cursorlineopt          = "screenline,number"
  vim.opt.shortmess              = "FOSWIaco"
  vim.wo.signcolumn              = "yes"
  vim.opt.statuscolumn           = ""
  vim.opt.fillchars              = "eob: ,fold: ,foldopen:,foldsep: ,foldclose:"
  vim.opt.listchars              = { eol = "↲", tab = '» ', trail = "+", extends = ">", precedes = "<", space = "·", nbsp = "␣", }
  -- Editing:  ================================================================
  vim.opt.cindent                = true
  vim.opt.autoindent             = true
  vim.opt.expandtab              = true
  vim.opt.ignorecase             = true
  vim.opt.incsearch              = true
  vim.opt.infercase              = true
  vim.opt.smartcase              = true
  vim.opt.smartindent            = true
  vim.opt.gdefault               = true
  vim.opt.confirm                = true
  vim.opt.breakindent            = true
  vim.opt.copyindent             = true
  vim.opt.startofline            = true
  vim.opt.autowrite              = true
  vim.opt.wrapscan               = true
  vim.opt.wrap                   = false
  vim.opt.showmatch              = false
  vim.opt.textwidth              = 10
  vim.opt.wrapmargin             = 2
  vim.opt.tabstop                = 2
  vim.opt.shiftwidth             = 2
  vim.opt.softtabstop            = 2
  vim.opt.conceallevel           = 3
  vim.opt.concealcursor          = "c"
  vim.opt.cedit                  = "^F"
  vim.opt.breakindentopt         = "list:-1"
  vim.opt.inccommand             = "split"
  vim.opt.jumpoptions            = "view"
  vim.opt.whichwrap              = "b,s,<,>,[,],h,l"
  vim.opt.iskeyword              = "@,48-57,_,192-255,-"
  vim.opt.formatlistpat          = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]
  vim.opt.virtualedit            = "block"
  vim.opt.formatoptions          = "rqnl1j"
  vim.opt.formatexpr             = "v:lua.require'conform'.formatexpr()"
  vim.opt.sessionoptions         = { "buffers", "curdir", "tabpages", "winsize", "globals" }
  vim.opt.diffopt                = { "algorithm:minimal", "closeoff", "context:8", "filler", "internal", "linematch:100", "indent-heuristic" }
  -- Folds:  ================================================================
  vim.opt.foldenable             = false
  vim.opt.foldlevelstart         = 99
  vim.opt.foldlevel              = 90
  vim.opt.foldnestmax            = 10
  vim.opt.foldminlines           = 3
  vim.opt.foldcolumn             = "0"
  vim.opt.foldopen               = "hor,mark,tag,search,insert,quickfix,undo"
  vim.opt.foldexpr               = "nvim_treesitter#foldexpr()"
  vim.opt.foldmethod             = "expr"
  vim.opt.foldtext               = ""
  -- Memory: ================================================================
  vim.opt.lazyredraw             = true
  vim.opt.hidden                 = true
  vim.opt.ttimeoutlen            = 0
  vim.opt.updatetime             = 50
  vim.opt.history                = 100
  vim.opt.synmaxcol              = 200
  vim.opt.timeoutlen             = 300
  vim.opt.redrawtime             = 10000
  vim.opt.maxmempattern          = 10000
  -- Disable netrw: =========================================================
  vim.g.loaded_netrw             = 1
  vim.g.loaded_netrwPlugin       = 1
  vim.g.loaded_netrwSettings     = 1
  vim.g.loaded_netrwFileHandlers = 1
  vim.g.loaded_netrw_gitignore   = 1
  -- Disable health checks for these providers:. ===========================
  vim.g.loaded_python_provider   = 0
  vim.g.loaded_python3_provider  = 0
  vim.g.loaded_ruby_provider     = 0
  vim.g.loaded_perl_provider     = 0
  vim.g.loaded_node_provider     = 0
  -- Disable builtin plugins: ===============================================
  local disabled_built_ins       = {
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
  -- AutoSave: =====================================================================
  vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'VimLeavePre' }, {
    group = vim.api.nvim_create_augroup('save_buffers', {}),
    callback = function(event)
      local buf = event.buf
      if vim.api.nvim_get_option_value('modified', { buf = buf }) then
        vim.schedule(function()
          vim.api.nvim_buf_call(buf, function()
            vim.cmd 'silent! write'
          end)
        end)
      end
    end
  })
  -- Don't Comment New Line =========================================================
  vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      group = vim.api.nvim_create_augroup("diable-new-line-comments", {}),
      callback = function()
          vim.opt_local.formatoptions:remove("o")
          vim.opt_local.formatoptions:remove("r")
          vim.opt_local.formatoptions:remove("c")
      end,
  })
  -- Highlight Yank =================================================================
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    callback = function()
      vim.highlight.on_yank({ on_macro = true, on_visual = true, higroup = 'IncSearch', timeout = 200 })
    end,
  })
  -- Auto-resize splits on window resize:  =========================================
  vim.api.nvim_create_autocmd("VimResized", {
    group = vim.api.nvim_create_augroup("resize_splits", { clear = true }),
    callback = function()
      vim.cmd("wincmd =")
    end,
  })
  -- Remove hl search when Move Or  enter Insert : ==================================
  local clear_hl = vim.api.nvim_create_augroup("hl_clear", { clear = true })
  vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
      group = clear_hl,
      callback = vim.schedule_wrap(function()
          vim.cmd.nohlsearch()
      end),
  })
  vim.api.nvim_create_autocmd("CursorMoved", {
    group = clear_hl,
    callback = function()
      if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
        vim.schedule(function()
          vim.cmd.nohlsearch()
        end)
      end
    end,
  })
  -- Auto-close terminal when process exits: ========================================
  vim.api.nvim_create_autocmd("TermClose", {
    group = vim.api.nvim_create_augroup("term_close", {}),
    callback = function()
      if vim.v.event.status == 0 then
        vim.api.nvim_buf_delete(0, {})
      end
    end,
  })
  -- Auto create directories before save: ==========================================
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
    callback = function(event)
      local file = vim.fn.fnamemodify(event.match, ':p')
      local dir = vim.fn.fnamemodify(file, ":p:h")
      local success, _ = vim.fn.isdirectory(dir)
      if not success then
        vim.fn.system({ "mkdir", "-p", dir })
      end
    end,
  })
  -- go to last loc when opening a buffer: ===========================================
  vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("last_loc", { clear = true }),
    callback = function()
      local mark = vim.api.nvim_buf_get_mark(0, '"')
      local lcount = vim.api.nvim_buf_line_count(0)
      if mark[1] > 0 and mark[1] <= lcount then
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
      end
    end,
  })
  -- Check if we need to reload the file when it changed: ===============================
  vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = vim.api.nvim_create_augroup("checktime", { clear = true }),
    callback = function()
      if vim.o.buftype ~= "nofile" then
        vim.cmd("checktime")
      end
    end,
  })
  -- Eable wrap in This files: ==========================================================
  vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup("wrap_spell", { clear = true }),
    pattern = { 'markdown', 'text', 'textile', 'log' },
    callback = function()
      vim.opt_local.wrap       = true
      vim.opt_local.spell      = true
      vim.opt_local.linebreak  = true
      vim.opt_local.signcolumn = false
    end,
  })
  -- clear jump list at start:===========================================================
  vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("clear_jumps", { clear = true }),
    callback = function()
      vim.cmd("clearjumps")
    end,
  })
  -- Fix conceallevel for json files: ================================================
  vim.api.nvim_create_autocmd({ "FileType" }, {
    group = vim.api.nvim_create_augroup("json_conceal", { clear = true }),
    pattern = { "json", "jsonc", "json5" },
    callback = function()
      vim.opt_local.conceallevel = 0
    end,
  })
  -- Start insert mode in git commit messages: =========================================
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("git_insert", { clear = true }),
    pattern = { "gitcommit", "gitrebase" },
    command = "startinsert | 1",
  })
  -- Qucikfix List: ==================================================================
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("quickfix_keys", { clear = true }),
    pattern = "qf",
    callback = function(event)
      local opts = { buffer = event.buf, silent = true }
      vim.keymap.set('n', '<C-j>', '<cmd>cn<CR>zz<cmd>wincmd p<CR>', opts)
      vim.keymap.set('n', '<C-k>', '<cmd>cN<CR>zz<cmd>wincmd p<CR>', opts)
      vim.keymap.set('n', '<Tab>', '<CR>', opts)
    end
  })
  -- show cursor line only in active window:  ===========================================
  local cursorline_active_window_augroup = vim.api.nvim_create_augroup("cursorline-active-window", { clear = true })
  vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
    group = cursorline_active_window_augroup,
    callback = function()
      if vim.w.auto_cursorline then
        vim.wo.cursorline = true
        vim.w.auto_cursorline = nil
      end
    end,
  })
  vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
    group = cursorline_active_window_augroup,
    callback = function()
      if vim.wo.cursorline then
        vim.w.auto_cursorline = true
        vim.wo.cursorline = false
      end
    end,
  })
  -- Make it easier to close man-files when opened inline: ==============================
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("man_unlisted", { clear = true }),
    pattern = { "man" },
    callback = function(event)
      vim.bo[event.buf].buflisted = false
    end,
  })
  -- close some filetypes with <q>: ======================================================
  vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup("q_close", { clear = true }),
    pattern = { 'qf', 'man', 'help', 'query', 'notify', 'lspinfo', 'startuptime', 'checkhealth' },
    callback = function(event)
      local bo = vim.bo[event.buf]
      if bo.filetype ~= 'markdown' or bo.buftype == 'help' then
        -- bo.buflisted = false
        vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
      end
    end,
  })
  -- Large file handling: ===========================================================
  vim.api.nvim_create_autocmd("BufReadPre", {
    group = vim.api.nvim_create_augroup("disable_in_bigfile", { clear = true }),
    callback = function(ev)
      -- Disable certain features for files larger than 10MB
      local max_size = 10 * 1024 * 1024 -- 10MB
      local file_size = vim.fn.getfsize(ev.match)
      if file_size > max_size or file_size == -2 then
        -- Disable features that might slow down Vim
        vim.opt_local.spell = false
        vim.opt_local.undofile = false
        vim.opt_local.swapfile = false
        vim.opt_local.backup = false
        vim.opt_local.writebackup = false
        vim.opt_local.foldenable = false
        vim.g.did_install_syntax_menu = 1
        vim.cmd("syntax clear")
        vim.cmd("syntax off")
        vim.notify("Large file detected. Some features disabled.", vim.log.levels.WARN)
      end
    end,
  })
  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
      local line_count = vim.api.nvim_buf_line_count(0)
      if line_count > 5000 then
        vim.cmd("syntax clear")
        vim.cmd("syntax off")
      end
    end,
  })
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                 Neovim user_commands                    │
--          ╰─────────────────────────────────────────────────────────╯
later(function ()
  -- LSP code action:=======================================================================
  vim.api.nvim_create_user_command("CodeAction", function()
    vim.lsp.buf.code_action()
  end, {})
  -- Print and copy file full path:=========================================================
  vim.api.nvim_create_user_command("Path", function()
    local path = vim.fn.expand("%:p")
    if path == "" then return end
    print(path)
    vim.fn.setreg("+", path)
  end, {})
  -- Eable FormatOnSave ====================================================================
  vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
    vim.notify("Format On Save Enable")
  end, {
  })
  -- Disable FormatOnSave =================================================================
  vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
      vim.b.disable_autoformat = true
    else
      vim.g.disable_autoformat = true
    end
    vim.notify("Format On Save Disable")
  end, {
    bang = true,
  })

end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                Neovim misspelled_commands               │
--          ╰─────────────────────────────────────────────────────────╯
later(function ()
  local misspelled_commands = { "W", "Wq", "WQ", "Q", "Qa", "QA", "Wqa", "WQa", "WQA" }
  for _, command in pairs(misspelled_commands) do
      vim.api.nvim_create_user_command(command, function()
          vim.cmd(string.lower(command))
      end, { bang = true })
  end
end)
--          ╭─────────────────────────────────────────────────────────╮
--          │                     Neovim keymaps                      │
--          ╰─────────────────────────────────────────────────────────╯
later(function()
  -- General: =======================================================================
  vim.keymap.set("n", "<leader>q", ":close<CR>")
  vim.keymap.set("n", "<leader>wq", ":close<CR>")
  vim.keymap.set("n", "<leader>qq", ":qa<CR>")
  vim.keymap.set("n", "<C-s>", ":silent up<CR>")
  vim.keymap.set("i", "<C-s>", "<ESC> :up<CR>")
  vim.keymap.set("i", "<c-y>", "<Esc>viwUea")
  vim.keymap.set("i", "<c-t>", "<Esc>b~lea")
  vim.keymap.set("i", "<C-A>", "<HOME>")
  vim.keymap.set("i", "<C-E>", "<END>")
  vim.keymap.set("c", "<C-A>", "<HOME>")
  vim.keymap.set("i", "<C-l>", "<space>=><space>")
  vim.keymap.set("i", "<C-h>", "<space><=<space>")
  vim.keymap.set({ "n", "v" }, "gk", "gg")
  vim.keymap.set({ "n", "v" }, "gj", "G")
  vim.keymap.set({ "n", "v" }, "gh", "^")
  vim.keymap.set({ "n", "v" }, "gl", "$")
  vim.keymap.set({ "n", "x" }, ";", ":")
  vim.keymap.set({ "n", "v" }, "mm", "%")
  vim.keymap.set("n", "M", "m")
  vim.keymap.set("n", "<C-c>", "cit")
  vim.keymap.set('n', 'U', '<C-r>')
  vim.keymap.set('n', 'Q', '<nop>')
  vim.keymap.set('n', '<Space>', '<Nop>')
  vim.keymap.set("n", "<ESC>", ":nohl<CR>")
  vim.keymap.set("n", "ycc", "yygccp", { remap = true })
  vim.keymap.set('n', 'yco', 'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>')
  vim.keymap.set('n', 'ycO', 'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>')
  vim.keymap.set("n", "J", "mzJ`z:delmarks z<CR>")
  vim.keymap.set("x", "/", "<Esc>/\\%V")
  vim.keymap.set("x", "R", ":s###g<left><left><left>")
  vim.keymap.set("n", "<leader>y", "<cmd>%yank<cr>")
  vim.keymap.set("v", "y", "y`]")
  vim.keymap.set("v", "p", "p`]")
  vim.keymap.set("n", "p", "p`]")
  vim.keymap.set("x", "gr", '"_dP')
  vim.keymap.set("n", "x", '"_x')
  vim.keymap.set('n', 'c', '"_c')
  vim.keymap.set('n', 'cc', '"_cc')
  vim.keymap.set('n', 'C', '"_C')
  vim.keymap.set("x", "c", '"_c')
  vim.keymap.set("v", "<", "<gv")
  vim.keymap.set("v", ">", ">gv")
  vim.keymap.set("v", "<TAB>", ">gv")
  vim.keymap.set("v", "<S-TAB>", "<gv")
  vim.keymap.set("x", "<TAB>", ">gv")
  vim.keymap.set("x", "<S-TAB>", "<gv")
  vim.keymap.set("x", "$", "g_")
  vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
  vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
  vim.keymap.set("c", "%%", "<C-R>=expand('%:h').'/'<cr>")
  vim.keymap.set("n", "<leader>nc", ":e ~/.config/nvim/init.lua<CR>")
  vim.keymap.set("n", "<leader>p", "m`o<ESC>p``")
  vim.keymap.set("n", "<leader>P", "m`O<ESC>p``")
  vim.keymap.set("n", "<space>o", "printf('m`%so<ESC>``', v:count1)", {expr = true})
  vim.keymap.set("n", "<space>O", "printf('m`%sO<ESC>``', v:count1)", {expr = true})
  vim.keymap.set("n", "<leader>v", "printf('`[%s`]', getregtype()[0])", { expr = true, })
  vim.keymap.set('n', 'gV', '"`[" . strpart(getregtype(), 0, 1) . "`]"', { expr = true, replace_keycodes = false })
  vim.keymap.set("n", "gy", "`[v`]")
  -- window: ========================================================================
  vim.keymap.set("n", "<leader>wc", "<cmd>close<cr>")
  vim.keymap.set('n', '<leader>wo', "<cmd>only<cr>")
  vim.keymap.set('n', '<leader>wv', "<cmd>split<cr>")
  vim.keymap.set('n', '<leader>ws', "<cmd>vsplit<cr>")
  vim.keymap.set("n", "<leader>|",  "<cmd>wincmd v<cr>")
  vim.keymap.set("n", "<leader>-",  "<cmd>wincmd s<cr>")
  vim.keymap.set("n", "<leader>wT", "<cmd>wincmd T<cr>")
  vim.keymap.set("n", "<leader>wr", "<cmd>wincmd r<cr>")
  vim.keymap.set("n", "<leader>wR", "<cmd>wincmd R<cr>")
  vim.keymap.set("n", "<leader>wH", "<cmd>wincmd H<cr>")
  vim.keymap.set("n", "<leader>wJ", "<cmd>wincmd J<cr>")
  vim.keymap.set("n", "<leader>wK", "<cmd>wincmd K<cr>")
  vim.keymap.set("n", "<leader>wL", "<cmd>wincmd L<cr>")
  vim.keymap.set("n", "<leader>w=", "<cmd>wincmd =<cr>")
  vim.keymap.set("n", "<leader>wk", "<cmd>resize +5<cr>")
  vim.keymap.set("n", "<leader>wj", "<cmd>resize -5<cr>")
  vim.keymap.set("n", "<leader>wh", "<cmd>vertical resize +3<cr>")
  vim.keymap.set("n", "<leader>wl", "<cmd>vertical resize -3<cr>")
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
  vim.keymap.set("n", "<leader>L", "<C-w>L")
  vim.keymap.set("n", "<leader>H", "<C-w>H")
  vim.keymap.set("n", "<leader>K", "<C-w>K")
  vim.keymap.set("n", "<leader>J", "<C-w>J")
  -- Theme: ========================================================================
  vim.keymap.set("n", "<leader>ud", "<cmd>set background=dark<CR>")
  vim.keymap.set("n", "<leader>ul", "<cmd>set background=light<CR>")
  vim.keymap.set("n", "<leader>ur", "<cmd>colorscheme randomhue<CR>")
  -- Subtitle Keys: =================================================================
  vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
  vim.keymap.set("n", "<Leader>r", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]])
  vim.keymap.set('n', 'S', function() return ':%s/\\<' .. vim.fn.escape(vim.fn.expand('<cword>'), '/\\') .. '\\>/' end, { expr = true })
  -- Brackted: =====================================================================
  vim.keymap.set("n", "[a", "<cmd>previous<CR>")
  vim.keymap.set("n", "]a", "<cmd>next<CR>")
  vim.keymap.set("n", "[b", "<cmd>bprevious<CR>")
  vim.keymap.set("n", "]b", "<cmd>bnext<CR>")
  vim.keymap.set("n", "[q", "<cmd>cprevious<CR>")
  vim.keymap.set("n", "]q", "<cmd>cnext<CR>")
  vim.keymap.set("n", "[Q", "<cmd>cfirst<cr>")
  vim.keymap.set("n", "]Q", "<cmd>clast<cr>")
  vim.keymap.set("n", "[l", "<cmd>lprevious<CR>")
  vim.keymap.set("n", "]l", "<cmd>lnext<CR>")
  vim.keymap.set("n", "[<space>", ":<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[")
  vim.keymap.set("n", "]<space>", ":<c-u>put =repeat(nr2char(10), v:count1)<cr>']")
  vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end)
  vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end)
  -- Buffers: =======================================================================
  vim.keymap.set("n", "<Tab>", ":bnext<CR>")
  vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")
  vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
  vim.keymap.set("n", "<leader>bp", ":bprevious<CR>")
  vim.keymap.set("n", "<leader>bd", ":bd<CR>")
  vim.keymap.set("n", "<leader>bm", function() require("mini.misc").zoom() end)
  vim.keymap.set("n", "<leader>m", function() require("mini.misc").zoom(0, { width = vim.o.columns, height = vim.o.lines }) end)
  vim.keymap.set('n', '<space>bb', function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if buf ~= vim.fn.bufnr() and vim.fn.buflisted(buf) == 1 then
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
  -- TermNavigation: ==============================================================
  vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
  vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
  vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
  vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")
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
  vim.keymap.set("n", "<leader>e", function() require("mini.files").open(vim.bo.buftype ~= "nofile" and vim.api.nvim_buf_get_name(0) or nil, true) end)
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
      ["pcss"] = "css",
      ["ejs"] = "ejs",
      ["h"] = "c"
    },
    filename = {
      ["TODO"] = 'markdown',
      ["README"] = 'markdown',
      ["readme"] = 'markdown',
      ["xhtml"] = "html",
      ["tsconfig.json"] = "jsonc",
      ['.yamlfmt'] = 'yaml',
    },
    pattern = {
      ["requirements.*.txt"] = "requirements",
      [".*/git/config.*"] = "git_config",
      [".gitconfig.*"] = "gitconfig",
      ["%.env%.[%w_.-]+"] = "sh",
      [".*/*.conf*"] = "conf",
      ["*.MD"] = "markdown",
    },
  })
end)
