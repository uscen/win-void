" source: https://www.reddit.com/r/neovim/comments/nu8e0t/help_needed_with_markdown_syntax_conceal_and/
" syn region markdownLink matchgroup=markdownLinkDelimiter start="(" end=")" contains=markdownUrl keepend contained conceal
" syn region markdownLinkText matchgroup=markdownLinkTextDelimiter start="!\=\[\%(\%(\_[^][]\|\[\_[^][]*\]\)*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@=" nextgroup=markdownLink,markdownId skipwhite contains=@markdownInline,markdownLineStart concealends

" 06/23/22 - treesitter now conceals links https://github.com/nvim-treesitter/nvim-treesitter/commit/778bfc337a010a5276b4736174c7c544b70236b5
