"" VIM SETTINGS
"" :so %  <- source current file
""
"" KEY MAPPINGS
" cmap - command-line mappings.
" imap - insert-only mappings.
" map - keys in normal, visual, and operator-pending mode.
" map! - keys in command and insert modes.
" nmap - keys in normal mode only.
" omap - keys in operator-pending mode only.
" vmap - keys in visual mode only.
" 
" MY SHORTCUTS
" F3 - Nerdtree
" F4 - Tagbar
" F5 - Freeze Tagbar
" F8 - Toggle search highlights
""
""
" pathogen plugin manager
call pathogen#infect()
""
colorscheme zenburn
filetype on
filetype plugin indent on
syntax on
set tw=78
set ts=2
set shiftwidth=2
set backspace=2
set softtabstop=2
set number              " line numbers
set mouse=a             " mouse control
set autochdir           " auto change path to current dir
set laststatus=2        " always display status line
set showcmd             " display command
set showmatch           " show matching braces
set autoindent
set smarttab             " auto-tab 
set expandtab            " insert spaces for tab
set nospell
set hlsearch              " highlight matches
set switchbuf+=useopen,split
set cursorline
set autoread
set nohidden  " close buffer when all windows close
set stl=%f\ %m\ %r\ L:%l/%L[%p%%]\ C:%v\ Buf:#%n " Configure status line.
set t_Co=256              " default to 256 colors
" easy escape
inoremap jj <ESC>
" easy newlines
nnoremap <silent> zk O<ESC>
nnoremap <silent> zj o<ESC>
" disable recording 
nnoremap <silent> Q <NOP>
nnoremap <silent> q <NOP>
nnoremap <silent> qq <NOP>
" turn off highlight search
map <F8> :set invhlsearch<CR>" Turn hlsearch off/on
imap <F8> :set invhlsearch<CR>
" Ggrep shortcut 
nnoremap * *``
cabbrev gg Ggrep <C-R><C-W>
" clang-format integration 
map <leader><C-I> :pyf $HOME/.vim/clang-format.py<CR>
imap <leader><C-I> <ESC>:pyf $HOME/.vim/clang-format.py<CR>
" F12 clang formatting map
nmap <F12> gg V G <leader><C-I>``

"" TABS 
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-h> :tabprevious<CR>
nnoremap <silent> <C-k> :tabnext<CR>
nnoremap <silent> <C-j> :tabprevious<CR>
nnoremap <silent> <C-t> :tabnew<CR>

" NERDTree
let NERDTreeShowBookmarks=1
nnoremap <silent> <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" TAGBAR
let g:tagbar_autofocus = 1
nnoremap <silent> <F4> :TagbarOpenAutoClose<CR>
nnoremap <silent> <F5> :TagbarTogglePause<CR>

" GO-VIM 
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)

"""
""" COMMANDS
"""

"F2 quickfix panel toggle 
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    bot copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction
nmap <F2> :QFix<CR>
