" Install vim-plug plugin manager: https://github.com/junegunn/vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" -------
" PLUGINS
" -------
call plug#begin()
" NERDTree file explorer
Plug 'preservim/NERDTree'
" CTRLP fuzzy search plugin
Plug 'ctrlpvim/ctrlp.vim'
" Lighline (better statusline)
Plug 'itchyny/lightline.vim'
" Show indents
Plug 'Yggdroot/indentLine'
" GitGutter (see what changed for git)
Plug 'airblade/vim-gitgutter'
" Plugin to toggle commentinh
Plug 'tpope/vim-commentary'
" Theme BadWolf
Plug 'sjl/badwolf'
" Theme Vim-Code-Dark
Plug 'tomasiser/vim-code-dark'
call plug#end()

let g:ctrlp_map = '<c-p>'

" Add line numbers
set number

" Add a column at 120 characters to limit line length
set colorcolumn=120

" Default indentation rules
set tabstop=4
set shiftwidth=4
set expandtab

" Add indentation rules for file extensions
autocmd BufRead,BufNewFile *.py set shiftwidth=4 tabstop=4 expandtab autoindent
autocmd BufRead,BufNewFile *.cpp set shiftwidth=2 tabstop=2 expandtab autoindent
autocmd BufRead,BufNewFile *.h set shiftwidth=2 tabstop=2 expandtab autoindent
autocmd BufRead,BufNewFile *.yaml set shiftwidth=2 tabstop=2 expandtab autoindent

" NERDTree start when Vim opens, set cursor to main window, close NERDTree when all other windows closed
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Add line length autowrap for git commits
autocmd FileType gitcommit set colorcolumn=72

" Addition to Yggdroot/indentLine: show trailing spaces
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'

" Reduce update time to reduce lag in some features
set updatetime=100

" Use colorscheme
colorscheme codedark

" Useful shortcut to toggle NERDTree
map <F2> :NERDTreeToggle<CR>
