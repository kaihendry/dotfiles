map <F8> :setlocal spell! spelllang=en_gb<CR>
syntax on
set ruler
set ignorecase
set incsearch
set hlsearch
set backspace=indent,eol,start
set nobackup
let html_use_css = 1		" for :TOhtml not to add inline style crud

au BufReadCmd *.wgt call zip#Browse(expand("<amatch>"))
set encoding=utf-8

highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
set diffopt+=iwhite " Ignore whitespace whilst diffing
