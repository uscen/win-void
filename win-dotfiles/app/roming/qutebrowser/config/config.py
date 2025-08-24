#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Load                           ║
#               ╚═════════════════════════════════════════════════════════╝
config.load_autoconfig(False)
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Fonts                          ║
#               ╚═════════════════════════════════════════════════════════╝
# UI ==================================================================================
c.fonts.default_size = '14px'
c.fonts.default_family = "JetBrainsMono Nerd Font"
c.fonts.completion.entry = 'default_size default_family'
c.fonts.completion.category = 'bold default_size default_family'
c.fonts.debug_console = 'bold default_size default_family'
c.fonts.contextmenu = 'bold default_size default_family'
c.fonts.prompts = 'bold default_size default_family'
c.fonts.downloads = 'bold default_size default_family'
c.fonts.hints = 'bold default_size default_family'
c.fonts.keyhint = 'bold default_size default_family'
c.fonts.statusbar = 'bold default_size default_family'
c.fonts.tooltip = 'bold default_size default_family'
c.fonts.tabs.selected = "bold default_size default_family"
c.fonts.tabs.unselected = "bold default_size default_family"
# Web =================================================================================
c.fonts.web.family.fixed = 'JetBrainsMono Nerd Font'
c.fonts.web.family.serif = 'Times New Roman'
c.fonts.web.family.sans_serif = 'Arial'
c.fonts.web.family.standard = 'Arial'
c.fonts.web.family.fantasy = 'Arial'
c.fonts.web.size.default = 16
c.fonts.web.size.default_fixed = 14
c.fonts.web.size.minimum = 4
c.fonts.web.size.minimum_logical = 6
#               ╔═════════════════════════════════════════════════════════╗
#               ║                             Tabs                        ║
#               ╚═════════════════════════════════════════════════════════╝
c.tabs.wrap = True
c.tabs.background = True
c.tabs.tabs_are_windows = False
c.tabs.tooltips = False
c.tabs.width = 26
c.tabs.max_width = 320
c.tabs.min_width = 100
c.tabs.favicons.scale=1
c.tabs.undo_stack_size = 24
c.tabs.indicator.width = 0
c.tabs.indicator.padding = {'top': 0, 'bottom': 0, 'left': 0, 'right': 10}
c.tabs.padding = {"top": 4, "bottom": 4, "left": 4, "right": 4}
c.tabs.position = "left"
c.tabs.show = "switching"
c.tabs.show_switching_delay = 1000
c.tabs.favicons.show = "always"
c.tabs.last_close = "default-page"
c.tabs.close_mouse_button = 'middle'
c.tabs.close_mouse_button_on_bar = 'new-tab'
c.tabs.select_on_remove = 'prev'
c.tabs.title.alignment = 'left'
c.tabs.title.format = '{current_title}'
c.tabs.title.format_pinned = '{current_title}'
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Statusbar                       ║
#               ╚═════════════════════════════════════════════════════════╝
c.statusbar.show = 'never'
c.statusbar.position = 'bottom'
c.statusbar.padding = {'top': 1, 'bottom': 1, 'left': 0, 'right': 10}
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
c.completion.scrollbar.padding = 0
c.completion.height = "20%"
c.completion.scrollbar.width = 16
c.completion.open_categories = ['history']
c.completion.web_history.exclude = ['file://*', 'http://localhost:*', 'https://*.google.com', 'https://duckduckgo.com']
c.completion.show = "always"
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Hints                           ║
#               ╚═════════════════════════════════════════════════════════╝
c.hints.uppercase = True
c.hints.leave_on_load = False
c.hints.min_chars = 1
c.hints.radius = 2
c.hints.auto_follow = 'unique-match'
c.hints.mode = "letter"
c.hints.chars = "asdfghjkl"
c.hints.padding =  {"top": 2, "bottom": 2, "left": 2, "right": 2}
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Keyhint                         ║
#               ╚═════════════════════════════════════════════════════════╝
c.keyhint.delay = 200
c.keyhint.radius = 2
c.keyhint.blacklist = []
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Content                        ║
#               ╚═════════════════════════════════════════════════════════╝
# Style ===============================================================================
c.content.fullscreen.overlay_timeout = 0
c.content.prefers_reduced_motion = True
c.content.user_stylesheets = []
# Adblock =============================================================================
c.content.blocking.enabled = True
c.content.blocking.hosts.block_subdomains = True
c.content.blocking.method = "both"
c.content.blocking.whitelist = []
# Privacy =============================================================================
c.content.pdfjs = True
c.content.headers.do_not_track = True
c.content.fullscreen.window = True
c.content.images = True
c.content.xss_auditing = True
c.content.mute = False
c.content.autoplay = False
c.content.canvas_reading = False
c.content.geolocation = False
c.content.media.audio_capture = False
c.content.media.audio_video_capture = False
c.content.media.video_capture = False
c.content.desktop_capture = False
c.content.mouse_lock = False
c.content.persistent_storage = False
c.content.plugins = False
c.content.webrtc_ip_handling_policy = "default-public-interface-only"
c.content.default_encoding = "utf-8"
c.content.headers.referer = 'same-domain'
c.content.register_protocol_handler = 'ask'
c.content.tls.certificate_errors = 'ask'
c.content.unknown_url_scheme_policy = 'allow-from-user-interaction'
# Notifications =======================================================================
c.content.notifications.enabled = False
c.content.notifications.presenter = 'messages'
c.content.notifications.show_origin = True
# Cookies =============================================================================
c.content.cookies.store = True
c.content.cookies.accept = "no-3rdparty"
# Javascript ==========================================================================
c.content.javascript.enabled = True
c.content.javascript.alert = True
c.content.javascript.prompt = True
c.content.javascript.can_open_tabs_automatically = False
c.content.javascript.modal_dialog = False
c.content.local_content_can_access_file_urls = True
c.content.local_content_can_access_remote_urls = True
c.content.local_storage = True
c.content.javascript.clipboard = 'access'
# Enable everything in devtools =======================================================
for tool in ['devtools', 'chrome-devtools', 'chrome', 'qute']:
    with config.pattern(tool + '://*') as t:
        t.content.cookies.accept = 'all'
        t.content.images = True
        t.content.javascript.enabled = True
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Window                         ║
#               ╚═════════════════════════════════════════════════════════╝
c.window.hide_decoration = True
c.window.transparent = False
c.window.title_format = 'qtb: {current_title}'
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Zoom                           ║
#               ╚═════════════════════════════════════════════════════════╝
c.zoom.mouse_divider = 512
c.zoom.default = "100%"
c.zoom.levels = ["25%", "33%", "50%", "67%", "75%", "90%", "95%", "100%", "125%", "133%", "150%", "175%", "200%", "250%", "300%"]
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Others                         ║
#               ╚═════════════════════════════════════════════════════════╝
c.scrolling.smooth=True
c.auto_save.session=False
c.confirm_quit=["downloads"]
c.editor.command = ["alacritty", "-e", "nvim", "{file}"]
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         prompt                          ║
#               ╚═════════════════════════════════════════════════════════╝
c.prompt.filebrowser = True
c.prompt.radius = 0
#               ╔═════════════════════════════════════════════════════════╗
#               ║                       Spellcheck                        ║
#               ╚═════════════════════════════════════════════════════════╝
# c.spellcheck.languages = ['en-US']
#               ╔═════════════════════════════════════════════════════════╗
#               ║                        messages                         ║
#               ╚═════════════════════════════════════════════════════════╝
c.messages.timeout = 10000
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          URL                            ║
#               ╚═════════════════════════════════════════════════════════╝
c.url.open_base_url = True
c.url.auto_search = 'naive'
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
# General: ============================================================================
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
config.bind('T', 'hint links tab')
config.bind(',m', 'spawn mpv {url}')
config.bind(',M', 'hint links spawn mpv {hint-url}')
config.bind('yM', 'yank ;; spawn mpv {url}')
config.bind('tT', 'config-cycle tabs.position top left')
config.bind('ss', 'config-source')
config.bind('se', 'config-edit')
config.bind('<Ctrl-h>', 'history')
config.bind('<ctrl-y>', 'spawn --userscript ytdl.sh')
config.bind('tH', 'config-cycle tabs.show multiple never')
config.bind('tT', 'config-cycle tabs.position top left')
config.bind('sH', 'config-cycle statusbar.show always never')
config.bind('<Ctrl-Shift-i>', 'devtools')
config.bind('<Ctrl-Escape>', 'mode-leave', mode='passthrough')
config.bind('<Return>', 'prompt-accept yes', mode='yesno')
# hint ================================================================================
config.bind('<Ctrl-c>', 'mode-leave', mode='hint')
config.bind(';', 'hint links', mode='hint')
config.bind('B', 'hint links tab-bg', mode='hint')
config.bind('F', 'hint all', mode='hint')
config.bind('I', 'hint images run open -t -- {hint-url}', mode='hint')
config.bind('O', 'hint links fill :open -r -t {hint-url}', mode='hint')
config.bind('P', 'hint links run open -p {hint-url}', mode='hint')
config.bind('R', 'hint --rapid links tab-bg', mode='hint')
config.bind('T', 'hint links tab-fg', mode='hint')
config.bind('W', 'hint links window', mode='hint')
config.bind('m', 'hint all hover', mode='hint')
config.bind('o', 'hint links fill :open {hint-url}', mode='hint')
config.bind('t', 'hint inputs', mode='hint')
config.bind('x', 'hint all delete', mode='hint')
config.bind('y', 'hint links yank', mode='hint')
# Completion: =========================================================================
config.bind('<Ctrl-c>', 'mode-leave', mode='command')
config.bind('<Ctrl-n>', 'command-history-next', mode='command')
config.bind('<Ctrl-p>', 'command-history-prev', mode='command')
config.bind('<Ctrl-j>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl-k>', 'completion-item-focus prev', mode='command')
config.bind('<Ctrl-d>', 'completion-item-del', mode='command')
config.bind('<Ctrl-x>', 'completion-item-del', mode='command')
# prompt: =============================================================================
config.bind('<Ctrl-c>', 'mode-leave', mode='prompt')
config.bind('<Ctrl-d>', 'rl-delete-char', mode='prompt')
config.bind('<Ctrl-j>', 'prompt-item-focus next', mode='prompt')
config.bind('<Ctrl-k>', 'prompt-item-focus prev', mode='prompt')
config.bind('<Ctrl-n>', 'prompt-item-focus next', mode='prompt')
config.bind('<Ctrl-p>', 'prompt-item-focus prev', mode='prompt')

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
# Lighmode =============================================================================
config.set("colors.webpage.darkmode.enabled", False, "file://*")
config.set("colors.webpage.darkmode.enabled", False, "http://localhost:*")
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
# tooltips ============================================================================
c.colors.tooltip.bg                                = bg0_hard
c.colors.tooltip.fg                                = fg1
# Webpage =============================================================================
# c.colors.webpage.bg = bg0_soft
