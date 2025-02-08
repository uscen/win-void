-----------------------------------------------------------
-- Oil
-----------------------------------------------------------
return {
  "stevearc/oil.nvim",
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
  config = function()
    require("oil").setup({
      vim.keymap.set("n", "<leader>e", "<CMD>OilToggle<CR>", { desc = "Open parent directory" }),
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      watch_for_changes = true,
      delete_to_trash = false,
      use_default_keymaps = false,
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<TAB>"] = "actions.select",
        ["<S-TAB>"] = "actions.parent",
        ["<C-h>"] = "actions.parent",
        ["<C-v>"] = "actions.select_split",
        ["<C-b>"] = "actions.select_vsplit",
        -- ["<C-l>"] = "actions.select",
        -- ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-r>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["H"] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
      },
    })
  end
}
