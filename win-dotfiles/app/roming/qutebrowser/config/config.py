#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Load                           ║
#               ╚═════════════════════════════════════════════════════════╝
config.load_autoconfig(False)
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Backend                        ║
#               ╚═════════════════════════════════════════════════════════╝
c.backend = 'webengine'
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
c.tabs.pinned.shrink = True
c.tabs.pinned.frozen = True
c.tabs.new_position.stacking = True
c.tabs.tooltips = True
c.tabs.tabs_are_windows = False
c.tabs.mousewheel_switching = False
c.tabs.favicons.scale=1.2
c.tabs.undo_stack_size = 10
c.tabs.show_switching_delay = 1500
c.tabs.width = 30
c.tabs.max_width = -1
c.tabs.min_width = -1
c.tabs.indicator.width = 0
c.tabs.indicator.padding = {'top': 0, 'bottom': 0, 'left': 0, 'right': 0}
c.tabs.padding = {"top": 10, "bottom": 10, "left": 4, "right": 4}
c.tabs.position = "left"
c.tabs.show = "switching"
c.tabs.mode_on_change = 'normal'
c.tabs.favicons.show = "always"
c.tabs.last_close = "default-page"
c.tabs.close_mouse_button = 'middle'
c.tabs.close_mouse_button_on_bar = 'new-tab'
c.tabs.select_on_remove = 'prev'
c.tabs.title.alignment = 'center'
c.tabs.title.elide = 'middle'
c.tabs.title.format = '{current_title}'
c.tabs.title.format_pinned = '#{audio}{index}: {current_title}'
c.tabs.new_position.related = 'next'
c.tabs.new_position.unrelated = 'last'
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Statusbar                       ║
#               ╚═════════════════════════════════════════════════════════╝
c.statusbar.show = 'in-mode'
c.statusbar.position = 'bottom'
c.statusbar.padding = {'top': 1, 'bottom': 1, 'left': 1, 'right': 1}
c.statusbar.widgets = ['keypress', 'search_match', 'url']
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Downloads                       ║
#               ╚═════════════════════════════════════════════════════════╝
c.downloads.prevent_mixed_content = True
c.downloads.location.prompt = False
c.downloads.location.remember = False
c.downloads.remove_finished = 3000
c.downloads.location.directory = r"C:\Users\lli\Downloads"
c.downloads.location.suggestion = "both"
c.downloads.position = 'bottom'
#               ╔═════════════════════════════════════════════════════════╗
#               ║                       Completion                        ║
#               ╚═════════════════════════════════════════════════════════╝
c.completion.quick = True
c.completion.shrink = True
c.completion.use_best_match = False
c.completion.cmd_history_max_items = 100
c.completion.web_history.max_items = 15
c.completion.delay = 0
c.completion.scrollbar.padding = 0
c.completion.scrollbar.width = 8
c.completion.min_chars = 1
c.completion.height = "30%"
c.completion.show = "always"
c.completion.timestamp_format = '%Y-%m-%dT%H:%M'
c.completion.favorite_paths = []
c.completion.open_categories = ['history']
c.completion.web_history.exclude = ['file://*', 'http://localhost:*', 'https://*.google.com', 'https://duckduckgo.com']
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Hints                           ║
#               ╚═════════════════════════════════════════════════════════╝
c.hints.scatter = True
c.hints.hide_unmatched_rapid_hints = True
c.hints.uppercase = True
c.hints.leave_on_load = False
c.hints.min_chars = 1
c.hints.radius = 2
c.hints.auto_follow_timeout = 0
c.hints.auto_follow = 'unique-match'
c.hints.mode = "letter"
c.hints.chars = "asdfghjkl"
c.hints.next_regexes = ['\\bnext\\b', '\\bmore\\b', '\\bnewer\\b', '\\b[>→≫]\\b', '\\b(>>|»)\\b', '\\bcontinue\\b']
c.hints.prev_regexes = ['\\bprev(ious)?\\b', '\\bback\\b', '\\bolder\\b', '\\b[<←≪]\\b', '\\b(<<|«)\\b']
c.hints.padding =  {"top": 2, "bottom": 2, "left": 2, "right": 2}
c.hints.selectors["code"] = [
    ":not(pre) > code",
    "pre",
]
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Keyhint                         ║
#               ╚═════════════════════════════════════════════════════════╝
c.keyhint.delay = 100
c.keyhint.radius = 2
c.keyhint.blacklist = []
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Search                          ║
#               ╚═════════════════════════════════════════════════════════╝
c.search.incremental = True
c.search.wrap = True
c.search.wrap_messages = False
c.search.ignore_case = "always"
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Input                          ║
#               ╚═════════════════════════════════════════════════════════╝
c.input.match_counts = True
c.input.insert_mode.auto_load = True
c.input.insert_mode.auto_leave = True
c.input.insert_mode.auto_enter = True
c.input.escape_quits_reporter = True
c.input.insert_mode.leave_on_load = True
c.input.insert_mode.plugins = False
c.input.links_included_in_focus_chain = True
c.input.mouse.rocker_gestures = False
c.input.mouse.rocker_gestures = False
c.input.spatial_navigation = False
c.input.mouse.back_forward_buttons = False
c.input.media_keys = False
c.input.forward_unbound_keys = 'all'
c.input.partial_timeout = 30000
c.input.mode_override = None
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Content                        ║
#               ╚═════════════════════════════════════════════════════════╝
# Style ===============================================================================
c.content.prefers_reduced_motion = True
c.content.fullscreen.overlay_timeout = 3000
c.content.user_stylesheets = []
# Adblock =============================================================================
c.content.blocking.enabled = True
c.content.blocking.hosts.block_subdomains = True
c.content.blocking.method = "both"
c.content.blocking.whitelist = ['https://*.split.io/*']
c.content.blocking.hosts.lists = ['https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts']
c.content.blocking.adblock.lists = [
    "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt",
    "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt",
    "https://easylist-downloads.adblockplus.org/bitblock.txt",
    "https://easylist-downloads.adblockplus.org/cntblock.txt",
    "https://easylist-downloads.adblockplus.org/ruadlist.txt",
    "https://easylist-msie.adblockplus.org/abp-filters-anti-cv.txt",
    "https://easylist-msie.adblockplus.org/antiadblockfilters.txt",
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://easylist.to/easylist/fanboy-social.txt",
    "https://github.com/easylist/easylist/raw/refs/heads/master/easylist/easylist_adservers.txt",
    "https://github.com/easylist/easylist/raw/refs/heads/master/easylist/easylist_adservers_popup.txt",
    "https://github.com/easylist/easylist/raw/refs/heads/master/easylist/easylist_general_block.txt",
    "https://github.com/easylist/easylist/raw/refs/heads/master/easylist/easylist_general_block_popup.txt",
    "https://github.com/easylist/easylist/raw/refs/heads/master/easylist/easylist_thirdparty.txt",
    "https://github.com/easylist/easylist/raw/refs/heads/master/easylist/easylist_thirdparty_popup.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
    "https://raw.github.com/reek/anti-adblock-killer/master/anti-adblock-killer-filters.txt",
    "https://raw.githubusercontent.com/LanikSJ/ubo-filters/main/filters/combined-filters.txt",
    "https://raw.githubusercontent.com/easylist/ruadlist/refs/heads/master/advblock.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/refs/heads/master/filters/annoyances-cookies.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/refs/heads/master/filters/annoyances-others.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/refs/heads/master/filters/badlists.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/refs/heads/master/filters/filters-2020.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/refs/heads/master/filters/filters-2021.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/refs/heads/master/filters/filters-2022.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/refs/heads/master/filters/filters-2023.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/refs/heads/master/filters/filters-2024.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/refs/heads/master/filters/filters-2025.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/refs/heads/master/filters/filters.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/refs/heads/master/filters/quick-fixes.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/refs/heads/master/filters/resource-abuse.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/refs/heads/master/filters/ubo-link-shorteners.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/refs/heads/master/filters/ubol-filters.txt",
    "https://secure.fanboy.co.nz/fanboy-annoyance.txt",
    "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt",
    "https://www.i-dont-care-about-cookies.eu/abp/",
]
# media ===============================================================================
c.content.webgl = True
c.content.images = True
c.content.pdfjs = True
c.content.canvas_reading = True
c.content.autoplay = True
c.content.print_element_backgrounds = True
# Privacy =============================================================================
c.content.private_browsing = False
c.content.fullscreen.window = False
c.content.persistent_storage = False
c.content.dns_prefetch = False
c.content.xss_auditing = False
c.content.geolocation = False
c.content.plugins = False
c.content.mute = False
c.content.media.audio_capture = False
c.content.media.audio_video_capture = False
c.content.media.video_capture = False
c.content.desktop_capture = False
c.content.mouse_lock = False
c.content.register_protocol_handler = False
c.content.hyperlink_auditing = False
c.content.site_specific_quirks.enabled = False
c.content.site_specific_quirks.skip = []
c.content.proxy = 'system'
c.content.webrtc_ip_handling_policy = "default-public-interface-only"
c.content.default_encoding = "utf-8"
c.content.tls.certificate_errors = 'ask-block-thirdparty'
c.content.unknown_url_scheme_policy = 'allow-from-user-interaction'
c.content.netrc_file = None
# headers =============================================================================
c.content.headers.do_not_track = True
c.content.headers.accept_language = 'en-US,en,ca-ES,de;q=0.9'
c.content.headers.referer = 'same-domain'
c.content.headers.user_agent = 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version_short} Safari/{webkit_version}'
c.content.headers.custom = {}
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
c.content.javascript.modal_dialog = False
c.content.javascript.can_open_tabs_automatically = False
c.content.javascript.modal_dialog = False
c.content.local_content_can_access_file_urls = True
c.content.local_content_can_access_remote_urls = True
c.content.local_storage = True
c.content.javascript.legacy_touch_events = 'never'
c.content.javascript.clipboard = 'access'
c.content.javascript.log = {'unknown': 'debug', 'info': 'debug', 'warning': 'debug', 'error': 'debug'}
c.content.javascript.log_message.excludes = {'userscript:_qute_stylesheet': ['*Refused to apply inline style because it violates the following Content Security Policy directive: *']}
c.content.javascript.log_message.levels = {'qute:*': ['error'], 'userscript:GM-*': [], 'userscript:*': ['error']}
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
c.window.title_format = 'qtb - {perc} {current_title} {title_sep}'
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Zoom                           ║
#               ╚═════════════════════════════════════════════════════════╝
c.zoom.mouse_divider = 1512
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
#               ║                          Instance                       ║
#               ╚═════════════════════════════════════════════════════════╝
c.new_instance_open_target = "tab-bg-silent"
c.new_instance_open_target_window = "last-focused"
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          FileSelect                     ║
#               ╚═════════════════════════════════════════════════════════╝
c.fileselect.handler = 'default'
c.fileselect.folder.command         = ["alacritty", "-e", "bash", '-c', "yazi", "--choosedir={}"]
c.fileselect.multiple_files.command = ["alacritty", "-e", "bash", '-c', "yazi", "--choosedir={}"]
c.fileselect.single_file.command    = ["alacritty", "-e", "bash", '-c', "yazi", "--choosedir={}"]
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Logging                        ║
#               ╚═════════════════════════════════════════════════════════╝
c.logging.level.console = 'info'
c.logging.level.ram = 'debug'
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          Others                         ║
#               ╚═════════════════════════════════════════════════════════╝
c.scrolling.smooth=True
c.scrolling.bar = 'never'
c.changelog_after_upgrade = 'minor'
c.confirm_quit=["downloads"]
c.editor.command = ["alacritty", "-e", "nvim", "{file}"]
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Prompt                          ║
#               ╚═════════════════════════════════════════════════════════╝
c.prompt.filebrowser = False
c.prompt.radius = 0
#               ╔═════════════════════════════════════════════════════════╗
#               ║                        Messages                         ║
#               ╚═════════════════════════════════════════════════════════╝
c.messages.timeout = 3000
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Qt                              ║
#               ╚═════════════════════════════════════════════════════════╝
c.qt.highdpi = True
c.qt.workarounds.disable_hangouts_extension = True
c.qt.workarounds.remove_service_workers = False
c.qt.workarounds.locale = False
c.qt.force_software_rendering = 'none'
c.qt.workarounds.disable_accelerated_2d_canvas = 'auto'
c.qt.chromium.experimental_web_platform_features = 'never'
c.qt.chromium.low_end_device_mode = 'auto'
c.qt.chromium.process_model = 'process-per-site-instance'
c.qt.chromium.sandboxing = 'enable-all'
c.qt.environ = {}
c.qt.args = [
    "enable-accelerated-video-decode"
    "enable-accelerated-video",
    "enable-gpu-rasterization",
    "enable-native-gpu-memory-buffers",
    "enable-oop-rasterization",
    "enable-quic",
    "enable-unsafe-webgpu",
    "enable-vulkan",
    "enable-zero-copy",
    "font-cache-shared-handle",
    "ignore-gpu-blocklist",
    "num-raster-threads=4",
    "disable-logging",
    "disable-pinch",
    "disable-features=PermissionElement",
]
#               ╔═════════════════════════════════════════════════════════╗
#               ║                          URL                            ║
#               ╚═════════════════════════════════════════════════════════╝
c.url.open_base_url = False
c.url.auto_search = 'schemeless'
c.url.default_page = r"C:\Users\lli\AppData\Roaming\qutebrowser\config\startpage\index.html"
c.url.start_pages = [ r"C:\Users\lli\AppData\Roaming\qutebrowser\config\startpage\index.html" ]
c.url.yank_ignored_parameters += ["smid", "smtyp", "fbclid", "fb_news_token"]
c.url.incdec_segments = ['path', 'query']
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
    'rs': 'https://www.reddit.com/r/{unquoted}',
    'ro': 'https://old.reddit.com/search?q={}',
    'pi': 'https://www.pinterest.com/search/pins/?q={}',
    'fb': 'https://www.facebook.com/s.php?q={}',
    'ig': 'https://www.instagram.com/explore/tags/{}',
    'tw': 'https://twitter.com/search?q={}',
    # tech ============================================================================
    'gh': 'https://github.com/search?o=desc&q={}&s=stars',
    'gu': 'https://github.com/search?q={}&type=Users',
    'gc': 'https://github.com/search?q={}&type=Code',
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
c.aliases['wc'] = 'session-save --current --only-active-window'
c.aliases['bd'] = 'tab-close'
c.aliases['bo'] = 'tab-only'
c.aliases['wq'] = 'quit --save'
c.aliases['wq!'] = 'quit --save'
c.aliases['wqa'] = 'quit --save'
c.aliases['mpv'] = 'spawn --detach mpv {url}'
#               ╔═════════════════════════════════════════════════════════╗
#               ║                       Keybidings                        ║
#               ╚═════════════════════════════════════════════════════════╝
# Unbind ==============================================================================
unbind_keys = ['d', 'q']
for key in unbind_keys:
    config.unbind(key)
# Remap ===============================================================================
c.bindings.key_mappings = {
    '<Enter>': '<Return>',
    '<Shift-Return>': '<Return>',
    '<Shift-Enter>': '<Return>',
    '<Ctrl-Enter>': '<Ctrl-Return>'
}
# General  ============================================================================
config.bind('qm', 'macro-record')
config.bind('yl', 'hint --rapid links yank')
config.bind(';', 'cmd-set-text :')
config.bind('<Ctrl-x>', 'cmd-set-text :')
config.bind('<Ctrl-o>', 'cmd-set-text -s :open -w')
config.bind('<Ctrl-h>', 'history')
config.bind('<Esc>', 'clear-keychain ;; search ;; fullscreen --leave ;; clear-messages')
# Open ================================================================================
config.bind('ee', 'cmd-set-text :open {url:pretty}')
config.bind('ev', 'edit-url')
config.bind('ep', 'open -p')
config.bind('ew', 'open -w')
config.bind('et', 'open -t')
config.bind('ec', "spawn chromium {url}")
config.bind('ef', "spawn firefox {url}")
config.bind('ei', "spawn msedge {url}")
config.bind('<Ctrl-e>', 'open -w')
config.bind('<Ctrl-t>', 'open -t ;; cmd-set-text -s :open')
# Focus ===============================================================================
config.bind('<Alt-1>', 'tab-focus 1')
config.bind('<Alt-2>', 'tab-focus 2')
config.bind('<Alt-3>', 'tab-focus 3')
config.bind('<Alt-4>', 'tab-focus 4')
config.bind('<Alt-5>', 'tab-focus 5')
config.bind('<Alt-6>', 'tab-focus 6')
config.bind('<Alt-7>', 'tab-focus 7')
config.bind('<Alt-8>', 'tab-focus 8')
config.bind('<Alt-9>', 'tab-focus -1')
# Configuration =======================================================================
config.bind("se", "config-edit")
config.bind("ss", "config-source")
config.bind("sa", "adblock-update")
config.bind("sr", "greasemonkey-reload")
# Devtools ============================================================================
config.bind('wi', 'devtools bottom')
config.bind('wI', 'devtools window')
config.bind('<Ctrl-i>', 'devtools left')
config.bind('<Ctrl-Shift-i>', 'devtools right')
# Tabs  ===============================================================================
config.bind('T', 'hint links tab')
config.bind('dd', 'tab-close')
config.bind('do', 'tab-only')
config.bind('dh', 'tab-only --next --pinned keep')
config.bind('dl', 'tab-only --prev --pinned keep')
config.bind('dp', 'tab-pin')
config.bind('dm', 'tab-mute')
config.bind('dn', 'tab-focus last')
config.bind('dc', 'tab-only ;; home')
config.bind('dJ', 'tab-move +')
config.bind('dK', 'tab-move -')
config.bind('gJ', 'tab-move +')
config.bind('gK', 'tab-move -')
config.bind('gm', 'tab-move')
config.bind('<Ctrl-n>', 'tab-next')
config.bind('<Ctrl-p>', 'tab-prev')
config.bind('<Ctrl-q>', 'tab-close')
# Downloads  ==========================================================================
config.bind('co', 'download-open')
config.bind('ce', 'download-cancel')
config.bind('cc', 'download-clear')
config.bind('cr', 'download-retry')
config.bind('ca', 'hint all download')
config.bind('ci', 'hint images download')
# Zoom  ===============================================================================
config.bind('zi', 'zoom-in')
config.bind('zo', 'zoom-out')
config.bind('z0', 'zoom')
config.bind('zf', 'fullscreen')
config.bind('<Ctrl-0>', 'zoom')
config.bind('<Ctrl-=>', 'zoom-in')
config.bind('<Ctrl-->', 'zoom-out')
# Videos  =============================================================================
config.bind(',m', 'spawn mpv {url}')
config.bind(',M', 'hint links spawn mpv {hint-url}')
config.bind(',Y', 'hint links spawn alacritty -e yt-dlp {hint-url}')
config.bind('yM', 'yank ;; spawn mpv {url}')
config.bind('<Ctrl-Shift-m>', 'spawn mpv {url}')
config.bind('<Ctrl-m>', 'hint links spawn mpv {hint-url}')
# images ==============================================================================
config.bind(',ii', 'hint images')
config.bind(',io', 'hint images run open {hint-url}')
config.bind(',iO', 'hint images run open -t {hint-url}')
config.bind(',iy', 'hint images yank')
config.bind(',iY', 'hint images yank-primary')
config.bind(',ig', 'hint images run open https://www.google.com/searchbyimage?&image_url={hint-url}')
# private =============================================================================
config.bind('mp', 'hint all run open -p {hint-url}')
# Stylesheets =========================================================================
config.bind(',c', 'config-cycle content.user_stylesheets "" ""')
config.bind(',r', 'config-cycle content.user_stylesheets "~/.config/qutebrowser/styles/nord-all-sites.css" "~/.config/qutebrowser/styles/solarized-dark-all-sites.css" "~/.config/qutebrowser/styles/solarized-light-all-sites.css"  "" ')
config.bind(',a', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/4chan.css ""')
config.bind(',b', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/reddit.css ""')
config.bind(',e', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/empornium.css ""')
config.bind(',h', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/hacker.css ""')
config.bind(',s', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/scaruffi.css ""')
config.bind(',q', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/qutebrowser.css ""')
# Toggle ==============================================================================
config.bind("ttt", "config-cycle tabs.show multiple switching")
config.bind('ttp', 'config-cycle tabs.position top left')
config.bind("tst", "config-cycle statusbar.show always in-mode")
config.bind("tbh", "config-cycle -p -t -u *://{url:host}/* content.blocking.enabled true false ;; reload")
config.bind("tBh", "config-cycle -p -u *://{url:host}/* content.blocking.enabled true false ;; reload")
config.bind("tbH", "config-cycle -p -t -u *://*.{url:host}/* content.blocking.enabled true false ;; reload")
config.bind("tBH", "config-cycle -p -u *://*.{url:host}/* content.blocking.enabled true false ;; reload")
config.bind("tbu", "config-cycle -p -t -u {url} content.blocking.enabled true false ;; reload")
config.bind("tBu", "config-cycle -p -u {url} content.blocking.enabled true false ;; reload")
# archived ============================================================================
config.bind('aa', 'open https://web.archive.org/web/*/{url}')
config.bind('aA', 'open -t https://web.archive.org/web/*/{url}')
config.bind('ag', 'open https://www.google.com/search?q=cache:{url}')
config.bind('aG', 'open -t https://www.google.com/search?q=cache:{url}')
# accept  =============================================================================
config.bind('y', 'prompt-accept yes', mode='yesno')
config.bind('n', 'prompt-accept no', mode='yesno')
config.bind('<Return>', 'prompt-accept yes', mode='yesno')
# passthrough =========================================================================
config.bind('<Ctrl-v>', 'mode-leave', mode='passthrough')
config.bind('<Ctrl-Escape>', 'mode-leave', mode='passthrough')
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
# Completion ==========================================================================
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
# prompt ==============================================================================
config.bind('<Ctrl-c>', 'mode-leave', mode='prompt')
config.bind('<Ctrl-d>', 'rl-delete-char', mode='prompt')
config.bind('<Ctrl-j>', 'prompt-item-focus next', mode='prompt')
config.bind('<Ctrl-k>', 'prompt-item-focus prev', mode='prompt')
config.bind('<Ctrl-n>', 'prompt-item-focus next', mode='prompt')
config.bind('<Ctrl-p>', 'prompt-item-focus prev', mode='prompt')
config.bind('<Ctrl-o>', 'prompt-open-download', mode='prompt')
config.bind('<Ctrl+l>', 'fake-key -g /', mode='prompt')
# Insert ==============================================================================
config.bind('<Ctrl-l>', 'fake-key <Left>', mode='insert')
config.bind('<Ctrl-h>', 'fake-key <Right>', mode='insert')
config.bind('<Ctrl-j>', 'fake-key <Down>', mode='insert')
config.bind('<Ctrl-k>', 'fake-key <Up>', mode='insert')
config.bind('<Ctrl-H>', 'fake-key <Backspace>', mode='insert')
config.bind('<Ctrl-A>', 'fake-key <Home>', mode='insert')
config.bind('<Ctrl-E>', 'fake-key <End>', mode='insert')
config.bind('<Ctrl-D>', 'fake-key <Delete>', mode='insert')
config.bind('<Ctrl-W>', 'fake-key <Ctrl-Backspace>', mode='insert')
config.bind('<Ctrl-U>', 'fake-key <Shift-Home> ;; fake-key <Delete>', mode='insert')
config.bind('<Ctrl-K>', 'fake-key <Shift-End> ;; fake-key <Delete>', mode='insert')
#               ╔═════════════════════════════════════════════════════════╗
#               ║                         Themes                          ║
#               ╚═════════════════════════════════════════════════════════╝
# Darkmode ============================================================================
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.threshold.foreground = 150
c.colors.webpage.darkmode.threshold.background = 100
c.colors.webpage.preferred_color_scheme = 'dark'
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'smart-simple'
c.colors.webpage.darkmode.policy.page = 'smart'
# Lightmode ===========================================================================
config.set("colors.webpage.darkmode.enabled", False, "file://*")
config.set("colors.webpage.darkmode.enabled", False, "http://localhost:*")
for domain in ['localhost', 'whatsapp.com', 'vercel.app', 'qutebrowser.org', 'kasmweb.com', 'instapaper.com', 'cz-usa.com', 'mossberg.com', 'ruger.com', 'smith-wesson.com']:
    with config.pattern('*://*.' + domain + '/*') as d:
        d.colors.webpage.darkmode.enabled = False
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
red0       = "#c4746e"
orange0    = "#b98d7b"
green0     = "#8a9a7b"
blue0      = "#8ba4b0"
purple0    = "#a292a3"
cyan0      = "#8992a7"
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
c.colors.keyhint.fg                               = fg3
c.colors.keyhint.suffix.fg                        = fg0
c.colors.keyhint.bg                               = bg0_normal
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
c.colors.statusbar.passthrough.bg                 = green0
c.colors.statusbar.private.fg                     = purple
c.colors.statusbar.private.bg                     = bg0_hard
c.colors.statusbar.command.fg                     = fg3
c.colors.statusbar.command.bg                     = bg0_normal
c.colors.statusbar.command.private.fg             = purple
c.colors.statusbar.command.private.bg             = bg1
c.colors.statusbar.caret.fg                       = bg0_hard
c.colors.statusbar.caret.bg                       = green
c.colors.statusbar.caret.selection.fg             = bg0_hard
c.colors.statusbar.caret.selection.bg             = purple
c.colors.statusbar.url.fg                         = bg3
c.colors.statusbar.url.error.fg                   = red
c.colors.statusbar.url.warn.fg                    = orange
c.colors.statusbar.url.success.http.fg            = red
c.colors.statusbar.url.success.https.fg           = bg3
c.colors.statusbar.url.hover.fg                   = bg3
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
