set number
set ruler
syntax on
set nocompatible
colorscheme desert
set mouse=a

"nnoremap <F3> :tabnew<cr>
"nnoremap <F4> :tabnext<cr>
"nnoremap <F2> :tabprev<cr>

noremap <C-left> :bprev<CR>
noremap <C-right> :bnext<CR>


set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set hidden

au BufRead,BufNewFile {*.json} set ft=javascript
au BufRead,BufNewFile {*._js} set ft=javascript

execute pathogen#infect()
filetype plugin indent on


" set backspace+=start,eol,indent 

