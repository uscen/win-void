local wezterm = require("wezterm")
return {
	-----------------------------------------------------------
	-- Change default Shell:
	-----------------------------------------------------------
	default_prog = { 'bash.exe' },
	-----------------------------------------------------------
	-- Ararbic Support:
	-----------------------------------------------------------
	bidi_enabled = true,
	bidi_direction = "LeftToRight",
	-----------------------------------------------------------
	-- Wayland Configurations:
	-----------------------------------------------------------
	enable_wayland = true,
	front_end = "WebGpu",
	-- front_end = "OpenGL", -- current work-around for https://github.com/wez/wezterm/issues/4825
	webgpu_power_preference = "HighPerformance",
	-----------------------------------------------------------
	-- Fonts Configurations:
	-----------------------------------------------------------
	font = wezterm.font("JetBrainsMono NF", { weight = "Medium", stretch = "Normal", style = "Normal" }),
	font_size = 11.0,
	font_rules = {
		{
			italic = true,
			font = wezterm.font("JetBrainsMono NF", { weight = "Medium", stretch = "Normal", style = "Italic" }),
		},
		{
			intensity = "Bold",
			font = wezterm.font("JetBrainsMono NF", { weight = "Bold", stretch = "Normal", style = "Normal" }),
		},
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font("JetBrainsMono NF", { weight = "Bold", stretch = "Normal", style = "Italic" }),
		},
	},
	-----------------------------------------------------------
	-- Colorscheme Configurations:
	-----------------------------------------------------------
	color_scheme = "gruvbox_material_dark_hard",
	color_schemes = {
		["gruvbox_material_dark_medium"] = {
			foreground = "#D4BE98",
			background = "#282828",
			cursor_bg = "#D4BE98",
			cursor_border = "#D4BE98",
			cursor_fg = "#282828",
			selection_bg = "#D4BE98",
			selection_fg = "#45403d",

			ansi = { "#282828", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
			brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
		},
		["gruvbox_material_dark_hard"] = {
			foreground = "#D4BE98",
			background = "#141617",
			cursor_bg = "#D4BE98",
			cursor_border = "#D4BE98",
			cursor_fg = "#1D2021",
			selection_bg = "#D4BE98",
			selection_fg = "#3C3836",

			ansi = { "#1d2021", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
			brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
		},
	},
	colors = {
		split = "#1b1b1b",
		visual_bell = "#1b1b1b",
	},
	-----------------------------------------------------------
	-- Window Configurations:
	-----------------------------------------------------------
	-- window_background_opacity = 0.97,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	-----------------------------------------------------------
	-- Tab Configurations:
	-----------------------------------------------------------
	tab_bar_at_bottom = false,
	enable_tab_bar = true,
	use_fancy_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	-----------------------------------------------------------
	-- ScrollBar Configurations:
	-----------------------------------------------------------
	scrollback_lines = 5000,
	enable_scroll_bar = false,
	check_for_updates = false,
	-----------------------------------------------------------
	-- Animation Configurations:
	-----------------------------------------------------------
	animation_fps = 1,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	visual_bell = {
		fade_in_function = "EaseIn",
		fade_in_duration_ms = 150,
		fade_out_function = "EaseOut",
		fade_out_duration_ms = 150,
	},
	-----------------------------------------------------------
	-- Keybidings Configurations:
	-----------------------------------------------------------
	leader = { key = "a", mods = "CTRL" },
	disable_default_key_bindings = true,
	keys = {
		-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
		{ key = "a", mods = "LEADER|CTRL",  action = wezterm.action({ SendString = "\x01" }) },
		{ key = "v", mods = "LEADER",       action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ key = "b", mods = "LEADER",       action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
		{ key = "z", mods = "LEADER",       action = "TogglePaneZoomState" },
		{ key = "c", mods = "LEADER",       action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "h", mods = "LEADER",       action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "j", mods = "LEADER",       action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ key = "k", mods = "LEADER",       action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "l", mods = "LEADER",       action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "H", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
		{ key = "J", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
		{ key = "K", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
		{ key = "L", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
		{ key = "1", mods = "LEADER",       action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "2", mods = "LEADER",       action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "3", mods = "LEADER",       action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "4", mods = "LEADER",       action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "5", mods = "LEADER",       action = wezterm.action({ ActivateTab = 4 }) },
		{ key = "6", mods = "LEADER",       action = wezterm.action({ ActivateTab = 5 }) },
		{ key = "7", mods = "LEADER",       action = wezterm.action({ ActivateTab = 6 }) },
		{ key = "8", mods = "LEADER",       action = wezterm.action({ ActivateTab = 7 }) },
		{ key = "9", mods = "LEADER",       action = wezterm.action({ ActivateTab = 8 }) },
		{ key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
		{ key = "x", mods = "LEADER",       action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },

		{ key = "n", mods = "SHIFT|CTRL",   action = "ToggleFullScreen" },
		{ key = "v", mods = "SHIFT|CTRL",   action = wezterm.action.PasteFrom("Clipboard") },
		{ key = "c", mods = "SHIFT|CTRL",   action = wezterm.action.CopyTo("Clipboard") },
	},
	set_environment_variables = {},
}
