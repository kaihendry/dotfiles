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

" http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=longest,list,full
set wildmenu

" execute pathogen#infect()
" call pathogen#helptags()

syntax on
filetype plugin indent on
set nofoldenable

let g:go_fmt_command = "goimports"

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
cmap w!! w !sudo tee > /dev/null %

" nnoremap <silent> <F6> :SyntasticCheck<CR>
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_check_on_open = 1             " default is 0
let g:syntastic_enable_signs = 1              " default is 1
let g:syntastic_enable_baloons = 1            " default is 1
let g:syntastic_enable_highlighting = 1       " default is 1
let g:syntastic_auto_jump = 0                 " default is 0
let g:syntastic_auto_loc_list = 2             " default is 2
let g:syntastic_always_populate_loc_list = 1  " default is 0

" Remember last cursor position
"if has("autocmd")
"	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif
