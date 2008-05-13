" Spell check with F8
map <F8> :setlocal spell! spelllang=en_gb<CR>

" backspace quickly alters spelling mistake to most likely suggestion

noremap <BS> <Esc>1z=<CR>
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis

syntax on		            " Syntax highlighting
set nocp		            " forget about compatibility with old version of vi
set ttyfast		            " Smoother changes
set ruler		            " We show vertical and horizontal position
set showcmd                 " Show (partial) command in status line.
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set incsearch               " Incremental search
set hlsearch		        " Highlight search
set backspace=2		        " To kill text with backspace!
set visualbell		        " No bell sound
set noai		            " No auto indent

set nobackup		        " No backup files
set nowritebackup		    " No backup files

let html_use_css = 1		" for :TOhtml

set comments=nb:>	        " For email comment nesting

set shiftwidth=4	        " A tab becomes four spaces
set softtabstop=4
set tabstop=4
set fileformat=unix

set background=dark 	    " Set background to dark to have nicer syntax highlighting
colorscheme evening

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
		 \ exe "normal g'\"" | endif

filetype plugin on
au BufNewFile,BufRead svn-commit.* setf svn
" treat .wgt files as .zip files
au BufReadCmd *.wgt call zip#Browse(expand("<amatch>"))

set encoding=utf-8          " Set Unicode as the default encoding

" How many lines to look for vim commands
set modelines=5

" For XML
" au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" Highlight Whitespace. Remember 'diw' to kill the tyranny of whitespace!
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
set wildmode=longest,list:longest,full
