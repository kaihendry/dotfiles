local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
	null_ls.builtins.formatting.prettier,
	null_ls.builtins.diagnostics.write_good,
	null_ls.builtins.code_actions.gitsigns,
	null_ls.builtins.formatting.goimports,
	null_ls.builtins.formatting.gofmt,
}

null_ls.setup({ sources = sources })
