set number
syntax on
set nocompatible
colorscheme desert
set mouse=a

nnoremap å :tabnew<cr>
nnoremap æ :tabnext<cr>
nnoremap ø :tabprev<cr>

au BufRead,BufNewFile {*.json} set ft=javascript

