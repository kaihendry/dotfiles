" $Id$

" Spell check
map <F8> :w!<CR>:!aspell check %<CR>:e! %<CR> 
:autocmd FileType mail :nmap <F8> :w<CR>:!aspell -e -c %<CR>:e<CR>

"set mouse=a		        " Set to get mouse to work
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
set nowritebackup		    " No backup files
set comments=nb:>	        " For email comment nesting

set expandtab		        " No tabs!
set shiftwidth=4	        " A tab become four spaces
set softtabstop=4
set tabstop=4
set fileformat=unix

" Some binds i like
map <C-k> d$ 		" Kill text with control-k
map <F4> :q<CR> 	" Close a buffer with f4
map <C-j> gqap 		" Justify text

colorscheme evening

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
		 \ exe "normal g'\"" | endif

" For XML
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
" For subversion
au BufNewFile,BufRead  svn-commit.* setf svn

set encoding=utf-8          " Set Unicode as the default encoding
set fileencodings=ucs-bom,utf-8,latin1

" What does this do?
set modelines=5

" Trim whitespace from python files
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd BufRead,BufNewFile *.py syntax on autocmd BufRead,BufNewFile *.py set ai
"set foldmethod=indent


let mapleader = ","

map <Leader>cd :exe 'cd ' . expand ("%:p:h")<CR>
nmap <F1> :w<CR>
imap <F1> <ESC>:w<CR>a
map <F8> gg"+yG

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Installed

" www.vim.org/scripts/script.php?script_id=301
" $ADDED/xml.vim

" www.vim.org/scripts/script.php?script_id=39
" copied macros/matchit.vim to plugin/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" XML

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

" todo:
" check
" http://mugca.its.monash.edu.au/~djkea2/vim/compiler/xmllint.vim
