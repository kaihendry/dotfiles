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
	'tpope/vim-fugitive',
	'github/copilot.vim',
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

-- Set options
vim.opt.list = true
vim.opt.listchars = "nbsp:¬,tab:»·,trail:·,extends:>"
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.wildmode = "longest,list,full"
vim.opt.wildmenu = true

-- Highlight whitespace
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "Whitespace", {ctermfg = "red", guifg = "#FF0000"})
    end,
})

-- Map <F8> to toggle spell check for English (GB)
vim.api.nvim_set_keymap('n', '<F8>', ':setlocal spell! spelllang=en_gb<CR>', {noremap = true, silent = true})

-- Unmap Y
vim.api.nvim_del_keymap('n', 'Y')
