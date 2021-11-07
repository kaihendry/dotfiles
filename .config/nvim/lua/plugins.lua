vim.cmd [[packadd packer.nvim]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function()
	use {'dracula/vim', as = 'dracula'}
	use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
	-- use 'nvim-treesitter/nvim-treesitter' -- better syntax highlighting
	-- -- Additional textobjects for treesitter
	-- use 'nvim-treesitter/nvim-treesitter-textobjects'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
    -- use 'github/copilot.vim'
	-- use 'hrsh7th/cmp-copilot'
	use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
end)
