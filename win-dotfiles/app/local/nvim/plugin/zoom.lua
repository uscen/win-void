--          ╔═════════════════════════════════════════════════════════╗
--          ║                           Zoom                          ║
--          ╚═════════════════════════════════════════════════════════╝
local M = {}
-- Internal function for zooming in: =============================================================
local function zoom_in()
    vim.cmd([[tab split]])
    vim.api.nvim_tabpage_set_var(0, "simple-zoom", "zoom")
end

-- Internal function for zooming out: ============================================================
local function zoom_out()
    vim.cmd([[mkview]])
    vim.cmd([[tab close]])
    vim.cmd([[loadview]])
end

-- Main function to toggle zoom state: ===========================================================
function M.toggle_zoom()
    -- Check for tab-specific variable and call the appropriate zoom function
    if not vim.t["simple-zoom"] then
        zoom_in()
    elseif vim.t["simple-zoom"] == "zoom" then
        zoom_out()
    end
end

-- Add `ZoomToggle` user command: ================================================================
vim.api.nvim_create_user_command("ZoomToggle", M.toggle_zoom, { desc = "Toggle Simple Zoom on and off" })
