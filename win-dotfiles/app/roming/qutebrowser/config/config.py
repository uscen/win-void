#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Load                           ║
#               ╚═════════════════════════════════════════════════════════╝
config.load_autoconfig(False)
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Fonts                          ║
#               ╚═════════════════════════════════════════════════════════╝
# UI ==================================================================================
c.fonts.default_size = '10pt'
c.fonts.default_family = "JetBrainsMono Nerd Font"
c.fonts.completion.entry = '10pt "JetBrainsMono Nerd Font"'
c.fonts.debug_console = '10pt "JetBrainsMono Nerd Font"'
c.fonts.prompts = 'default_size default_family'
c.fonts.statusbar = '10pt "JetBrainsMono Nerd Font"'
c.fonts.tabs.selected = "10pt JetBrainsMono Nerd Font"
c.fonts.tabs.unselected = "10pt JetBrainsMono Nerd Font"
# Web =================================================================================
c.fonts.web.size.default = 20
c.fonts.web.family.fixed = 'monospace'
c.fonts.web.family.sans_serif = 'monospace'
c.fonts.web.family.serif = 'monospace'
c.fonts.web.family.standard = 'monospace'
c.fonts.web.family.fantasy = 'Arial'
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Statusbar                       ║
#               ╚═════════════════════════════════════════════════════════╝
c.statusbar.show = 'in-mode'
c.statusbar.position = 'bottom'
c.statusbar.widgets = ['progress', 'keypress', 'url', 'scroll', 'history', 'tabs']
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Downloads                       ║
#               ╚═════════════════════════════════════════════════════════╝
c.downloads.location.remember = True
c.downloads.remove_finished = 5000
c.downloads.location.directory = r"C:\Users\lli\Downloads"
c.downloads.location.suggestion = "both"
c.downloads.position = 'bottom'
#               ╔═════════════════════════════════════════════════════════╗
#               ║                             Tabs                        ║
#               ╚═════════════════════════════════════════════════════════╝
c.tabs.wrap = True
c.tabs.background = True
c.tabs.width = 26
c.tabs.max_width = 240
c.tabs.min_width = 100
c.tabs.position = "left"
c.tabs.show = "multiple"
c.tabs.favicons.show = "always"
c.tabs.favicons.scale=1
c.tabs.padding = {"top": 4, "bottom": 4, "left": 4, "right": 4}
c.tabs.indicator.width = 0
c.tabs.last_close = "default-page"
#               ╔═════════════════════════════════════════════════════════╗
#               ║                       Completion                        ║
#               ╚═════════════════════════════════════════════════════════╝
c.completion.use_best_match = True
c.completion.quick = True
c.completion.web_history.max_items = 0
c.completion.delay = 0
c.completion.height=300
c.completion.open_categories = ['quickmarks', 'bookmarks', 'filesystem']
c.completion.show = "always"
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Others                         ║
#               ╚═════════════════════════════════════════════════════════╝
c.content.fullscreen.window = True
c.window.hide_decoration = True
c.auto_save.session=True
c.scrolling.smooth=True
c.content.autoplay = False
c.confirm_quit=["downloads"]
c.editor.command = ["alacritty", "-e", "nvim", "{file}"]
c.zoom.default = "100%"
c.zoom.levels = ["25%", "33%", "50%", "67%", "75%", "90%", "95%", "100%", "125%", "133%", "150%", "175%", "200%", "250%", "300%"]
# Adblock =============================================================================
c.content.blocking.enabled = True
c.content.headers.do_not_track = True
c.content.blocking.method = "both"
# Privacy =============================================================================
c.content.canvas_reading = False
c.content.geolocation = False
c.content.webrtc_ip_handling_policy = "default-public-interface-only"
c.content.cookies.accept = "no-3rdparty"
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          URL                            ║
#               ╚═════════════════════════════════════════════════════════╝
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "p":  "https://engine.presearch.org/search?q={}",
    "b":  "https://search.brave.com/search?q={}",
    "d":  "https://duckduckgo.com/?q={}",
    "s":  "https://www.startpage.com/do/asearch?q={}",
    "g":  "https://google.com/search?q={}",
    "pr": "https://www.protondb.com/search?q={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "al": "https://allegro.pl/listing?string={}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "th": "https://www.thingiverse.com/search?q={}",
    "at": "https://alternativeto.net/browse/search?q={}",
    "th":  "https://duckduckgo.com/?q={} site:thingiverse.com",
    "tr":  "https://translate.google.pl/?text={}",
}
#               ╔═════════════════════════════════════════════════════════╗
#               ║                       Keybidings                        ║
#               ╚═════════════════════════════════════════════════════════╝
config.unbind('d')
config.bind('dd', 'tab-close')
config.bind('do', 'tab-only')
config.bind('<Ctrl-0>', 'zoom')
config.bind('<Ctrl-=>', 'zoom-in')
config.bind('<Ctrl-->', 'zoom-out')
config.bind('zi', 'zoom-in')
config.bind('zo', 'zoom-out')
config.bind('gJ', 'tab-move +')
config.bind('gK', 'tab-move -')
config.bind('gm', 'tab-move')
config.bind('gp', 'open -p')
config.bind('qm', 'macro-record')
config.bind('h', 'history')
config.bind('T', 'hint links tab')
config.bind('M', 'hint images download')
config.bind('m', 'hint links spawn mpv {hint-url}')
config.bind('tT', 'config-cycle tabs.position top left')
config.bind('cs', 'cmd-set-text -s :config-source')
config.bind('ce', 'config-edit')
config.bind('<ctrl-y>', 'spawn --userscript ytdl.sh')
config.bind('<Ctrl-j>', 'completion-item-focus --history next', mode='command')
config.bind('<Ctrl-k>', 'completion-item-focus --history prev', mode='command')
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Themes                          ║
#               ╚═════════════════════════════════════════════════════════╝
# Darkmode =============================================================================
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.threshold.background = 100
c.colors.webpage.darkmode.threshold.foreground = 150
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
# Normal ==============================================================================
red        = "#c34043"
orange     = "#ffa066"
green      = "#98bb6c"
blue       = "#7e9cd8"
purple     = "#957fb8"
cyan       = "#658594"
comment    = "#727169"
# Bright ==============================================================================
red0        = "#c4746e"
orange0     = "#b98d7b"
green0      = "#8a9a7b"
blue0       = "#8ba4b0"
purple0     = "#a292a3"
cyan0       = "#8992a7"
# Completion ===========================================================================
c.colors.completion.fg                            = fg0
c.colors.completion.odd.bg                        = bg0_normal
c.colors.completion.even.bg                       = bg0_normal
c.colors.completion.category.fg                   = green
c.colors.completion.category.bg                   = bg0_soft
c.colors.completion.category.border.top           = bg1
c.colors.completion.category.border.bottom        = bg1
c.colors.completion.item.selected.fg              = fg0
c.colors.completion.item.selected.bg              = bg1
c.colors.completion.item.selected.border.top      = bg2
c.colors.completion.item.selected.border.bottom   = bg2
c.colors.completion.match.fg                      = green
c.colors.completion.scrollbar.fg                  = fg0
c.colors.completion.scrollbar.bg                  = bg1
# Context menu ========================================================================
c.colors.contextmenu.menu.bg                      = bg0_normal
c.colors.contextmenu.menu.fg                      = fg1
c.colors.contextmenu.disabled.bg                  = bg0_hard
c.colors.contextmenu.disabled.fg                  = fg1
c.colors.contextmenu.selected.bg                  = bg1
c.colors.contextmenu.selected.fg                  = fg1
# Downloads ===========================================================================
c.colors.downloads.bar.bg                         = bg0_hard
c.colors.downloads.start.fg                       = bg0_hard
c.colors.downloads.start.bg                       = green
c.colors.downloads.stop.fg                        = fg0
c.colors.downloads.stop.bg                        = cyan
c.colors.downloads.error.fg                       = red
# Hints & Keyhint =====================================================================
c.colors.hints.fg                                 = bg0_hard
c.colors.hints.bg                                 = green0
c.hints.border                                    = f"3px solid {green0}"
c.colors.hints.match.fg                           = bg3
c.colors.keyhint.fg                               = fg1
c.colors.keyhint.suffix.fg                        = fg0
c.colors.keyhint.bg                               = bg0_hard
# Messages ============================================================================
c.colors.messages.error.fg                        = bg0_hard
c.colors.messages.error.bg                        = red
c.colors.messages.error.border                    = red
c.colors.messages.warning.fg                      = bg0_hard
c.colors.messages.warning.bg                      = purple
c.colors.messages.warning.border                  = purple
c.colors.messages.info.fg                         = fg1
c.colors.messages.info.bg                         = bg0_hard
c.colors.messages.info.border                     = bg0_hard
# Prompts =============================================================================
c.colors.prompts.fg                               = fg1
c.colors.prompts.bg                               = bg0_soft
c.colors.prompts.border                           = f"1px solid {bg1}"
c.colors.prompts.selected.bg                      = bg3
# Statusbar ===========================================================================
c.colors.statusbar.normal.fg                      = fg1
c.colors.statusbar.normal.bg                      = bg0_normal
c.colors.statusbar.insert.fg                      = bg0_hard
c.colors.statusbar.insert.bg                      = green
c.colors.statusbar.passthrough.fg                 = bg0_hard
c.colors.statusbar.passthrough.bg                 = blue
c.colors.statusbar.private.fg                     = purple
c.colors.statusbar.private.bg                     = bg0_hard
c.colors.statusbar.command.fg                     = fg1
c.colors.statusbar.command.bg                     = bg1
c.colors.statusbar.command.private.fg             = purple
c.colors.statusbar.command.private.bg             = bg1
c.colors.statusbar.caret.fg                       = bg0_hard
c.colors.statusbar.caret.bg                       = purple
c.colors.statusbar.caret.selection.fg             = bg0_hard
c.colors.statusbar.caret.selection.bg             = purple
c.colors.statusbar.url.fg                         = fg1
c.colors.statusbar.url.error.fg                   = red
c.colors.statusbar.url.warn.fg                    = orange
c.colors.statusbar.url.success.http.fg            = red
c.colors.statusbar.url.success.https.fg           = fg0
c.colors.statusbar.url.hover.fg                   = orange
c.colors.statusbar.progress.bg                    = green
# Tabs ================================================================================
c.colors.tabs.bar.bg                              = bg0_normal
c.colors.tabs.odd.fg                              = fg1
c.colors.tabs.odd.bg                              = bg0_normal
c.colors.tabs.even.fg                             = fg1
c.colors.tabs.even.bg                             = bg0_normal
c.colors.tabs.selected.odd.fg                     = fg1
c.colors.tabs.selected.odd.bg                     = bg0_hard
c.colors.tabs.selected.even.fg                    = fg1
c.colors.tabs.selected.even.bg                    = bg0_hard
c.colors.tabs.pinned.even.bg                      = green
c.colors.tabs.pinned.even.fg                      = bg2
c.colors.tabs.pinned.odd.bg                       = green
c.colors.tabs.pinned.odd.fg                       = bg2
c.colors.tabs.pinned.selected.even.bg             = bg0_hard
c.colors.tabs.pinned.selected.even.fg             = fg1
c.colors.tabs.pinned.selected.odd.bg              = bg0_hard
c.colors.tabs.pinned.selected.odd.fg              = fg1
# Webpage ==============================================================================
c.colors.webpage.bg = bg0_soft
