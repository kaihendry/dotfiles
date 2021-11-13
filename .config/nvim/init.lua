-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use
require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Package manager
	use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines

	use 'neovim/nvim-lspconfig' -- use a language server
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/nvim-cmp' -- for completion whilst using the language server
	use 'github/copilot.vim' -- for AI completion

	use 'saadparwaiz1/cmp_luasnip' -- vim cmp requires luasnip
	use 'L3MON4D3/LuaSnip' -- Snippets plugin

	use 'crispgm/nvim-go'
	use 'nvim-lua/popup.nvim'

	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- linting
	use 'jose-elias-alvarez/null-ls.nvim'
end)

if os.getenv('INSTALL') then
  goto eof
end

--Set leader to space key
vim.g.mapleader = ' '

--Set highlight on search
vim.o.hlsearch = false

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Set colorscheme (order is important here)
vim.o.termguicolors = true

vim.api.nvim_exec([[
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set shiftwidth=4
set softtabstop=4
set tabstop=4
set wildmode=longest,list,full
set wildmenu
]], true)

require('findstuff')
require('lsp')
require('null')

::eof::
