"{{{ vim-startify
"
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_files_number = 5
let g:startify_update_oldfiles = 1
let g:startify_session_delete_buffers = 1 " delete all buffers when loading or closing a session, ignore unsaved buffers
let g:startify_change_to_dir = 1 " when opening a file or bookmark, change to its directory
let g:startify_fortune_use_unicode = 1 " beautiful symbols
let g:startify_padding_left = 3 " the number of spaces used for left padding
let g:startify_session_remove_lines = ['setlocal', 'winheight'] " lines matching any of the patterns in this list, will be removed from the session file
let g:startify_session_sort = 1 " sort sessions by alphabet or modification time
let g:startify_custom_indices = ['1', '2', '3', '4', '5', '1', '2', '3', '4', '5'] " MRU indices
" line 579 for more details
if has('nvim')
  let g:startify_commands = [
        \ {'1': 'CocList'},
        \ {'2': 'terminal'},
        \ ]
endif
let g:startify_custom_header = [
      \'███╗   ███╗ ██████╗ ██╗   ██╗███╗   ██╗██╗██████╗     ██████╗ ███████╗███╗   ██╗███╗   ██╗ █████╗  ██████╗███████╗██████╗',
      \'████╗ ████║██╔═══██╗██║   ██║████╗  ██║██║██╔══██╗    ██╔══██╗██╔════╝████╗  ██║████╗  ██║██╔══██╗██╔════╝██╔════╝██╔══██╗',
      \'██╔████╔██║██║   ██║██║   ██║██╔██╗ ██║██║██████╔╝    ██████╔╝█████╗  ██╔██╗ ██║██╔██╗ ██║███████║██║     █████╗  ██████╔╝',
      \'██║╚██╔╝██║██║   ██║██║   ██║██║╚██╗██║██║██╔══██╗    ██╔══██╗██╔══╝  ██║╚██╗██║██║╚██╗██║██╔══██║██║     ██╔══╝  ██╔══██╗',
      \'██║ ╚═╝ ██║╚██████╔╝╚██████╔╝██║ ╚████║██║██║  ██║    ██████╔╝███████╗██║ ╚████║██║ ╚████║██║  ██║╚██████╗███████╗██║  ██║',
      \'╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝    ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝╚══════╝╚═╝  ╚═╝',
                                                                                                                          \ ]
" costom startify list
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': [" \ue62e Sessions"]       },
      \ { 'type': 'bookmarks', 'header': [" \uf5c2 Bookmarks"]      },
      \ { 'type': 'files',     'header': [" \ufa1eMRU Files"]            },
      \ { 'type': 'dir',       'header': [" \ufa1eMRU Files in ". getcwd()] },
      \ { 'type': 'commands',  'header': [" \ufb32 Commands"]       },
      \ ]
"}}}