-----------------------------------------------------------
-- UndoTree:
-----------------------------------------------------------
return {
	"mbbill/undotree",
	event = "BufEnter",
	config = function()
		-- set the persistent_undo
		vim.cmd([[if !exists('g:undotree_WindowLayout')
                  let g:undotree_WindowLayout = 3
              endif

              if has("persistent_undo")
                  let target_path = expand('~/.undodir/UNDOTREE_PERSISTENTANCE')

                  " create the directory and any parent directories
                  " if the location does not exist.
                  if !isdirectory(target_path)
                      call mkdir(target_path, "p", 0700)
                  endif

                  let &undodir=target_path
                  set undofile
              endif ]])
		-- set the keymaps
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })
	end,
}
