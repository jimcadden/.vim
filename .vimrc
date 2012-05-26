"" SETTINGS
" syntax
filetype on
filetype plugin indent on
syntax on
" basic format
set tw=78
let tab = 2
execute "set ts=".tab
execute "set shiftwidth=".tab
execute "set backspace=".tab
" display 
set number              " line numbers
set mouse=a             " mouse control
set autochdir           " auto change path to current dir
set laststatus=2        " always display status line
set showcmd             " display command
set showmatch            " show matching braces
" auto format
set autoindent
set smarttab             " auto-tab 
set expandtab            " insert spaces for tab
execute "set softtabstop=".tab
" spelling (disabled)
set nospell
set spl=en spell
" search
set hlsearch              " highlight matches
"set incsearch           " move curses to next string as you type

"" COLORS
set t_Co=256
colorscheme molokai

"" CUSTOM SYNTAX
au BufRead,BufNewFile *.dats set filetype=ats
au BufRead,BufNewFile *.cats set filetype=ats
au BufRead,BufNewFile *.sats set filetype=ats
""au! Syntax ats source ats.vim

"" KEY MAPPINGS
" cmap - command-line mappings.
" imap - insert-only mappings.
" map - keys in normal, visual, and operator-pending mode.
" map! - keys in command and insert modes.
" nmap - keys in normal mode only.
" omap - keys in operator-pending mode only.
" vmap - keys in visual mode only.
"
" training wheels
inoremap jj <ESC>
inoremap kk <ESC>
" easy newlines
nnoremap <silent> zk O<ESC>
nnoremap <silent> zj o<ESC>
" disable recording (I never use it.. I should)
nnoremap <silent> Q <NOP>
nnoremap <silent> qq <NOP>
" turn off highlight search
map <F5> :set invhlsearch<CR>" Turn hlsearch off/on
imap <F5> :set invhlsearch<CR>
" vimgrep shortcut - I want this to act like *
cabbrev vg
      \ vimgrep /\<lt><C-R><C-W>\>/gj
      \ *<C-R>=(expand("%:e")=="" ? "" : ".*")<CR>
      \ <Bar> lw
      \ <C-Left><C-Left><C-Left>

"" PLUGINS SHORTCUTS
"NERDTree
nnoremap <silent> <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"Tlist
nnoremap <silent> <F4> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
let Tlist_Show_One_File = 1       " Only show tags for current buffer

"" TABS -- make tabs work like tabs, not buffers (I know.. shame on me)
set nohidden  " close buffer when all windows close
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-t> :tabnew<CR>

"" COMMANDS
" Make auto opens c-out 
command Make make! | copen
"quick fix panel toggle 
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction
nmap <F2> :QFix<CR>

