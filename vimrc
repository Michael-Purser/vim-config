" Install vim-plug plugin manager: https://github.com/junegunn/vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Source CSCOPE file
source ~/.vim/cscope_maps.vim

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
" Plugin to toggle commenting
Plug 'tpope/vim-commentary'
" YouCompleteMe
Plug 'Valloric/YouCompleteMe'
" Autoformat
Plug 'vim-autoformat/vim-autoformat'
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

" Set status line in every tab
set laststatus=2

" Add indentation rules for file extensions
autocmd BufRead,BufNewFile *.py set shiftwidth=4 tabstop=4 expandtab autoindent
autocmd BufRead,BufNewFile *.cpp set shiftwidth=2 tabstop=2 expandtab autoindent
autocmd BufRead,BufNewFile *.h set shiftwidth=2 tabstop=2 expandtab autoindent
autocmd BufRead,BufNewFile *.yaml set shiftwidth=2 tabstop=2 expandtab autoindent

" Add line length autowrap for git commits
autocmd FileType gitcommit set colorcolumn=72

" Addition to Yggdroot/indentLine: show trailing spaces
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'

" YouCompleteMe settings
let g:ycm_enable_semantic_highlighting=1

" Reduce update time to reduce lag in some features
set updatetime=100

" Use colorscheme
colorscheme codedark

" Remappings
nnoremap to :tabnew<CR>
nnoremap tn :tabm +1<CR>
nnoremap tp :tabm -1<CR>

" Useful shortcut to toggle NERDTree
map <F2> :NERDTreeToggle<CR>

" Shortcut to enable formatting
noremap <F3> :Autoformat<CR>

" ---------------------
" SESSION RESTORE STUFF
" ---------------------
"  Convenience functions
function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

function! OpenNERDTree()
  if (tabpagenr() == 1)
    :NERDTree | wincmd p
  else
    :NERDTreeMirror | wincmd p
  endif
endfunction

" To do on leave / enter
au VimLeave * :tabdo NERDTreeClose
au VimLeave * if &ft != "gitcommit" | :call MakeSession()
au VimEnter * nested if &ft != "gitcommit" | :call LoadSession()
au VimEnter * :tabdo :call OpenNERDTree()

autocmd BufWinEnter * NERDTreeMirror
