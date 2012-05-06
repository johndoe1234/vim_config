if !exists("g:loaded_pathogen")
    call pathogen#infect()
    call pathogen#runtime_append_all_bundles()
    call pathogen#helptags()
    endif

if &t_Co >= 256 || has("gui_running")
   colorscheme molokai
endif

if has("syntax")
  syntax on
endif

" Source the vimrc file after saving it
"regenerate ctags for project that file has been saved
if has("autocmd")
  autocmd! bufwritepost vimrc source $MYVIMRC
  autocmd! bufwritepost .vimrc source $MYVIMRC
  autocmd! bufwritepost *.cpp silent! execute '!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++'
  autocmd! bufwritepost *.cxx silent! execute '!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++'
  autocmd! bufwritepost *.c silent! execute '!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++'
  autocmd! bufwritepost *.h silent! execute '!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++'
  autocmd! bufwritepost *.hh silent! execute '!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++'
  "autocmd! FileType c,cpp nested :TagbarOpen
endif

"move undofiles to some master trash dir
set undodir=~/.vimundo

filetype plugin indent on


"remap leader from \ to ,
let mapleader = ","


set nocompatible
set autowrite		" Automatically save before commands like :next and :make

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set nobackup
set noswapfile

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set hidden             " Hide buffers when they are abandoned
set wildmenu
set wildmode=list:longest,full
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set showmatch		" Show matching brackets.
set gdefault        " automatic adding g in regexp substisute :%s/something/else/g
set showcmd		" Show (partial) command in status line.
set hlsearch 
"clearing search results
nnoremap <leader>/ :noh<cr>


set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85


set list
set listchars=tab:▸\ ,eol:¬,trail:.,extends:#,nbsp:.

"killing arrow keiys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk


"no need for F1 help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"no need to use shift
nnoremap ; :

"when changing focus always write changes to a file
au FocusLost * :wa


"exiting insert mode with jj
inoremap jj <ESC>l

"create new vertical split window and move to it
nnoremap <leader>w <C-w>v<C-w>l

"moving between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>


nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

"number of lines visible before scrolling
set scrolloff=8
set sidescrolloff=8

set history=500


"fugitive mappings
nnoremap <silent> <leader>gs :Gstatus<CR> "getting status

"FSwitch definitions and mappings
augroup mycppfiles
    au!
    "creating .cpp files if it does not exist,
    "and looking for .cc and .c fle if .cpp does not exist
    au BufEnter *.h let b:fswitchdst  = 'cpp,cc,C'
augroup END

"Switch to the file and load it into the current window 
nmap <silent> <Leader>of :FSHere<cr>
"Switch to the file and load it into the window on the right 
nmap <silent> <Leader>ol :FSRight<cr>
"Switch to the file and load it into a new window split on the right 
nmap <silent> <Leader>oL :FSSplitRight<cr>
"Switch to the file and load it into the window on the left 
nmap <silent> <Leader>oh :FSLeft<cr>
"Switch to the file and load it into a new window split on the left 
nmap <silent> <Leader>oH :FSSplitLeft<cr>

"setings for tagbar
let g:tagbar_left=1
nnoremap <silent> <F9> :TagbarToggle<CR>


"UltiSnips setup
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsEditSplit='vertical'

set tags +=~/.vim/tags/qt4



