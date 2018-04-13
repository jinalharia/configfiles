"this is to add line numbers
set number
"set leader and localleader for mappings
let mapleader = ","
let maplocalleader = "\\"
filetype plugin on
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'
colorscheme darkblue " this one works well, feel free to change
set background=dark
syntax on
hi Special ctermfg=red " for query specific keywords
hi Underlined ctermfg=magenta cterm=bold " for local variables
set tags=tags;
"this is to map ctrl+u to make a word all uppercase in insert mode and in normal mode
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU
"mapping to open .vimrc file and source it
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"add abbreviations
iabbrev @@ jinalharia@gmail.com
"mapping to move to start and end of line
nnoremap H 0
nnoremap L $
"mapping jk to escape for ease and disabling escape to train
inoremap jk <esc>
inoremap <esc> <nop>
inoremap OD <nop>
inoremap OC <nop>
inoremap OA <nop>
inoremap OB <nop>
