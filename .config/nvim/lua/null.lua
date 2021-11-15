local ls = require "null-ls"
local lsp = require "lspconfig"

ls.config {
  sources = {
    ls.builtins.formatting.stylua,
    ls.builtins.diagnostics.write_good,
    ls.builtins.diagnostics.yamllint,
  },
}
lsp["null-ls"].setup {}
