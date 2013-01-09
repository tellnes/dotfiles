set number
syntax on
set nocompatible
colorscheme desert
set mouse=a

nnoremap å :tabnew<cr>
nnoremap æ :tabnext<cr>
nnoremap ø :tabprev<cr>

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

au BufRead,BufNewFile {*.json} set ft=javascript

