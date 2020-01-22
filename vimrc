" Add line numbers to left hand side of file
set number

" Set a color at 120 chars to limit line length:
set colorcolumn=120

" Add indentation rules for file extensions
autocmd BufRead,BufNewFile *.py set shiftwidth=4 tabstop=4 expandtab autoindent
autocmd BufRead,BufNewFile *.cpp set shiftwidth=2 tabstop=2 expandtab autoindent
autocmd BufRead,BufNewFile *.h set shiftwidth=2 tabstop=2 expandtab autoindent
autocmd BufRead,BufNewFile *.yaml set shiftwidth=2 tabstop=2 expandtab autoindent

" Enter NERDTree upon entering Vim, and set the cursor to the main window instead of
" the NERDTree window
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Vim Plug plugin manager
call plug#begin('~/.vim/plugged')
" Color schemes
Plug 'https://github.com/sjl/badwolf'
Plug 'https://github.com/jonathanfilip/vim-lucius'
call plug#end()

" Used colorscheme
colorscheme badwolf
