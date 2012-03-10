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


"" COLORS
set t_Co=256
colorscheme wombat256



"" KEY MAPPINGS
inoremap jj <ESC>
nnoremap <silent> zk O<ESC>
nnoremap <silent> zj o<ESC>
nnoremap <silent> Q <NOP>


"" PLUGINS SHORTCUTS
nnoremap <silent> <F4> :NERDTreeToggle<CR>
nnoremap <silent> <F3> :Tlist<CR>


"" TABS -- make tabs work like tabs, not buffers (I know.. shame on me)
set nohidden
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-n> :tabnext<CR>
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
