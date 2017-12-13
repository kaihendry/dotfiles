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
Plug 'fatih/vim-go'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
"Plug 'jodosha/vim-godebug'
Plug 'posva/vim-vue'
"Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:go_fmt_command = "goimports"
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

let g:go_metalinter_autosave = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1


autocmd Filetype vue setlocal sw=2 sts=2 expandtab

set wildmode=longest,list,full
set wildmenu

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_fixers = {'vue': ['eslint']}
" nnoremap <leader>f :ALEFix<CR>
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
