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
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

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

" CSV
Plug 'chrisbra/csv.vim'

" JS stuff and JSON formatting
Plug 'w0rp/ale'

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

" So when I gf files, it actually works
Plug 'tpope/vim-apathy'

" Only used when I edit .vue files
" Plug 'posva/vim-vue'
"
"  # REQUIRED: Add a syntax file. YATS is the best
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" Plug 'Shougo/deoplete.nvim'
" Plug 'Shougo/denite.nvim'

Plug 'hashivim/vim-terraform'

" So I can move between buffers/files easier...
Plug 'ctrlpvim/ctrlp.vim'

Plug 'ervandew/supertab'

call plug#end()

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
" let g:go_auto_sameids = 1
" let g:go_gocode_propose_source = 0
let g:go_metalinter_enabled = ['vet', 'golint']
" let g:go_info_mode='guru'

nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

autocmd Filetype vue setlocal sw=2 sts=2 expandtab

set wildmode=longest,list,full
set wildmenu

" https://github.com/ctrlpvim/ctrlp.vim
let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlPMixed'

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

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

nnoremap <silent><Leader>r :vsplit term://go run %<CR>
autocmd FileType go nmap <silent> <Leader>d <Plug>(go-def-tab)

let g:nvim_typescript#javascript_support = 1
" let g:deoplete#enable_at_startup = 1
let g:terraform_fmt_on_save=1

" autocmd FileType typescript,typescript.tsx setl omnifunc=TSOmniFunc
"
" set clipboard=unnamed

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set mouse=a

autocmd BufReadPost *.jsonnet setl expandtab

iab <expr> dt strftime("# %F %a\n")

" set cursorline
" set cursorcolumn
