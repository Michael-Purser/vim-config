" Install vim-plug plugin manager: https://github.com/junegunn/vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" List of plugins
call plug#begin()
Plug 'preservim/NERDTree'
Plug 'sjl/badwolf'
Plug 'tomasiser/vim-code-dark'
call plug#end()

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

" Use colorscheme
colorscheme codedark

" Useful shortcut to toggle NERDTree
map <F2> :NERDTreeToggle<CR>
