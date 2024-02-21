-- Install Lazy.vim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	'tpope/vim-fugitive',
})

--Set leader to space key
vim.g.mapleader = " "

--Set highlight on search
vim.o.hlsearch = false

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Set colorscheme (order is important here)
vim.o.termguicolors = true

vim.api.nvim_exec(
	[[
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set shiftwidth=4
set softtabstop=4
set tabstop=4
set wildmode=longest,list,full
set wildmenu
autocmd ColorScheme * highlight Whitespace ctermfg=red guifg=#FF0000
autocmd BufWritePre * :%s/\s\+$//e
map <F8> :setlocal spell! spelllang=en_gb<CR>
unmap Y
]],
	true
)
