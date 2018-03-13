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
Plug 'sbdchd/neoformat'
Plug 'w0rp/ale'
Plug 'srstevenson/vim-picker'
"Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'posva/vim-vue'
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:go_fmt_command = "goimports"
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

autocmd Filetype vue setlocal sw=2 sts=2 expandtab

set wildmode=longest,list,full
set wildmenu

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'vue': ['eslint'],
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

nmap <unique> <leader>s <Plug>PickerSplit

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"
