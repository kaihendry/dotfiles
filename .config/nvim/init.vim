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

syntax on
filetype plugin indent on
set nofoldenable

" Using tabless https://www.npmjs.com/package/standard
autocmd Filetype javascript setlocal sw=2 sts=2 expandtab

call plug#begin('~/.vim/plugged')
" Golang stuffs
Plug 'fatih/vim-go'
Plug 'SirVer/ultisnips'

" vim-go crutch to help generate tests for Golang
Plug 'buoto/gotests-vim'

" So I can hyperlink the github code I am editing to show the line I am
" working on
Plug 'tyru/open-browser-github.vim'
Plug 'tyru/open-browser.vim'

" So commenting in & out code blocks works
Plug 'tpope/vim-commentary'

" Could use
" https://www.reddit.com/r/neovim/comments/8sigvd/how_do_i_open_a_js_file_under_my_cursor/e102d2a/
" instead
Plug 'tpope/vim-apathy'

" For mangling JSON
Plug 'tpope/vim-jdaddy'

" Only used when I edit .vue files
Plug 'posva/vim-vue'

" So Neovim can remember where it left off
Plug 'farmergreg/vim-lastplace'

" So I can move between buffers easier... maybe I should use tabs or ctrl-^ instead?
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

autocmd Filetype vue setlocal sw=2 sts=2 expandtab

set wildmode=longest,list,full
set wildmenu

" https://en.parceljs.org/hmr.html#safe-write
set backupcopy=yes

set clipboard+=unnamedplus

" https://github.com/ctrlpvim/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'
