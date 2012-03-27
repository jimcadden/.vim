"" SETTINGS
filetype on
filetype plugin indent on
syntax on

set number
set mouse=a
set autochdir
set autoindent
set smarttab
set shiftwidth=2
set softtabstop=2
set backspace=2
set tw=78
set laststatus=2
set expandtab
set showcmd
set showmatch
set smartcase
set spl=en spell
set nospell
set hlsearch          " turn on highlight searches, but:


"" COLORS
set t_Co=256
colorscheme wombat256


"" SYNTAX
au BufRead,BufNewFile *.dats set filetype=ats
au BufRead,BufNewFile *.cats set filetype=ats
au BufRead,BufNewFile *.sats set filetype=ats
""au! Syntax ats source ats.vim


"" KEY MAPPINGS
" Vim provides several different types of map commands, including:
" cmap handles command-line mappings.
" imap handles insert-only mappings.
" map maps keys in normal, visual, and operator-pending mode.
" map! maps keys in Vim’s command and insert modes.
" nmap maps keys in normal mode only.
" omap maps keys in operator-pending mode only.
" vmap maps keys in visual mode only.

inoremap jj <ESC>
nnoremap <silent> zk O<ESC>
nnoremap <silent> zj o<ESC>
nnoremap <silent> <C-q> :q<CR>
nnoremap <silent> Q <NOP>
map <F1> :set invhlsearch<CR> " Turn hlsearch off/on
imap <F1> :set invhlsearch<CR>


"" PLUG INS SHORTCUTS
"NERDTree
nnoremap <silent> <F4> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"Tlist
nnoremap <silent> <F3> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
let Tlist_Show_One_File = 1       " Only show tags for current buffer


"" TABS -- make tabs work like tabs, not buffers (I know.. shame on me)
set nohidden
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-t> :tabnew<CR>


"" AUTOCOMMANDS
"
" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END
