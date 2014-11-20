map <F8> :setlocal spell! spelllang=en_gb<CR>
set title
set ruler
set showmatch
set ignorecase
set incsearch
set hlsearch
set bs=2
set nobackup
let html_use_css = 1

set encoding=utf-8

set diffopt+=iwhite " Ignore whitespace whilst diffing
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noswapfile

set background=dark

set undofile
set undodir=/tmp

" execute pathogen#infect()
syntax on
filetype plugin on
filetype indent on
autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd FileType go compiler go
set runtimepath+=/usr/lib/go/misc/vim
let g:gofmt_command ="goimports"

