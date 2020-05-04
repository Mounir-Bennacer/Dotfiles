" NEOSNIPPET SETUP
" Map <C-k> as shortcut to activate snippet if available
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)


let g:neosnippet#snippets_directory='~/.config/nvim/snippets' " Load custom snippets from snippets folder
let g:neosnippet#enable_conceal_markers = 0                   " Hide conceal markers