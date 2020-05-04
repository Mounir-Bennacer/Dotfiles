let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }

let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0

let g:ale_sign_error = '❌'
" let g:ale_sign_error = '💣'
" let g:ale_sign_error = '💩'
let g:ale_sign_warning = '❗'
let g:ale_fix_on_save = 1

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif "Close preview window when completion is done.
