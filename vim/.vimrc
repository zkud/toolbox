" Set leader key to space
let mapleader=" "

" Enable break indent
set breakindent
" Set tabstop to 4 spaces (how many spaces a <Tab> character consumes)
set tabstop=4
" Set shiftwidth to 4 spaces (how many spaces are used for auto-indentation)
set shiftwidth=4
" Set expandtab to true to convert tabs to spaces
set expandtab

" Move focus to the left window
nnoremap <C-h> <C-w><C-h>
" Move focus to the right window
nnoremap <C-l> <C-w><C-l>
" Move focus to the lower window
nnoremap <C-j> <C-w><C-j>
" Move focus to the upper window
nnoremap <C-k> <C-w><C-k>

call plug#begin('~/.vim/deps')

" Colorscheme
Plug 'sainnhe/everforest'

call plug#end()

" Automatically install missing plugins on startup
PlugInstall --sync | q

" Setting colorscheme as instructed here https://github.com/sainnhe/everforest/blob/85a86eb62409e3ec88713bff3d1b9d7374e112e4/doc/everforest.txt#L223-L232
if has('termguicolors')
  set termguicolors
endif
set background=dark
colorscheme everforest
