// ==UserScript==
// @name        YouTube
// @include     *://*.youtube.com/*
// ==/UserScript==

/* ~/.config/qutebrowser/greasemonkey/youtube.css.js :: */
GM_addStyle(`
    ytd-compact-promoted-video-renderer, .ytd-action-companion-ad-renderer,
    .ytp-gradient-bottom, .ytd-ad-slot-renderer, .ytd-promoted-sparkles-web-renderer {
        display: none !important;
    }
`);
