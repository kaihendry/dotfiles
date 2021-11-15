local cmp = require'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      -- You must install `vim-vsnip` if you set up as same as the following.
      vim.fn['vsnip#anonymous'](args.body)
    end
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' }
  },
}
