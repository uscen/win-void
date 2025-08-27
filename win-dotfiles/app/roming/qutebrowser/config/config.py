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
c.tabs.mousewheel_switching = False
c.tabs.width = 26
c.tabs.max_width = 320
c.tabs.min_width = 100
c.tabs.favicons.scale=1
c.tabs.undo_stack_size = 24
c.tabs.indicator.width = 0
c.tabs.indicator.padding = {'top': 10, 'bottom': 10, 'left': 5, 'right': 10}
c.tabs.padding = {"top": 4, "bottom": 4, "left": 4, "right": 4}
c.tabs.position = "left"
c.tabs.show = "switching"
c.tabs.show_switching_delay = 3500
c.tabs.favicons.show = "always"
c.tabs.last_close = "default-page"
c.tabs.close_mouse_button = 'middle'
c.tabs.close_mouse_button_on_bar = 'new-tab'
c.tabs.select_on_remove = 'prev'
c.tabs.title.alignment = 'left'
c.tabs.title.elide = 'middle'
c.tabs.title.format = '{current_title}'
c.tabs.title.format_pinned = '#{audio}{index}: {current_title}'
c.tabs.new_position.related = 'next'
c.tabs.new_position.unrelated = 'last'
c.tabs.tabs_are_windows = False
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Statusbar                       ║
#               ╚═════════════════════════════════════════════════════════╝
c.statusbar.show = 'in-mode'
c.statusbar.position = 'bottom'
c.statusbar.padding = {'top': 1, 'bottom': 1, 'left': 1, 'right': 1}
c.statusbar.widgets = ['keypress', 'search_match', 'url', 'scroll', 'history', 'progress', 'clock:%a#%V %d %B %y, %H:%M ']
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Downloads                       ║
#               ╚═════════════════════════════════════════════════════════╝
c.downloads.location.prompt = False
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
c.completion.shrink = True
c.completion.web_history.max_items = 0
c.completion.cmd_history_max_items = 0
c.completion.delay = 0
c.completion.scrollbar.padding = 0
c.completion.height = "20%"
c.completion.scrollbar.width = 8
c.completion.open_categories = ['quickmarks']
c.completion.web_history.exclude = ['file://*', 'http://localhost:*', 'https://*.google.com', 'https://duckduckgo.com']
c.completion.show = "always"
c.completion.timestamp_format = '%d-%m-%Y %H:%M'
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
c.hints.selectors["code"] = [
    ":not(pre) > code",
    "pre",
]
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
c.content.blocking.hosts.lists = []
c.content.blocking.whitelist = []
c.content.blocking.adblock.lists = []
# Privacy =============================================================================
c.content.pdfjs = True
c.content.images = True
c.content.xss_auditing = True
c.content.fullscreen.window = False
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
c.content.register_protocol_handler = 'ask'
c.content.tls.certificate_errors = 'ask-block-thirdparty'
c.content.unknown_url_scheme_policy = 'allow-from-user-interaction'
# headers =============================================================================
c.content.headers.do_not_track = True
c.content.headers.user_agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'
c.content.headers.accept_language = 'en-US,en;q=0.5'
c.content.headers.custom = {"accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}
c.content.headers.referer = 'same-domain'
# Notifications =======================================================================
c.content.notifications.enabled = False
c.content.notifications.show_origin = True
c.content.notifications.presenter = 'messages'
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
c.window.transparent = True
c.window.title_format = 'qtb - {perc} {current_title} {title_sep}'
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Zoom                           ║
#               ╚═════════════════════════════════════════════════════════╝
c.zoom.mouse_divider = 512
c.zoom.default = "100%"
c.zoom.levels = ['25%', '33%', '50%', '67%', '75%', '90%', '100%', '110%', '125%', '150%', '175%', '200%', '250%', '300%', '400%', '500%']
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Save                           ║
#               ╚═════════════════════════════════════════════════════════╝
c.auto_save.session = True
c.auto_save.interval = 15000
c.session.lazy_restore = True
c.session.default_name = "default"
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Others                         ║
#               ╚═════════════════════════════════════════════════════════╝
c.scrolling.smooth=True
c.new_instance_open_target = "tab"
c.scrolling.bar = 'never'
c.confirm_quit=["downloads"]
c.editor.command = ["alacritty", "-e", "nvim", "{file}"]
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         prompt                          ║
#               ╚═════════════════════════════════════════════════════════╝
c.prompt.filebrowser = True
c.prompt.radius = 0
#               ╔═════════════════════════════════════════════════════════╗
#               ║                        messages                         ║
#               ╚═════════════════════════════════════════════════════════╝
c.messages.timeout = 3000
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Qt                              ║
#               ╚═════════════════════════════════════════════════════════╝
c.qt.highdpi = True
c.qt.workarounds.disable_accelerated_2d_canvas = "never"
c.qt.args = [
    "enable-accelerated-video",
    "enable-native-gpu-memory-buffers",
    "enable-oop-rasterization",
    "enable-quic",
    "enable-unsafe-webgpu",
    "enable-vulkan",
    "enable-zero-copy",
    "font-cache-shared-handle",
    "ignore-gpu-blocklist",
    "num-raster-threads=4",
    "enable-features=VaapiIgnoreDriverChecks,AcceleratedVideoDecodeLinuxGL,AcceleratedVideoDecodeLinuxZeroCopyGL,AcceleratedVideoEncoder",
    "disable-features=PermissionElement",
]
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
    'dd': 'https://duckduckgo.com/?q={}',
    'gg': 'https://www.google.com/search?q={}',
    'gi': 'https://www.google.com/search?tbm=isch&q={}&tbs=imgo:1',
    'gn': 'https://news.google.com/search?q={}',
    'bi': 'https://www.bing.com/search?q={}',
    'yi': 'https://yandex.com/search/?text={}',
    'sw': 'https://swisscows.com/web?culture=en&query={}',
    'yy': 'https://www.youtube.com/results?search_query={}&search=Search',
    'yt': 'https://www.youtube.com/results?search_query={}&search=Search',
    'wi': 'https://en.wikipedia.org/wiki/{}',
    'ma': 'https://www.google.com/maps/search/{}',
    # translate =======================================================================
    'ar': 'https://translate.google.com/?sl=auto&tl=ar&text={}&op=translate',
    'tr': 'https://translate.google.com/?sl=auto&tl=en&text={}&op=translate',
    'en': 'https://translate.google.com/?sl=auto&tl=en&text={}&op=translate',
    'ro': 'https://translate.google.com/?sl=auto&tl=ro&text={}&op=translate',
    'ru': 'https://translate.google.com/?sl=auto&tl=ru&text={}&op=translate',
    'ja': 'https://translate.google.com/?sl=auto&tl=ja&text={}&op=translate',
    # entertainment ===================================================================
    're': 'https://www.reddit.com/r/{}/',
    'rr': 'https://www.reddit.com/search?q={}',
    'sr': 'https://www.reddit.com/r/{unquoted}',
    'rd': 'https://old.reddit.com/search?q={}',
    'pi': 'https://www.pinterest.com/search/pins/?q={}',
    'fb': 'https://www.facebook.com/s.php?q={}',
    'ig': 'https://www.instagram.com/explore/tags/{}',
    'tw': 'https://twitter.com/search?q={}',
    # tech ============================================================================
    'gh': 'https://github.com/search?o=desc&q={}&s=stars',
    'gs': 'https://gist.github.com/search?q={}',
    'hb': 'http://github.com/search?q={}',
    'gl': 'https://gitlab.com/search?search={}&group_id=&project_id=&snippets=false&repository_ref=&nav_source=navbar',
    'pk': 'https://porkbun.com/checkout/search?prb=ce1274dcf2&q={}&tlds=&idnLanguage=&search=search&csrf_pb=e78192c1c41609bac923887d0a45b5ec',
    'rp': 'http://github.com/catalinplesu/{}',
    'wolframalpha': 'http://www.wolframalpha.com/input/?i={}',
    # streaming =======================================================================
    'an': 'https://ww.anime4up.rest/?search_param=animes&s={}',
    "al" : "anilist.co/search/anime?search={}",
    'db': 'https://www.imdb.com/find?q={}',
    'zo': 'https://zoro.to/search?keyword={}',
    'to': 'https://www.1377x.to/search/{}/1/',
    'pt': 'https://thepiratebay.org/search.php?q={}',
    # Packages ========================================================================
    "sc": "https://scoop.sh/#/apps?q={}",
    "vo": "https://voidlinux.org/packages/?arch=x86_64&q={}",
    # books ===========================================================================
    'li': 'https://libgen.rs/search.php?req={}',
    'an': 'https://annas-archive.org/search?q=%{}',
    # language ========================================================================
    'urban': 'https://www.urbandictionary.com/define.php?term={}',
    'dict_2': 'https://thefreedictionary.com/{}',
    'mg': 'https://www.merriam-webster.com/dictionary/%{}',
    'th': 'https://www.merriam-webster.com/thesaurus/%{}',
    'pron': 'https://www.thesaurus.com/browse/{}',
    'dex': 'https://dexonline.ro/definitie/{}',
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
c.aliases['o'] = 'open'
c.aliases['h'] = 'help -t'
c.aliases['e'] = 'session-load'
c.aliases['w'] = 'session-save'
c.aliases['wq'] = 'quit --save'
c.aliases['wqa'] = 'quit --save'
c.aliases['sv'] = 'spawn -u split -h'
c.aliases['sh'] = 'spawn -u split -v'
c.aliases['localhost'] = 'spawn -u localhost'
#               ╔═════════════════════════════════════════════════════════╗
#               ║                       Keybidings                        ║
#               ╚═════════════════════════════════════════════════════════╝
# General: ============================================================================
config.unbind('d')
config.bind('e', 'cmd-set-text :open {url:pretty}')
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
config.bind('<Meta+Ctrl+f>', 'fullscreen')
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
config.bind(',Y', 'hint links spawn alacritty -e yt-dlp {hint-url}')
config.bind('yM', 'yank ;; spawn mpv {url}')
config.bind('tT', 'config-cycle tabs.position top left')
config.bind('ss', 'config-source')
config.bind('se', 'config-edit')
config.bind('<Ctrl-h>', 'history')
config.bind('<ctrl-y>', 'spawn --userscript ytdl.sh')
config.bind('xt', 'config-cycle tabs.show multiple never')
config.bind('xT', 'config-cycle tabs.position top left')
config.bind('xs', 'config-cycle statusbar.show always never')
config.bind('<Ctrl-R>', 'config-cycle content.user_stylesheets "~/.config/qutebrowser/styles/nord-all-sites.css" "~/.config/qutebrowser/styles/solarized-dark-all-sites.css" "~/.config/qutebrowser/styles/solarized-light-all-sites.css"  "" ')
config.bind('<Ctrl-Shift-i>', 'devtools')
config.bind('wi', 'devtools bottom')
config.bind('<Ctrl+x>', 'set-cmd-text :')
config.bind('<Return>', 'prompt-accept yes', mode='yesno')
# Configuration management ============================================================
config.bind("\ce", "config-edit")
config.bind("\\rc", "config-source")
config.bind("\\ra", "adblock-update")
config.bind("\\rg", "greasemonkey-reload")
# Toggle ==============================================================================
config.bind("tbh", "config-cycle -p -t -u *://{url:host}/* content.blocking.enabled true false ;; reload")
config.bind("tBh", "config-cycle -p -u *://{url:host}/* content.blocking.enabled true false ;; reload")
config.bind("tbH", "config-cycle -p -t -u *://*.{url:host}/* content.blocking.enabled true false ;; reload")
config.bind("tBH", "config-cycle -p -u *://*.{url:host}/* content.blocking.enabled true false ;; reload")
config.bind("tbu", "config-cycle -p -t -u {url} content.blocking.enabled true false ;; reload")
config.bind("tBu", "config-cycle -p -u {url} content.blocking.enabled true false ;; reload")
config.bind("tqt", "config-cycle tabs.show multiple switching")
config.bind("tqs", "config-cycle statusbar.show always in-mode")
# Binds for opening archived version of current page ==================================
config.bind('aa', 'open https://web.archive.org/web/*/{url}')
config.bind('aA', 'open -t https://web.archive.org/web/*/{url}')
config.bind('ag', 'open https://www.google.com/search?q=cache:{url}')
config.bind('aG', 'open -t https://www.google.com/search?q=cache:{url}')
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
config.bind("<Ctrl-f>", 'completion-item-focus next-page', mode="command")
config.bind("<Ctrl-b>", 'completion-item-focus prev-page', mode="command")
config.bind('<Ctrl-d>', 'completion-item-del', mode='command')
config.bind('<Ctrl-a>', 'rl-beginning-of-line', mode='command')
config.bind('<Ctrl-e>', 'rl-end-of-line', mode='command')
config.bind('<Ctrl-l>', 'rl-forward-char', mode='command')
config.bind('<Ctrl-h>', 'rl-backward-char', mode='command')
config.bind('<Ctrl-w>', 'rl-forward-word', mode='command')
config.bind('<Ctrl-b>', 'rl-backward-word', mode='command')
config.bind('<Ctrl-x>', 'rl-backward-delete-char', mode='command')
config.bind('<Ctrl-y>', 'rl-yank', mode='command')
# prompt: =============================================================================
config.bind('<Ctrl-c>', 'mode-leave', mode='prompt')
config.bind('<Ctrl-d>', 'rl-delete-char', mode='prompt')
config.bind('<Ctrl-j>', 'prompt-item-focus next', mode='prompt')
config.bind('<Ctrl-k>', 'prompt-item-focus prev', mode='prompt')
config.bind('<Ctrl-n>', 'prompt-item-focus next', mode='prompt')
config.bind('<Ctrl-p>', 'prompt-item-focus prev', mode='prompt')
config.bind('<Ctrl-o>', 'prompt-open-download', mode='prompt')

#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Themes                          ║
#               ╚═════════════════════════════════════════════════════════╝
# Darkmode ============================================================================
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.threshold.background = 225
c.colors.webpage.darkmode.threshold.foreground = 80
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = "never"
c.colors.webpage.darkmode.policy.page = "smart"
# Lightmode ===========================================================================
config.set('colors.webpage.darkmode.enabled', True, '<all-urls>')
config.set("colors.webpage.darkmode.enabled", False, "file://*")
config.set('colors.webpage.darkmode.enabled', False, 'https://*.vercel.app/')
config.set("colors.webpage.darkmode.enabled", False, "http://localhost:*")
config.set('colors.webpage.darkmode.enabled', False, 'http://localhost/')
config.set('colors.webpage.darkmode.enabled', False, 'https://www.kasmweb.com/')
config.set('colors.webpage.darkmode.enabled', False, 'https://www.instapaper.com/')
config.set('colors.webpage.darkmode.enabled', False, 'https://web.whatsapp.com/')
# Palette =============================================================================
bg0_hard   = "#0d0c0c"
bg0_normal = "#181616"
bg0_soft   = "#201d1d"
bg1        = "#282727"
bg2        = "#393836"
bg3        = "#625e5a"
fg0        = "#c5c9c5"
fg1        = "#b4b3a7"
fg2        = "#a6a69c"
fg3        = "#9e9b93"
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
# Completion===========================================================================
c.colors.completion.fg                            = fg3
c.colors.completion.odd.bg                        = bg0_normal
c.colors.completion.even.bg                       = bg0_normal
c.colors.completion.category.fg                   = green
c.colors.completion.category.bg                   = bg0_soft
c.colors.completion.category.border.top           = bg1
c.colors.completion.category.border.bottom        = bg1
c.colors.completion.item.selected.fg              = fg2
c.colors.completion.item.selected.bg              = bg1
c.colors.completion.item.selected.border.top      = bg2
c.colors.completion.item.selected.border.bottom   = bg2
c.colors.completion.item.selected.match.fg        = orange
c.colors.completion.match.fg                      = green
c.colors.completion.scrollbar.fg                  = fg3
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
c.colors.downloads.start.fg                       = fg0
c.colors.downloads.start.bg                       = bg0_normal
c.colors.downloads.stop.fg                        = bg0_hard
c.colors.downloads.stop.bg                        = green
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
c.colors.statusbar.insert.fg                      = bg3
c.colors.statusbar.insert.bg                      = bg0_normal
c.colors.statusbar.passthrough.fg                 = bg0_hard
c.colors.statusbar.passthrough.bg                 = blue
c.colors.statusbar.private.fg                     = purple
c.colors.statusbar.private.bg                     = bg0_hard
c.colors.statusbar.command.fg                     = fg3
c.colors.statusbar.command.bg                     = bg0_normal
c.colors.statusbar.command.private.fg             = purple
c.colors.statusbar.command.private.bg             = bg1
c.colors.statusbar.caret.fg                       = bg0_hard
c.colors.statusbar.caret.bg                       = purple
c.colors.statusbar.caret.selection.fg             = bg0_hard
c.colors.statusbar.caret.selection.bg             = purple
c.colors.statusbar.url.fg                         = bg3
c.colors.statusbar.url.error.fg                   = red
c.colors.statusbar.url.warn.fg                    = orange
c.colors.statusbar.url.success.http.fg            = red
c.colors.statusbar.url.success.https.fg           = bg3
c.colors.statusbar.url.hover.fg                   = orange
c.colors.statusbar.progress.bg                    = green
# Tabs ================================================================================
c.colors.tabs.bar.bg                              = bg0_normal
c.colors.tabs.odd.fg                              = fg1
c.colors.tabs.odd.bg                              = bg0_normal
c.colors.tabs.even.fg                             = fg1
c.colors.tabs.even.bg                             = bg0_normal
c.colors.tabs.selected.odd.fg                     = fg1
c.colors.tabs.selected.odd.bg                     = bg2
c.colors.tabs.selected.even.fg                    = fg1
c.colors.tabs.selected.even.bg                    = bg2
c.colors.tabs.pinned.even.bg                      = green
c.colors.tabs.pinned.even.fg                      = bg2
c.colors.tabs.pinned.odd.bg                       = green
c.colors.tabs.pinned.odd.fg                       = bg2
c.colors.tabs.pinned.selected.even.bg             = bg2
c.colors.tabs.pinned.selected.even.fg             = fg1
c.colors.tabs.pinned.selected.odd.bg              = bg2
c.colors.tabs.pinned.selected.odd.fg              = fg1
# tooltips ============================================================================
c.colors.tooltip.bg                               = bg0_hard
c.colors.tooltip.fg                               = fg1
# Webpage =============================================================================
c.colors.webpage.bg = 'white'
