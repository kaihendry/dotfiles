map <F8> :setlocal spell! spelllang=en_gb<CR>
set title
set ruler
set showmatch
set ignorecase
set incsearch
set hlsearch
set bs=2
set nobackup

" https://en.parceljs.org/hmr.html#safe-write
set backupcopy=yes

set encoding=utf-8

set diffopt+=iwhite " Ignore whitespace whilst diffing
nnoremap <silent> <F5> :%s/\s\+$//<cr>

set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set shiftwidth=4
set softtabstop=4
set tabstop=4

set background=dark

set undofile
set undodir=/tmp

syntax on
filetype plugin indent on
set nofoldenable

" Using tabless https://www.npmjs.com/package/standard
autocmd Filetype javascript setlocal sw=2 sts=2 expandtab

autocmd Filetype vue setlocal sw=2 sts=2 expandtab

set wildmode=longest,list,full
set wildmenu

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

autocmd BufReadPost *.jsonnet setl expandtab

" iab <expr> dt strftime("# %F %a\n")

" set cursorline
" set cursorcolumn

set guifont=Terminus_(TTF):h22

" https://youtu.be/PEm0QJ46hNo
inoremap <C-H> <C-W>

let g:indent_guides_enable_on_vim_startup = 1
