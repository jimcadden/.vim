"" VIM CONFIGUATION
""
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
syntax enable
let mapleader="?"
set gfn=Monaco:h13      " OSX 
set background=dark
set timeoutlen=1500
set tw=78
set ts=2
set cmdheight=2
set shiftwidth=2
set backspace=2
set softtabstop=2
set number              " line numbers
set mouse=a             " mouse control
set autochdir           " auto change path to current dir
set laststatus=2        " always display status line
set showcmd             " display command
set showmatch           " show matching braces
set smartcase           " case insensitive searches become sensitive with capitals
set autoindent
set smarttab            " auto-tab 
set expandtab           " insert spaces for tab
set nospell
set hlsearch              " highlight matches
"set switchbuf+=useopen,split
set cursorline
set autoread              " automatically reread files changed externally
set paste
set pastetoggle=<F2>      " toggle paste-intend on/off (must be in insert mode)
set nohidden              " close buffer when all windows close
set t_Co=256              " default to 256 colors
let g:solorized_termcolors=256
set stl=%<%.99F\[%n]%{fugitive#statusline()}%y%w%m%r\ line:%l/%L\ col:%c\ 
colorscheme solarized
filetype on
filetype plugin indent on
au BufRead,BufNewFile *.sls setfiletype yaml
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
au FileType gitcommit set tw=72
au FileType gitcommit set spell 
au FileType markdown set spell 
" disable recording 
nnoremap <silent> Q <NOP>
nnoremap <silent> q <NOP>
nnoremap <silent> qq <NOP>
" easy escape
inoremap qq <ESC>
inoremap QQ <ESC>
nnoremap qq :q<CR> 
nnoremap QQ :qa<CR> 
" easy newlines
nnoremap <silent> zk O<ESC>
nnoremap <silent> zj o<ESC>
"" tab shortcuts 
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-h> :tabprevious<CR>
nnoremap <silent> <C-k> :tabnext<CR>
nnoremap <silent> <C-j> :tabprevious<CR>
nnoremap <silent> <C-t> :tabnew<CR>
" quick search file
nnoremap * *``
" F2 quickfix toggle
nmap <F2> :QFix<CR>
" F3 quickfix toggle
nmap <F3> :Loc<CR>
" F4 clang-format integration 
map <C-I> :py3f $HOME/.vim/clang-format.py<cr>
"imap <C-I> <c-o>:py3f $HOME/.vim/clang-format.py<cr>
nmap <F4> ggVG :py3f $HOME/.vim/clang-format.py<cr>
" F5 NERDTreeToggle 
nnoremap <silent> <F5> :NERDTreeToggle<CR>
" F8  toggle highlight search
map <F8> :set invhlsearch<CR>" Turn hlsearch off/on
imap <F8> :set invhlsearch<CR>
" buffers
nnoremap <Leader>bd :bd<CR>
" quick quit
nnoremap <Leader>q :qa<CR>

"" PLUGINS """"""""""""""""""""""""""""""""""""""""""


" CTAGS
let g:tagbar_ctags_bin = '$HOME/usr/local/bin/ctags'
" FUGATIVE 
autocmd BufReadPost fugitive://* set bufhidden=delete
"cabbrev gg GgrepQF <C-R><C-W>
nnoremap <Leader>gG :GgrepQF! <C-R><C-W>
nnoremap <Leader>gg :GgrepQF! <C-R><C-W><CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gvdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gl :exe ':!cd ' . expand('%:p:h') . '; git lg'<CR>
nnoremap <Leader>gh :GllogLoc! -30<CR>
nnoremap <Leader>gH :GllogLoc! -30 -- <CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>g- :silent Git stash<CR>:e<CR>
nnoremap <Leader>g+ :silent Git stash pop<CR>:e<CR>
"cabbrev gh Ggrep <C-R><C-W>
" airline
let g:airline#extensions#whitespace#enabled = 0
" Git-gutter
set updatetime=250
" CtrlP
nnoremap <silent> <C-b> :CtrlPBuffer<CR>
nnoremap <silent> <C-m> :CtrlPMRU<CR>
nnoremap <silent> <C-P> :CtrlPMixed<CR>
" NERDTree
let NERDTreeShowBookmarks=1
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
"au FileType go nmap <Leader>gD <Plug>(go-doc-vertical)
"au FileType go nmap <Leader>gDB <Plug>(go-doc-browser)
"au FileType go nmap <Leader>gR <Plug>(go-run)
au FileType go nmap <Leader>gv <Plug>(go-build)
" QFEnter
let g:qfenter_keymap = {}
let g:qfenter_keymap.open = ['<CR>']
let g:qfenter_keymap.vopen = ['<Leader><CR>']
let g:qfenter_keymap.hopen = ['<Leader><Space>']
let g:qfenter_keymap.topen = ['<Leader><Tab>']
"
"" COMMANDS
"
" vim-fugative Ggrep and open quickfix window
command -bang -nargs=? GgrepQF call GgrepOpenQFW(<bang>0,<q-args>)
function! GgrepOpenQFW(bang,args) 
  if a:bang == 0
    execute "silent Ggrep ".a:args
  else
    execute "silent Ggrep! ".a:args
  endif
  execute ':redraw!'
  call QFixToggle(1) 
endfunction
" vim-fugative Gllog and open locations window
command -bang -nargs=? GllogLoc call GllogOpenLoc(<bang>0,<q-args>)
function! GllogOpenLoc(bang,args) 
  if a:bang == 0
    execute "silent Gllog ".a:args
  else
    execute "silent Gllog! ".a:args
  endif
  execute ':redraw!'
  call LocToggle(1) 
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
