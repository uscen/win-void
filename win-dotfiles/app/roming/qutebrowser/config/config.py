config.load_autoconfig(False)
# =================================================================#
# =========================     Font    ===========================#
# =================================================================#
c.fonts.web.family.fantasy = "Arial"
c.fonts.default_family = "JetBrainsMono NF"
c.fonts.default_size = "14px"
c.fonts.completion.entry = '14px "JetBrainsMono NF"'
c.fonts.debug_console = '14px "JetBrainsMono NF"'
c.fonts.prompts = "default_size JetBrainsMono NF"
c.fonts.statusbar = '14px "JetBrainsMono NF"'
# =================================================================#
# ============================   TAB   ============================#
# =================================================================#
c.tabs.background = True
c.tabs.favicons.show = "always"
c.tabs.favicons.scale = 1
c.tabs.last_close = "close"
c.tabs.position = "top"
c.tabs.show = "multiple"
c.tabs.show_switching_delay = 800
c.tabs.title.format = "{perc}{audio}{current_title}"
c.window.title_format = "{perc}{current_title} - qutebrowser At {scroll_pos}"
c.tabs.padding = {"left": 0, "right": 0, "bottom": 1, "top": 1}
c.tabs.max_width = 250
c.tabs.select_on_remove = "prev"
# =================================================================#
# =========================  Statusbar ============================#
# =================================================================#
c.statusbar.show = "never"
c.statusbar.position = "bottom"
c.statusbar.widgets = ["url", "progress"]
# =================================================================#
# ===========================  URL ================================#
# =================================================================#
c.url.default_page = "https://start.duckduckgo.com/"
c.url.start_pages = "https://start.duckduckgo.com/"
# =================================================================#
# ===========================  Downloads ==========================#
# =================================================================#
c.downloads.location.directory = "~/Downloads"
c.downloads.location.suggestion = "both"
c.downloads.location.remember = True
c.downloads.position = "bottom"
c.downloads.remove_finished = 5000
# =================================================================#
# ===========================  Content   ==========================#
# =================================================================#
c.content.autoplay = True
c.content.headers.do_not_track = True
c.content.javascript.enabled = True
c.content.javascript.clipboard = "access-paste"
c.content.desktop_capture = "ask"
c.content.media.audio_capture = "ask"
c.content.media.audio_video_capture = "ask"
c.content.media.video_capture = "ask"
c.content.notifications.enabled = "ask"
c.content.notifications.presenter = "auto"
# =================================================================#
# ====================== Privacy ==================================#
# =================================================================#
c.content.webrtc_ip_handling_policy = "default-public-interface-only"
c.content.cookies.accept = "no-unknown-3rdparty"
# =================================================================#
# ========================= Adblock ===============================#
# =================================================================#
c.content.blocking.enabled = True
c.content.blocking.method = "auto"
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
]
# =================================================================#
# ==========================  Dark mode ===========================#
# =================================================================#
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = "lightness-cielab"
c.colors.webpage.darkmode.threshold.foreground = 150
c.colors.webpage.darkmode.threshold.background = 100
c.colors.webpage.darkmode.policy.images = "smart"
# =================================================================#
# ===========================  Others =============================#
# =================================================================#
# c.window.hide_decoration = True
c.editor.encoding = "utf-8"
c.prompt.filebrowser = True
c.prompt.radius = 4
c.new_instance_open_target = "tab-silent"
c.search.incremental = True
c.scrolling.bar = "never"
c.scrolling.smooth = True
c.hints.leave_on_load = False
c.auto_save.session = False
c.session.lazy_restore = True
c.qt.highdpi = True
c.completion.height = "30%"
c.confirm_quit = ["multiple-tabs", "downloads"]
c.content.cookies.accept = "all"
c.editor.command = ["foot", "-e", "nvim", "{file}", "-c", "normal {line}G{column0}l"]
c.fileselect.multiple_files.command = ["foot", "-e", "ranger", "--choosefiles={}"]
c.zoom.default = "100%"
c.url.default_page = "https://start.duckduckgo.com"
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com?q={}",
    "gg": "https://www.google.com/search?q={}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "re": "https://www.reddit.com/search?q={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "dl": "https://deepl.com/translator#_/en/{}",
    "tr": "https://libretranslate.com/?q={}",
    "dd": "https://duckduckgo.com?q={}",
    "gh": "https://github.com/search?q={}",
    "gm": "https://mail.google.com/mail/u/0/#search/{}",
    "gp": "https://photos.google.com/search/{}",
}
c.aliases = {
    "adblock-toggle": "config-cycle -t content.blocking.enabled",
    "chromium": "spawn --detach chromium {url}",
    "firefox": "spawn --detach firefox {url}",
    "prv": "open --private",
    "mpv": "spawn --detach mpv {url}",
    "o": "open",
    "ot": "open -t",
    "w": "session-save",
    "wq": "quit --save",
    "q": "quit",
    "qa": "quit",
    "qa!": "quit",
    "q!": "quit",
}
# make "click to copy link" work
can_access_clipboard = (
    "https://*.atlassian.net/*",
    "https://github.com/*",
)
for url_pattern in can_access_clipboard:
    config.set("content.javascript.clipboard", "access", url_pattern)
# =================================================================#
# ===========================  Binds  =============================#
# =================================================================#
config.bind("xs", "config-cycle statusbar.show always never")
config.bind("xt", "config-cycle tabs.show always never")
config.bind("xx", "config-cycle tabs.show always never;; config-cycle statusbar.show always never")
config.bind("wi", "devtools bottom")
config.bind("<Ctrl-p>", "hint links spawn mpv {hint-url}")
config.bind("<Ctrl-o>", "prompt-open-download", mode="prompt")
config.bind("<Ctrl-e>", "edit-url", mode="normal")
config.bind("<Ctrl-j>", "completion-item-focus next", mode="command")
config.bind("<Ctrl-k>", "completion-item-focus prev", mode="command")
# =================================================================#
# ====================== Gruvbox dark =============================#
# =================================================================#
config.source("./themes/base16-gruvbox-dark-hard.config.py")
