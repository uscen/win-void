-----------------------------------------------------------
-- Blink cmp Completions:
-----------------------------------------------------------
return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  version = "*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "enter",
      ["<CR>"] = {},
      ["<Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<S-k>"] = { "scroll_documentation_up", "fallback" },
      ["<S-j>"] = { "scroll_documentation_down", "fallback" },
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-n>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<C-p>"] = { "hide", "fallback" },
    },

    completion = {
      list = {
        max_items = 10,
        selection = {
          preselect = true
        }
      },
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        auto_show = true,
        min_width = 40,
        border = {
          { "󱐋", "WarningMsg" },
          "─",
          "╮",
          "│",
          "╯",
          "─",
          "╰",
          "│",
        },
        winhighlight = "Normal:Normal,FloatBorder:Comment,CursorLine:CursorLine,Search:None",
        draw = {
          treesitter = { "lsp" },
          columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind", gap = 1 } },
          components = {
            kind = {
              text = function(ctx)
                local len = 10 - string.len(ctx.kind)
                local space = string.rep(" ", len)
                return ctx.kind .. space .. '[' .. ctx.source_name .. ']'
              end
            }
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          winhighlight = "Normal:Normal,FloatBorder:Comment,CursorLine:CursorLine,Search:None",
          desired_min_height = 30,
          max_width = 120,
          min_width = 50,
          border = {
            { "", "DiagnosticHint" },
            "─",
            "╮",
            "│",
            "╯",
            "─",
            "╰",
            "│",
          },
        },
      },
      ghost_text = {
        enabled = false,
      },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
      kind_icons = {
        Text = "󰦨",
        Snippet = "",
        File = "󰈙",
        Folder = "󰉋",
        Method = "󰊕",
        Function = "󰡱",
        Constructor = "",
        Field = "󰇽",
        Variable = "󰀫",
        Class = "󰜁",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Color = "󰏘",
        Reference = "",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰅲",
      },
    },
    sources = {
      default = { 'snippets', 'lsp', 'path', 'buffer' },
      providers = {
        snippets = {
          min_keyword_length = 1,
          score_offset = 4,
        },
        lsp = {
          min_keyword_length = 0,
          score_offset = 3,
          name = "LSP",
          module = "blink.cmp.sources.lsp",
          fallbacks = {},
        },
        path = {
          min_keyword_length = 0,
          score_offset = 2,
        },
        buffer = {
          min_keyword_length = 1,
          score_offset = 1,
        },
      },
      cmdline = {},
    },
    signature = {
      enabled = true,
      window = {
        border = {
          { "", "DiagnosticHint" },
          "─",
          "╮",
          "│",
          "╯",
          "─",
          "╰",
          "│",
        },
        winhighlight = "Normal:Normal,FloatBorder:Comment,CursorLine:CursorLine,Search:None",
      },
    },
  },
  opts_extend = { "sources.default" },
}
