-- Keep below 100 LOC

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
	'prettier/vim-prettier',
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',
	'github/copilot.vim',
	{ 'numToStr/Comment.nvim', opts = {} },
	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		opts = {},
	},
})

-- Set highlight on search
vim.o.hlsearch = false

-- Save undo history
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.cmd('colorscheme desert')

-- Set options
vim.opt.list = true
vim.opt.listchars = "nbsp:¬,tab:»·,trail:·,extends:>"
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.wildmode = "longest,list,full"
vim.opt.wildmenu = true

-- Enable spell checking globally
vim.o.spell = true
vim.o.spelllang = "en_gb"

-- Make Y copy the line
vim.api.nvim_del_keymap('n', 'Y')

vim.wo.relativenumber = true
