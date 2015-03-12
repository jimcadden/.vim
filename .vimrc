
"" SETTINGS
" syntax
filetype on
filetype plugin indent on
syntax on
" basic formating
set tw=78
set ts=2
set shiftwidth=2
set backspace=2
set softtabstop=2
" display 
set number              " line numbers
set mouse=a             " mouse control
set autochdir           " auto change path to current dir
set laststatus=2        " always display status line
set showcmd             " display command
set showmatch           " show matching braces
" auto format
set autoindent
set smarttab             " auto-tab 
set expandtab            " insert spaces for tab
set nospell
set hlsearch              " highlight matches
set switchbuf+=useopen,split
set cursorline
set autoread

" Configure status line.
set stl=%f\ %m\ %r\ L:%l/%L[%p%%]\ C:%v\ Buf:#%n

"" COLORS
set t_Co=256
colorscheme zenburn


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
nnoremap <silent> q <NOP>
nnoremap <silent> qq <NOP>
" disable crashing shortcut
nnoremap <silent> <C-s> <NOP>

" turn off highlight search
map <F5> :set invhlsearch<CR>" Turn hlsearch off/on
imap <F5> :set invhlsearch<CR>

" Ggrep shortcut 
nnoremap * *``
cabbrev gg Ggrep <C-R><C-W>
" nmap <F6> :Ggrep <C-R><C-W><CR><*>

" clang-format integration
"map <C-I> :pyf /home/jmcadden/clang-format.py<CR>
"imap <C-I> <ESC>:pyf /home/jmcadden/clang-format.py<CR>i



""" PLUGINS SHORTCUTS

"pathogen plugin manager
call pathogen#infect()

"NERDTree
nnoremap <silent> <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Tlist - ctags
nnoremap <silent> <F4> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
let Tlist_Show_One_File = 1       " Only show tags for current buffer

"" TABS 
set nohidden  " close buffer when all windows close
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-t> :tabnew<CR>


"" COMMANDS
" Make auto opens c-out 
command Make make! | copen
"F2 quick fix panel toggle 
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
