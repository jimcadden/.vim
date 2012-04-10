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
set hlsearch

"" FOLDS
" Space will toggle folds!
" nnoremap <space> za

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
" Swap ; and :  Convenient.
inoremap jj <ESC>
nnoremap <silent> zk O<ESC>
nnoremap <silent> zj o<ESC>
nnoremap <silent> Q <NOP>
nnoremap <silent> qq <NOP>
map <F5> :set invhlsearch<CR>" Turn hlsearch off/on
imap <F5> :set invhlsearch<CR>
"
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
command mmake make! | copen
" vimgrep shortcut
cabbrev vg
      \ vimgrep /\<lt><C-R><C-W>\>/gj
      \ *<C-R>=(expand("%:e")=="" ? "" : ".*")<CR>
      \ <Bar> lw QFix
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
"quick fix toggle command
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

