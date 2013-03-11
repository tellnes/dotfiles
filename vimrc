set number
syntax on
set nocompatible
colorscheme desert
set mouse=a

nnoremap <F3> :tabnew<cr>
nnoremap <F4> :tabnext<cr>
nnoremap <F2> :tabprev<cr>

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

au BufRead,BufNewFile {*.json} set ft=javascript

