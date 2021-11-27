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

	use 'Mofiqul/dracula.nvim'

	use 'tpope/vim-fugitive' -- Git commands in nvim
	use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github

	use 'neovim/nvim-lspconfig' -- use a language server
	use 'williamboman/nvim-lsp-installer'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/nvim-cmp' -- for completion whilst using the language server
	use 'github/copilot.vim' -- for AI completion

	use {'hrsh7th/vim-vsnip', after = 'nvim-cmp'}
	use {'hrsh7th/cmp-vsnip', after = 'vim-vsnip' }

	-- use 'crispgm/nvim-go'
	use 'nvim-lua/popup.nvim'

	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

 use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  }

  use {
    'jose-elias-alvarez/nvim-lsp-ts-utils',
    require = { 'neovim/nvim-lspconfig', 'jose-elias-alvarez/null-ls.nvim' },
  }

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
autocmd ColorScheme * highlight Whitespace ctermfg=red guifg=#FF0000
autocmd BufWritePre * :%s/\s\+$//e
colorscheme dracula
map <F8> :setlocal spell! spelllang=en_gb<CR>
]], true)

require('findstuff')
require('lsp')
require('nvim-cmp')
require('null')

::eof::
