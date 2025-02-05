-----------------------------------------------------------
-- Statusline
-----------------------------------------------------------
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    -- disable until lualine loads
    vim.opt.laststatus = 0
  end,
  opts = function()
    -- miasma colors
    local colors = {
      bg = "#1d2021",
      black = "#1d2021",
      grey = "#666666",
      red = "#685742",
      green = "#5f875f",
      yellow = "#B36D43",
      blue = "#78824B",
      magenta = "#bb7744",
      cyan = "#C9A554",
      white = "#D7C483",
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width_first = function()
        return vim.fn.winwidth(0) > 80
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 70
      end,
    }
    -- config
    local config = {
      options = {
        disabled_filetypes = { "alpha", "oil" },
        ignore_focus = { "toggleterm", "TelescopePrompt", "mason", "lazy" },
        globalstatus = true,
        always_show_tabline = true,
        -- remove default sections and component separators
        component_separators = "",
        section_separators = "",
        theme = {
          -- setting defaults to statusline
          normal = { c = { fg = colors.fg, bg = colors.bg } },
          inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
      },
      sections = {
        -- clear defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- clear for later use
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        -- clear defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- clear for later use
        lualine_c = {},
        lualine_x = {},
      },
    }

    -- insert active component in lualine_c at left section
    local function active_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    -- insert inactive component in lualine_c at left section
    local function inactive_left(component)
      table.insert(config.inactive_sections.lualine_c, component)
    end

    -- insert active component in lualine_x at right section
    local function active_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    -- dump object contents
    local function dump(o)
      if type(o) == "table" then
        local s = ""
        for k, v in pairs(o) do
          if type(k) ~= "number" then
            k = '"' .. k .. '"'
          end
          s = s .. dump(v) .. ","
        end
        return s
      else
        return tostring(o)
      end
    end

    -- active left section
    active_left({
      "buffers",
      mode = 0,
      show_filename_only = true,
      use_mode_colors = true,
      show_modified_status = true,
      filetype_names = {
        TelescopePrompt = "TELESCOPE PICKER",
        dashboard = "DASHBOARD",
        fzf = "FZF PICKER",
        alpha = "DASHBOARD",
      },
      buffers_color = {
        active = { bg = colors.red, fg = colors.fg },
        inactive = { bg = colors.bg, fg = colors.grey },
      },
      symbols = {
        modified = " ●",
        alternate_file = "",
        directory = "",
      },
    })

    -- inactive left section
    inactive_left({
      function()
        return ""
      end,
      cond = conditions.buffer_not_empty,
      color = { bg = colors.black, fg = colors.grey },
      padding = { left = 1, right = 1 },
    })
    inactive_left({
      "filename",
      cond = conditions.buffer_not_empty,
      color = { bg = colors.black, fg = colors.grey },
      padding = { left = 1, right = 1 },
      separator = { right = "▓▒░" },
      symbols = {
        modified = "",
        readonly = "",
        unnamed = "",
        newfile = "",
      },
    })

    -- active right section
    active_right({
      function()
        local clients = vim.lsp.get_active_clients()
        local clients_list = {}
        for _, client in pairs(clients) do
          if not clients_list[client.name] then
            table.insert(clients_list, client.name)
          end
        end
        local lsp_lbl = dump(clients_list):gsub("(.*),", "%1")
        return lsp_lbl:gsub(",", ", ")
      end,
      icon = " ",
      color = { bg = colors.green, fg = colors.black },
      padding = { left = 1, right = 1 },
      cond = conditions.hide_in_width_first,
      separator = { right = "▓▒░", left = "░▒▓" },
    })

    active_right({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " " },
      colored = false,
      color = { bg = colors.magenta, fg = colors.black },
      padding = { left = 1, right = 1 },
      separator = { right = "▓▒░", left = "░▒▓" },
    })
    active_right({
      "searchcount",
      color = { bg = colors.cyan, fg = colors.black },
      padding = { left = 1, right = 1 },
      separator = { right = "▓▒░", left = "░▒▓" },
    })
    --
    return config
  end,
}
