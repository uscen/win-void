#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Load                           ║
#               ╚═════════════════════════════════════════════════════════╝
config.load_autoconfig(False)
#               ╔═════════════════════════════════════════════════════════╗
#               ║                           URL                           ║
#               ╚═════════════════════════════════════════════════════════╝
c.url.start_pages = ["https://web.tabliss.io/"]
c.url.default_page = "https://web.tabliss.io/"
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Fonts                          ║
#               ╚═════════════════════════════════════════════════════════╝
c.fonts.default_size = '11pt'
c.fonts.default_family = "JetBrainsMono Nerd Font"
c.fonts.completion.entry = '11pt "JetBrainsMono Nerd Font"'
c.fonts.debug_console = '11pt "JetBrainsMono Nerd Font"'
c.fonts.prompts = 'default_size sans-serif'
c.fonts.statusbar = '11pt "JetBrainsMono Nerd Font"'
c.fonts.tabs.selected = "11pt JetBrainsMono Nerd Font"
c.fonts.tabs.unselected = "11pt JetBrainsMono Nerd Font"
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Statusbar                       ║
#               ╚═════════════════════════════════════════════════════════╝
c.statusbar.show = 'never'
c.statusbar.position = 'bottom'
c.statusbar.widgets = ['progress', 'keypress', 'url', 'scroll', 'history', 'tabs']

#               ╔═════════════════════════════════════════════════════════╗
#               ║                             Tabs                        ║
#               ╚═════════════════════════════════════════════════════════╝
c.tabs.position = "left"
c.tabs.width = 36
c.tabs.show = "multiple"
c.tabs.max_width = 240
c.tabs.min_width = 100
c.tabs.favicons.show = "always"
c.tabs.favicons.scale=1
c.tabs.padding = {"top": 2, "bottom": 2, "left": 2, "right": 2}
c.tabs.indicator.width = 2
c.tabs.wrap = True
c.tabs.background = True
c.tabs.last_close = "default-page"
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Others                         ║
#               ╚═════════════════════════════════════════════════════════╝
c.window.hide_decoration = True
c.auto_save.session=True
c.scrolling.smooth=True
c.confirm_quit=["multiple-tabs", "downloads"]
c.editor.command = ["alacritty", "-e", "nvim", "{file}"]
c.completion.web_history.max_items = 0
c.completion.height=200
c.completion.use_best_match = False
c.completion.show = "never"
c.content.autoplay = False
# Adblock =============================================================================
c.content.blocking.enabled = True
c.content.blocking.method = "both"
c.content.headers.do_not_track = True
# Privacy =============================================================================
c.content.cookies.accept = "no-3rdparty"
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Themes                          ║
#               ╚═════════════════════════════════════════════════════════╝
# Darkmode =============================================================================
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.policy.images = "smart"
c.colors.webpage.darkmode.policy.page = "smart"
# Palette ==============================================================================
bg0_hard   = "#0d0c0c"
bg0_normal = "#181616"
bg0_soft   = "#201d1d"
bg1        = "#282727"
bg2        = "#393836"
bg3        = "#625e5a"
fg0        = "#c5c9c5"
fg1        = "#b4b3a7"

red        = "#c34043"
orange     = "#ffa066"
green      = "#98bb6c"
blue       = "#7e9cd8"
purple     = "#957fb8"
cyan       = "#658594"
comment    = "#727169"

