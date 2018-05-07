"set leader and localleader for mappings

let mapleader = ","
let maplocalleader = "\\"

" set pathogen settings {{{

call pathogen#infect()
call pathogen#helptags()

" }}}

" General settings {{{

syntax on		" syntax highlight
set nocompatible	" not compatible with the old fashion vi mode

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set tabstop=4		" a tab is 4 spaces
set shiftwidth=4	" number of spaces to use for auto indenting
set softtabstop=4	" when hitting <BS>, pretend like a tab is removed even if its spaces
set expandtab		" expand tabs by default


set history=500		" keep 50 lines of command line history
set number		" add line numbers

"toggle relative numbers
"nnoremap <leader>N :setlocal relativenumber!<cr>
nnoremap <leader>N :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside

set hlsearch		" search highlighting
set incsearch		" incremental search

" disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

set autoindent		" auto indentation

set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context
set clipboard=unnamed	" yank to the system register (*) by default
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu
set wildmode=list:full	" show a list when pressing tab and complete first full match

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc,*.swp,*.bak

set ttyfast		" make keyboard fast

" Thanks to Steve Losh for this liberating tip
" " See http://stevelosh.com/blog/2010/09/coming-home-to-vim
nnoremap / /\v
vnoremap / /\v

" :W sudo saves the file
" (useful for handling the permission denied error)
command! W w !sudo tee % > /dev/null

" <Leader>v = Paste
noremap <Leader>v "+gP

" <Leader>c = Copy
noremap <Leader>c "+y

" }}}

" File rules {{{

set nobackup		" no *~ backup files
set noswapfile		" no intermediate swap files
set nowb

" }}}

" Folding rules {{{
set foldenable                  " enable folding
set foldcolumn=2                " add a fold column
set foldmethod=marker           " detect triple-{ style fold markers
set foldlevelstart=99           " start out with everything unfolded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                " which commands trigger auto-unfold
" Mappings to easily toggle fold levels
nnoremap z0 :set foldlevel=0<cr>
nnoremap z1 :set foldlevel=1<cr>
nnoremap z2 :set foldlevel=2<cr>
nnoremap z3 :set foldlevel=3<cr>
nnoremap z4 :set foldlevel=4<cr>
nnoremap z5 :set foldlevel=5<cr>

" }}}

" Editor layout {{{
set termencoding=utf-8
set encoding=utf-8		" set utf8 as standard encoding
set lazyredraw                  " don't update the display while executing macros
set laststatus=2                " tell VIM to always put a status line in, even if there is only one window
set cmdheight=2                 " use a status bar that is 2 rows high

" }}}

" Status line {{{
set laststatus=2		" always put a status line in, even if there is only one window
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
set statusline+=\ \ \ [%{&ff}/%Y] 
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
let curdir = substitute(getcwd(), $HOME, "~", "")
return curdir
endfunction

function! HasPaste()
	if &paste
		return '[PASTE]'
	else
		return ''
	endif
endfunction

" }}}

"Colours and Fonts {{{

colorscheme darkblue " this one works well, feel free to change
set background=dark
hi Search ctermbg=LightYellow
hi Search ctermfg=red
hi Special ctermfg=red " for query specific keywords
hi Underlined ctermfg=magenta cterm=bold " for local variables
set tags=tags;

" }}}

" Moving around windows and tabs {{{

" moving between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" moving between tabs
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove 
noremap <leader>t<leader> :tabnext 



" }}}

" Editing mappings {{{

"this is to map ctrl+u to make a word all uppercase in insert mode and in normal mode
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU

" quick alignment of text
nnoremap <leader>al :left<CR>
nnoremap <leader>ar :right<CR>
nnoremap <leader>ac :centre<CR>

" spell checking
nnoremap <leader>ss :setlocal spell!<cr>

" }}}

" Plugin settings {{{

" vim-latex - many latex shortcuts {{{
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
" }}}

" NERDTREE mappings {{{

" Toggle visibility
nnoremap <leader>n :NERDTreeToggle<CR>
" Focus on NERDTree
nnoremap <leader>m :NERDTreeFocus<CR>
" Focus on NERDTree with the currently opened file
nnoremap <leader>M :NERDTreeFind<CR>

" Open NERDTree if we're executing vim without specifying a file to open
autocmd vimenter * if !argc() | NERDTree | endif

" Show hidden files
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Use a single click to fold/unfold directories and a double click to open
" files
let NERDTreeMouseMode=2

" Dont display these knids of files
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.py\$class$', '^\.git$', '__pycache__']

" }}}

" FuzzyFinder {{{

nnoremap '<Space> :FufBookmarkDir<cr>
nnoremap '.  :FufFileWithCurrentBufferDir<cr>
nnoremap ''  :b#<cr>
nnoremap '/  :FufFile /<cr>
nnoremap 'f  :FufFile<cr>
nnoremap 'h  :FufFile $HOME/<cr>
nnoremap 'j  :FufFile $HOME/.vim/<cr>
nnoremap 'k  :FufBuffer<cr>
nnoremap 'l  :FufTag<cr>
let g:fuf_file_exclude = '\v\~$|\.(DS_Store|o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_buffer_keyDelete = '<C-d>'

" }}}

" }}}

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

