// ==UserScript==
// @name        YouTube
// @include     *://*.youtube.com/*
// ==/UserScript==
GM_addStyle(`
    .ytd-compact-promoted-video-renderer, .ytd-action-companion-ad-renderer,
    .ytd-ad-slot-renderer, .ytd-promoted-sparkles-web-renderer {
        display: none !important;
    }
`);