# Completion ===========================================================================
c.colors.completion.fg                     = fg0
c.colors.completion.odd.bg                 = bg0_hard
c.colors.completion.even.bg                = bg0_hard
c.colors.completion.category.fg            = blue
c.colors.completion.category.bg            = bg1
c.colors.completion.category.border.top    = bg1
c.colors.completion.category.border.bottom = bg1
c.colors.completion.item.selected.fg       = fg0
c.colors.completion.item.selected.bg       = bg3
c.colors.completion.item.selected.border.top    = bg2
c.colors.completion.item.selected.border.bottom = bg2
c.colors.completion.match.fg               = orange
c.colors.completion.scrollbar.fg           = fg0
c.colors.completion.scrollbar.bg           = bg1
# Context menu ========================================================================
c.colors.contextmenu.menu.bg      = bg0_hard
c.colors.contextmenu.menu.fg      = fg1
c.colors.contextmenu.disabled.bg  = bg2
c.colors.contextmenu.disabled.fg  = fg1
c.colors.contextmenu.selected.bg  = bg3
c.colors.contextmenu.selected.fg  = fg1
# Downloads ===========================================================================
c.colors.downloads.bar.bg           = bg0_hard
c.colors.downloads.start.fg         = bg0_hard
c.colors.downloads.start.bg         = green
c.colors.downloads.stop.fg          = fg0
c.colors.downloads.stop.bg          = cyan
c.colors.downloads.error.fg         = red
# Hints & Keyhint =====================================================================
c.colors.hints.fg            = bg0_hard
c.colors.hints.bg            = f"rgba({int(orange[1:3],16)}, {int(orange[3:5],16)}, {int(orange[5:7],16)}, 200)"
c.colors.hints.match.fg      = bg3
c.colors.keyhint.fg          = fg1
c.colors.keyhint.suffix.fg   = fg0
c.colors.keyhint.bg          = bg0_hard
# Messages ============================================================================
c.colors.messages.error.fg    = bg0_hard
c.colors.messages.error.bg    = red
c.colors.messages.error.border= red
c.colors.messages.warning.fg  = bg0_hard
c.colors.messages.warning.bg  = purple
c.colors.messages.warning.border = purple
c.colors.messages.info.fg     = fg1
c.colors.messages.info.bg     = bg0_hard
c.colors.messages.info.border = bg0_hard
# Prompts =============================================================================
c.colors.prompts.fg           = fg1
c.colors.prompts.bg           = bg2
c.colors.prompts.border       = f"1px solid {bg1}"
c.colors.prompts.selected.bg  = bg3
# Statusbar ===========================================================================
c.colors.statusbar.normal.fg       = fg1
c.colors.statusbar.normal.bg       = bg0_normal
c.colors.statusbar.insert.fg       = bg0_hard
c.colors.statusbar.insert.bg       = cyan
c.colors.statusbar.passthrough.fg  = bg0_hard
c.colors.statusbar.passthrough.bg  = blue
c.colors.statusbar.private.fg      = purple
c.colors.statusbar.private.bg      = bg0_hard
c.colors.statusbar.command.fg      = fg1
c.colors.statusbar.command.bg      = bg1
c.colors.statusbar.command.private.fg = purple
c.colors.statusbar.command.private.bg = bg1
c.colors.statusbar.caret.fg        = bg0_hard
c.colors.statusbar.caret.bg        = purple
c.colors.statusbar.caret.selection.fg = bg0_hard
c.colors.statusbar.caret.selection.bg = purple
c.colors.statusbar.url.fg          = fg1
c.colors.statusbar.url.error.fg    = red
c.colors.statusbar.url.warn.fg     = orange
c.colors.statusbar.url.success.http.fg  = red
c.colors.statusbar.url.success.https.fg = fg0
c.colors.statusbar.url.hover.fg    = orange
c.colors.statusbar.progress.bg     = green
# Tabs ================================================================================
c.colors.tabs.bar.bg              = bg0_normal
c.colors.tabs.odd.fg              = fg1
c.colors.tabs.odd.bg              = bg2
c.colors.tabs.even.fg             = fg1
c.colors.tabs.even.bg             = bg3
c.colors.tabs.selected.odd.fg     = fg1
c.colors.tabs.selected.odd.bg     = bg0_hard
c.colors.tabs.selected.even.fg    = fg1
c.colors.tabs.selected.even.bg    = bg0_hard
c.colors.tabs.pinned.even.bg      = green
c.colors.tabs.pinned.even.fg      = bg2
c.colors.tabs.pinned.odd.bg       = green
c.colors.tabs.pinned.odd.fg       = bg2
c.colors.tabs.pinned.selected.even.bg = bg0_hard
c.colors.tabs.pinned.selected.even.fg = fg1
c.colors.tabs.pinned.selected.odd.bg  = bg0_hard
c.colors.tabs.pinned.selected.odd.fg  = fg1
# Webpage ==============================================================================
c.colors.webpage.bg = bg0_soft
