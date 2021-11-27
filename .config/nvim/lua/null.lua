local ls = require "null-ls"
local lsp = require "lspconfig"

ls.config {
	sources = {
		ls.builtins.formatting.stylua,
		ls.builtins.formatting.shfmt,
		ls.builtins.formatting.prettier,
		ls.builtins.formatting.eslint,
		ls.builtins.formatting.goimports,
		ls.builtins.diagnostics.write_good,
		ls.builtins.diagnostics.yamllint,
		ls.builtins.diagnostics.shellcheck,
	},
	debug = true,
}
lsp["null-ls"].setup {}
