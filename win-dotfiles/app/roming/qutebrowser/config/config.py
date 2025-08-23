#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Load                           ║
#               ╚═════════════════════════════════════════════════════════╝
config.load_autoconfig()
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Fonts                          ║
#               ╚═════════════════════════════════════════════════════════╝
# UI ==================================================================================
c.fonts.default_size = '10pt'
c.fonts.default_family = "JetBrainsMono Nerd Font"
c.fonts.completion.entry = '10pt "JetBrainsMono Nerd Font"'
c.fonts.debug_console = '10pt "JetBrainsMono Nerd Font"'
c.fonts.prompts = 'default_size default_family'
c.fonts.hints = 'default_size default_family'
c.fonts.statusbar = '10pt "JetBrainsMono Nerd Font"'
c.fonts.tabs.selected = "10pt JetBrainsMono Nerd Font"
c.fonts.tabs.unselected = "10pt JetBrainsMono Nerd Font"
# Web =================================================================================
c.fonts.web.size.default = 16
c.fonts.web.family.fixed = 'monospace'
c.fonts.web.family.sans_serif = 'monospace'
c.fonts.web.family.serif = 'monospace'
c.fonts.web.family.standard = 'monospace'
c.fonts.web.family.fantasy = 'Arial'
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
#               ║                         Statusbar                       ║
#               ╚═════════════════════════════════════════════════════════╝
c.statusbar.show = 'never'
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
#               ║                       Completion                        ║
#               ╚═════════════════════════════════════════════════════════╝
c.completion.use_best_match = True
c.completion.quick = True
c.completion.web_history.max_items = 10000
c.completion.delay = 0
c.completion.height=300
c.completion.open_categories = ['quickmarks', 'bookmarks', 'history', 'filesystem']
c.completion.show = "always"
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Hints                           ║
#               ╚═════════════════════════════════════════════════════════╝
c.hints.mode = "letter"
c.hints.chars = "asdfghjkl"
c.hints.min_chars = 1
c.hints.radius = 2
c.hints.padding =  {"top": 2, "bottom": 2, "left": 2, "right": 2}
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Content                        ║
#               ╚═════════════════════════════════════════════════════════╝
# Adblock =============================================================================
c.content.blocking.enabled = True
c.content.headers.do_not_track = True
c.content.blocking.method = "both"
# Privacy =============================================================================
c.content.fullscreen.window = True
c.content.canvas_reading = False
c.content.geolocation = False
c.content.webrtc_ip_handling_policy = "default-public-interface-only"
c.content.cookies.accept = "no-3rdparty"
c.content.autoplay = False
c.content.cookies.accept = "all"
c.content.cookies.store = True
c.content.default_encoding = "utf-8"
c.content.javascript.enabled = True
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Others                         ║
#               ╚═════════════════════════════════════════════════════════╝
c.window.hide_decoration = True
c.scrolling.smooth=True
c.auto_save.session=False
c.confirm_quit=["downloads"]
c.editor.command = ["alacritty", "-e", "nvim", "{file}"]
c.zoom.default = "110%"
c.zoom.levels = ["25%", "33%", "50%", "67%", "75%", "90%", "95%", "100%", "110%", "125%", "133%", "150%", "175%", "200%", "250%", "300%"]
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          URL                            ║
#               ╚═════════════════════════════════════════════════════════╝
c.url.default_page = r"C:\Users\lli\AppData\Roaming\qutebrowser\config\startpage\index.html"
c.url.start_pages = [ r"C:\Users\lli\AppData\Roaming\qutebrowser\config\startpage\index.html" ]
c.url.searchengines = {
    # search engines ==================================================================
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'd': 'https://duckduckgo.com/?q={}',
    'g': 'https://www.google.com/search?q={}',
    'gi': 'https://www.google.com/search?tbm=isch&q={}&tbs=imgo:1',
    'gn': 'https://news.google.com/search?q={}',
    'b': 'https://www.bing.com/search?q={}',
    'i': 'https://yandex.com/search/?text={}',
    's': 'https://swisscows.com/web?culture=en&query={}',
    'y': 'https://www.youtube.com/results?search_query={}&search=Search',
    'yt': 'https://www.youtube.com/results?search_query={}&search=Search',
    'w': 'https://en.wikipedia.org/wiki/{}',
    # maps ============================================================================
    'm': 'https://www.google.com/maps/search/{}',
    # entertainment ===================================================================
    'r': 'https://www.reddit.com/r/{}/',
    'rr': 'https://www.reddit.com/search?q={}',
    'p': 'https://www.pinterest.com/search/pins/?q={}',
    'fb': 'https://www.facebook.com/s.php?q={}',
    'ig': 'https://www.instagram.com/explore/tags/{}',
    'tw': 'https://twitter.com/search?q={}',
    # arch linux ======================================================================
    'aur': 'http://aur.archlinux.org/packages.php?O=0&L=0&C=0&K={}',
    'arch': 'https://archlinux.org/packages/?q={}',
    'wiki': 'https://wiki.archlinux.org/index.php/Special:Search?search={}',
    # translate =======================================================================
    'ro': 'https://translate.google.com/?sl=auto&tl=ro&text={}&op=translate',
    'en': 'https://translate.google.com/?sl=auto&tl=en&text={}&op=translate',
    'ru': 'https://translate.google.com/?sl=auto&tl=ru&text={}&op=translate',
    'ja': 'https://translate.google.com/?sl=auto&tl=ja&text={}&op=translate',
    # language ========================================================================
    'urban': 'https://www.urbandictionary.com/define.php?term={}',
    'dict_2': 'https://thefreedictionary.com/{}',
    'mg': 'https://www.merriam-webster.com/dictionary/%{}',
    'th': 'https://www.merriam-webster.com/thesaurus/%{}',
    'pron': 'https://www.thesaurus.com/browse/{}',
    'dex': 'https://dexonline.ro/definitie/{}',
    # books ===========================================================================
    'libgen': 'https://libgen.rs/search.php?req={}',
    'ana': 'https://annas-archive.org/search?q=%{}',
    # anime ===========================================================================
    'z': 'https://zoro.to/search?keyword={}',
    'torrent': 'https://www.1377x.to/search/{}/1/',
    'pirate': 'https://thepiratebay.org/search.php?q={}',
    # tech ============================================================================
    'gh': 'https://github.com/search?o=desc&q={}&s=stars',
    'gist': 'https://gist.github.com/search?q={}',
    'hub': 'http://github.com/search?q={}',
    'lab': 'https://gitlab.com/search?search={}&group_id=&project_id=&snippets=false&repository_ref=&nav_source=navbar',
    'pk': 'https://porkbun.com/checkout/search?prb=ce1274dcf2&q={}&tlds=&idnLanguage=&search=search&csrf_pb=e78192c1c41609bac923887d0a45b5ec',
    'repo': 'http://github.com/catalinplesu/{}',
    'wolframalpha': 'http://www.wolframalpha.com/input/?i={}',
    # md buy ==========================================================================
    '9': 'https://999.md/ro/search?query={}',
    'pandashop': 'https://www.pandashop.md/ro/search/?text={}',
    'smadshop': 'https://smadshop.md/ro/search/?search={}',
    'ultra': 'https://ultra.md/search?search={}',
    'cacturs': 'https://www.cactus.md/ru/search/?q={}',
    # buy china =======================================================================
    'joom': 'https://www.joom.com/en/search/q.{}',
    'aliexpress': 'https://www.aliexpress.com/wholesale?catId=0&initiative_id=SB_20220103075220&SearchText={}',
    'amazon': 'https://www.amazon.com/s?k={}',
    'temu': 'https://www.temu.com/search_result.html?search_key={}'
}
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Aliases                        ║
#               ╚═════════════════════════════════════════════════════════╝
c.aliases['e'] = 'session-load'
c.aliases['w'] = 'session-save'
c.aliases['wq'] = 'quit --save'
#               ╔═════════════════════════════════════════════════════════╗
#               ║                       Keybidings                        ║
#               ╚═════════════════════════════════════════════════════════╝
config.unbind('d')
config.bind('dd', 'tab-close')
config.bind('do', 'tab-only')
config.bind('co', 'download-open')
config.bind('ce', 'download-cancel')
config.bind('cc', 'download-clear')
config.bind('cr', 'download-retry')
config.bind('sa', 'hint all download')
config.bind('si', 'hint images download')
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
config.bind('hh', 'history')
config.bind('hc', 'history-clear')
config.bind('<Ctrl-h>', 'history')
config.bind('T', 'hint links tab')
config.bind('m', 'spawn mpv {url}')
config.bind('M', 'hint links spawn mpv {hint-url}')
config.bind('yM', 'yank ;; spawn mpv {url}')
config.bind('tT', 'config-cycle tabs.position top left')
config.bind('ss', 'cmd-set-text -s :config-source')
config.bind('se', 'config-edit')
config.bind('<ctrl-y>', 'spawn --userscript ytdl.sh')
config.bind('<Ctrl-j>', 'completion-item-focus --history next', mode='command')
config.bind('<Ctrl-k>', 'completion-item-focus --history prev', mode='command')
config.bind('tH', 'config-cycle tabs.show multiple never')
config.bind('tT', 'config-cycle tabs.position top left')
config.bind('sH', 'config-cycle statusbar.show always never')
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Themes                          ║
#               ╚═════════════════════════════════════════════════════════╝
# Darkmode =============================================================================
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.threshold.background = 100
c.colors.webpage.darkmode.threshold.foreground = 150
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = "never"
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
c.hints.border                                    = f"2 solid {green}"
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
