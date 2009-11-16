" Study http://hg.suckless.org/dextra/file/tip/bluegray/vimrc
" Spell check with F8
map <F8> :setlocal spell! spelllang=en_gb<CR>
" backspace quickly alters spelling mistake to most likely suggestion
" nnoremap restricts command to normal mode
nnoremap <BS> <Esc>1z=<CR>

syntax on					" Syntax highlighting
set mouse=
set title					" Turn on titlebar support
set nocp					" forget about compatibility with old version of vi
set ttyfast					" Smoother changes
set ruler					" We show vertical and horizontal position
set showcmd					" Show (partial) command in status line.
set showmatch				" Show matching brackets.
set ignorecase				" Do case insensitive matching
set incsearch				" Incremental search
set hlsearch				" Highlight search
set backspace=2				" To kill text with backspace!
set visualbell				" No bell sound
set noai					" No auto indent

set nobackup				" No backups
set noautowrite				" This should be default, but I worry...
set updatetime=2000			" Timeout for swapfile writes and CursorHold autocmd

set comments=nb:>			" For email comment nesting
let html_use_css = 1		" for :TOhtml not to add inline style crud

set shiftwidth=4			" A tab becomes four spaces
set softtabstop=4
set tabstop=4
set fileformat=unix

map gf :split <cfile><CR>  " gf to open file undercursor

set background=dark			" Set background to dark to have nicer syntax highlighting
colors evening

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
		 \ exe "normal g'\"" | endif

filetype plugin on
filetype plugin indent on
au BufNewFile,BufRead svn-commit.* setf svn
" Treat .wgt files as .zip files
au BufReadCmd *.wgt call zip#Browse(expand("<amatch>"))
" au BufReadCmd *.jar call zip#Browse(expand("<amatch>"))
au BufRead,BufNewFile *.widl			set filetype=widl

" http://googleblog.blogspot.com/2008/05/moving-to-unicode-51.html
set encoding=utf-8			" Set Unicode as the default encoding

" How many lines to look for vim commands
set modelines=5

" Highlight Whitespace. Remember 'diw' to kill the tyranny of whitespace!
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
set wildmode=longest,list:longest,full

" Try to autocomplete with 'omni completion' on TAB
function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
	  return "\<Tab>"
   else
	  return "\<C-X>\<C-O>"
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
set diffopt+=iwhite " Ignore whitespace whilst diffing
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4|set listchars=tab:>-,trail:_ list
setlocal omnifunc=syntaxcomplete#Complete
"hi clear
autocmd BufNewFile,BufRead *.go setf go
autocmd BufNewFile,BufRead *.csv setf csv
setlocal omnifunc=syntaxcomplete#Complete
set list listchars=tab:»·,trail:·,extends:…
