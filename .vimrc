" $Id$

" Spell check
map <F8> :w!<CR>:!aspell check %<CR>:e! %<CR> 
:autocmd FileType mail :nmap <F8> :w<CR>:!aspell -e -c %<CR>:e<CR>

"set mouse=a		        " Set to get mouse to work (doesn't work in screen)
set nocp		            " forget about compatibility with old version of vi
syntax on		            " Syntax highlighting
set background=dark 	    " Set background to dark to have nicer syntax highlighting
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
"set nowritebackup		    " No backup files
set comments=nb:>	        " For email comment nesting
"set paste

set expandtab		        " No tabs!
set shiftwidth=4	        " A tab become four spaces
set softtabstop=4
set tabstop=4
set fileformat=unix

" Expand existing abbreviation
" Not used atm mind

map <C-X><C-X> diw:exe "normal i".@"<cr>
map <C-j> :redir >>~/my.abbr<CR>:abbr<CR>:redir END<CR>
map <C-k> :split ~/my.abbr<CR>:%s/^!/ab /e<CR>:wq<CR>:source ~/my.abbr<CR>



colorscheme evening

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
		 \ exe "normal g'\"" | endif

" For subversion
au BufNewFile,BufRead  svn-commit.* setf svn

set encoding=utf-8          " Set Unicode as the default encoding
set fileencodings=ucs-bom,utf-8,latin1

" How many lines to look for vim commands
set modelines=5

" Trim whitespace from python files
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd BufRead,BufNewFile *.py syntax on autocmd BufRead,BufNewFile *.py set ai

" For XML
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"



let mapleader = ","

map <Leader>x :set filetype=xml<CR>
  \:source $VIMRUNTIME/ftplugin/xml.vim<CR>
  \:iunmap <buffer> <Leader>.<CR>
  \:iunmap <buffer> <Leader>><CR>

" catalog should be set up
nmap <Leader>l <Leader>cd:%w !xmllint --valid --noout -<CR>
nmap <Leader>r <Leader>cd:%w !rxp -V -N -s -x<CR>
nmap <Leader>d4 :%w !xmllint --dtdvalid 
 \"http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd" --noout -<CR>

vmap <Leader>px !xmllint --format -<CR>
nmap <Leader>px !!xmllint --format -<CR>
nmap <Leader>pxa :%!xmllint --format -<CR>

nmap <Leader>i :%!xsltlint<CR>
