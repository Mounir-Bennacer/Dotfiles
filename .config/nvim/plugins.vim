" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

" ============================================================================ "
" ===                       PLUG FOR MANAGING PLUGINS                      === "
" ============================================================================ "

" === Editing Plugins === "
Plug 'ntpeters/vim-better-whitespace'             " Trailing whitespace highlighting & automatic fixing
Plug 'mcchrish/nnn.vim'                           " using vim-plug
Plug 'vimwiki/vimwiki'                            " Vim wiki
Plug 'frazrepo/vim-rainbow'                       " Vim bracket highlighting
Plug 'jreybert/vimagit'                           " Better GIT workflow
Plug 'ap/vim-css-color'                           " Color previews for CSS
Plug 'jiangmiao/auto-pairs'                       " auto close / create pairs
Plug 'tpope/vim-surround'                         " Surround plugin
Plug 'takac/vim-hardtime'                         " hardtime
Plug 'Shougo/denite.nvim'                         " Denite - Fuzzy finding, buffer management
Plug 'Shougo/echodoc.vim'                         " Print function signatures in echo area
Plug 'Shougo/neosnippet'                          " Snippet support
Plug 'Shougo/neosnippet-snippets'                 " Snippet support
Plug 'Yggdroot/indentLine'                        " Indentation guids
Plug 'machakann/vim-highlightedyank'              " Highlighting yanked words/lines
" === Git Plugins === "
Plug 'tpope/vim-fugitive'                         " Enable git changes to be shown in sign column
Plug 'airblade/vim-gitgutter'                     " Gitgutter
" === Javascript Plugins === "
Plug 'HerringtonDarkholme/yats.vim'               " Typescript syntax highlighting
Plug 'mxw/vim-jsx'                                " ReactJS JSX syntax highlighting
Plug 'heavenshell/vim-jsdoc'                      " Generate JSDoc commands based on function signature
" === ALE linter ===
Plug 'w0rp/ale'                                   " Asynchronous Lint on vim
" === Colorscheme === "
Plug 'fneu/breezy'                                " breezy colorscheme
Plug 'ParamagicDev/vim-medic_chalk'               " medic_chalk colorscheme
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/edge'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/forest-night'
Plug 'drewtempelmeyer/palenight.vim'              " palenight colorscheme
" === Syntax Highlighting === "
Plug 'elzr/vim-json'                              " Syntax highlighting for json
Plug 'othree/javascript-libraries-syntax.vim'     " Syntax highlighting for javascript libraries
Plug 'othree/yajs.vim'                            " Improved syntax highlighting and indentation
Plug 'tpope/vim-commentary'                       " Commenting
Plug 'yuezk/vim-js'                               " Syntax Highlighting
Plug 'maxmellon/vim-jsx-pretty'                   " Syntax Highlighting
Plug 'HerringtonDarkholme/yats.vim'               " Syntax Highlighting
Plug 'vim-pandoc/vim-pandoc-syntax'               " Syntax Highlighting
Plug 'unblevable/quick-scope'                     " Syntax Highlighting
Plug 'rust-lang/rust.vim'                         " Rust-lang syntax
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" === UI === "
Plug 'itchyny/lightline.vim'                      " Customized vim status line
Plug 'sainnhe/artify.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'macthecadillac/lightline-gitdiff'
Plug 'maximbaz/lightline-ale'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'rmolin88/pomodoro.vim'                      " Track time when coding
Plug 'ryanoasis/vim-devicons'                     " Icons
Plug 'junegunn/goyo.vim'                          " Distraction free mode
Plug 'mhinz/vim-startify'                         " Better homepage
Plug 'christoomey/vim-tmux-navigator'             " Tmux style navigation
" === CoC === "
Plug 'neoclide/coc.nvim',       { 'branch': 'release', 'do': { -> coc#util#install() } }
"" for coc-word plugin
Plug 'neoclide/coc-sources',    {'do': 'yarn install --frozen-lockfile'}
"

"
" === DEPRECATED === "
" Plug 'scrooloose/nerdtree'                        " File explorer
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'    " Syntax highlighting for NerdTree
" Plug 'mhinz/vim-signify'                          " Enable git changes to be shown in sign column
" Plug 'vifm/vifm.vim'                              " Vim File Manager

" Initialize plugin system
call plug#end()
