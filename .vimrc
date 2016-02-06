"" VIM CONFIGUATION
""
"" TODO
" -- new tab shortcuts (ctl+w o, crt+w p?)
" -- Only auto-open quixf & locations window if they have content
"" 
"" SHORTCUTS
"" F2 - quickfix bottom toggle 
"" F3 - locations bottom toggle 
"" F4 - clang format entire file
"" F5 - nerdtree window
"" F6 - tagbar window
"" F7 - tagbar freeze/unfreeze file
"" F8 - search highlights on/off
""
"" REMINDERS
"" :so %             source current file
"" %                 goto corresponding bracket [,{,(
"" ci{,ci",ci(       change within
"" t*                jump to *
"" H                 jump curser to top of window
"" zz                current line center of window
"" z+<enter>         current line to top of window
""
"" KEYMAP LEGEND
" cmap - command-line mappings.
" imap - insert-only mappings.
" map -  keys in normal, visual, and operator-pending mode.
" map! - keys in command and insert modes.
" nmap - keys in normal mode only.
" omap - keys in operator-pending mode only.
" vmap - keys in visual mode only.
""
call pathogen#infect() " pathogen plugin manager
colorscheme zenburn
filetype on
filetype plugin indent on
syntax on
set tw=78
au FileType gitcommit set tw=72
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
au FileType gitcommit set spell 
set hlsearch              " highlight matches
set switchbuf+=useopen,split
set cursorline
set autoread
set pastetoggle=<F2>      " toggle paste-intend on/off (must be in insert mode)
set nohidden  " close buffer when all windows close
set stl=[%n]%{fugitive#statusline()}%h%w%m%r\ %<%.99f\ (%l,%c)\ %P\ " Configure status line.
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
"" tab shortcuts 
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-h> :tabprevious<CR>
nnoremap <silent> <C-k> :tabnext<CR>
nnoremap <silent> <C-j> :tabprevious<CR>
nnoremap <silent> <C-t> :tabnew<CR>
" toggle highlight search
map <F8> :set invhlsearch<CR>" Turn hlsearch off/on
imap <F8> :set invhlsearch<CR>
" Quick search local file
nnoremap * *``
" clang-format integration 
map <leader><C-I> :pyf $HOME/.vim/clang-format.py
imap <leader><C-I> <ESC>:pyf $HOME/.vim/clang-format.py
" F2 quickfix toggle
nmap <F2> :QFix<CR>
  " F3 quickfix toggle
nmap <F3> :Loc<CR>
" F4 clang formatting map
nmap <F4> gg V G <leader><C-I>``
" buffers
nnoremap <Leader>bd :bd<CR>
" FUGATIVE 
cabbrev gg GgrepOpen <C-R><C-W>
nnoremap <Leader>gG :Ggrep <C-R><C-W><CR>
nnoremap <Leader>gg :Ggrep! <C-R><C-W><CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gvdiff<CR>
nnoremap <Leader>gc :Git diff --cached<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gl :exe ':!cd ' . expand('%:p:h') . '; git lg'<CR>
nnoremap <Leader>gh :Gllog<CR>
nnoremap <Leader>gH :Gllog<CR>:set nofoldenable<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>g- :silent Git stash<CR>:e<CR>
nnoremap <Leader>g+ :silent Git stash pop<CR>:e<CR>
"cabbrev gh Ggrep <C-R><C-W>
" NERDTree
let NERDTreeShowBookmarks=1
nnoremap <silent> <F5> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" TAGBAR
let g:tagbar_autofocus = 1
nnoremap <silent> <F6> :TagbarOpenAutoClose<CR>
nnoremap <silent> <F7> :TagbarTogglePause<CR>
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
"
"" COMMANDS
"
" vim-fugative lgrep and open locations window
command -bang -nargs=? GgrepOpen call GgrepOpenLoc(<bang>0,<q-args>)
function! GgrepOpenLoc(band,args) 
  execute "Ggrep! ".a:args
  call QFixToggle(1) 
endfunction
"
" quickfix panel toggle 
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
"
" locations panel toggle 
command -bang -nargs=? Loc call LocToggle(<bang>0)
function! LocToggle(forced)
  let buffer_count_before = s:BufferCount()
  silent! lclose
  if s:BufferCount() == buffer_count_before || a:forced == 1
    execute "silent! lopen 10"
  endif
endfunction
"
" buffer count
function! s:BufferCount()
  return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction
