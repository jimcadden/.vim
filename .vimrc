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
set laststatus=2
set expandtab
set showcmd
set showmatch
set smartcase
set hlsearch
set spl=en spell
set nospell



"" KEY MAPPINGS
"
inoremap jj <ESC>
nnoremap <silent> zk O<ESC>
nnoremap <silent> zj o<ESC>
"nnoremap <silent> k gk
"nnoremap <silent> j gj
"inoremap <silent> <Up> <Esc>gka
"inoremap <silent> <Down> <Esc>gja

"" break bad habits
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>



"" PLUGINS SHORTCUTS
"
nnoremap <silent> <F4> :NERDTreeToggle<CR>
" Open the TagList Plugin <F3>
nnoremap <silent> <F3> :Tlist<CR>

"" CTRLP Settings
set wildignore+=*/tmp*,*.so,*.swp.*.zip


"" TABS -- make tabs work like tabs, not buffers (I know.. shame on me)
"
" When I close a tab, remove the buffer
set nohidden
" Next Tab
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-n> :tabnext<CR>
" Previous Tab
nnoremap <silent> <C-Left> :tabprevious<CR>
" New Tab
nnoremap <silent> <C-t> :tabnew<CR>



"" COLORS
"
colorscheme molokai "wombat256



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
