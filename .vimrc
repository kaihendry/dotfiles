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

call plug#begin('~/.vim/plugged')

" JS stuff and JSON/YAML formatting
Plug 'dense-analysis/ale'

" Golang stuffs
Plug 'fatih/vim-go'

" vim-go crutch to help generate tests for Golang
Plug 'buoto/gotests-vim'

" So I can hyperlink the github code I am editing to show the line I am
" working on
Plug 'tyru/open-browser-github.vim'
Plug 'tyru/open-browser.vim'

" So commenting in & out code blocks works
Plug 'tpope/vim-commentary'

Plug 'ervandew/supertab'

call plug#end()

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
" let g:go_gocode_propose_source = 0
let g:go_metalinter_enabled = ['vet', 'golint']
" let g:go_info_mode='guru'


nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

" Go specific mapping
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au filetype go nmap <leader>t :w<CR>:GoTestFunc<CR>
au filetype go nmap <leader>T :w<CR>:GoTest<CR>
au filetype go nmap <leader>r :w<CR>:GoRun<CR>
au filetype go nmap <leader>b :GoDebugBreakpoint<CR>
au filetype go nmap <leader>d :GoDebugStart<CR>
au filetype go nmap <leader>s :GoDebugStop<CR>
au filetype go nmap <leader>n :GoDebugNext<CR>
au filetype go nmap <leader>c :GoDebugContinue<CR>
au FileType go nmap <F12> <Plug>(go-def)

augroup GoDebug
  autocmd!
  au FileType go nmap <F12><F12> :GoDebugStop<CR>
  au FileType go nmap <F11> :GoDebugStep<CR>
  au FileType go nmap <F9> :GoDebugBreakpoint<CR>
augroup END

autocmd Filetype vue setlocal sw=2 sts=2 expandtab

set wildmode=longest,list,full
set wildmenu

" https://github.com/ctrlpvim/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

" restore cursor position when reopening a file, except if it's a git commit
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


" standard-prettier
let g:ale_fixers = {'javascript': ['standard'], 'json': ['jq']}
let g:ale_linters = {'javascript': ['standard'],'CloudFormation' : ['cfn-lint']}
let g:ale_sign_column_alwayus = 1
let g:ale_fix_on_save = 1

let g:SuperTabDefaultCompletionType = "context"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

nnoremap <silent><Leader>r :vsplit term://go run %<CR>

let g:nvim_typescript#javascript_support = 1
let g:terraform_fmt_on_save=1

" autocmd FileType typescript,typescript.tsx setl omnifunc=TSOmniFunc

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

autocmd BufReadPost *.jsonnet setl expandtab

" iab <expr> dt strftime("# %F %a\n")

" set cursorline
" set cursorcolumn

set guifont=Terminus_(TTF):h22

" https://youtu.be/PEm0QJ46hNo
inoremap <C-H> <C-W>

let g:indent_guides_enable_on_vim_startup = 1
