local lspconfig = require'lspconfig'

local flags = { debounce_text_changes = 150 }

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function (client, bufnr, formatting)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local document_formatting = true
  if formatting ~= nil then
    document_formatting = formatting
  end
  client.resolved_capabilities.document_formatting = document_formatting

  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- Defaults from https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev {}<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next {}<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('v', '<leader>f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
end

lspconfig.tsserver.setup{
  on_attach = function(client, bufnr)
    on_attach(client, bufnr, false)
  end,
  flags = flags,
  capabilities = capabilities,
}
lspconfig.cssls.setup{
  on_attach = on_attach,
  flags = flags,
  capabilities = capabilities,
}
lspconfig.jsonls.setup{
  on_attach = on_attach,
  settings = {
    json = {
      schemas = {
        {
          description = 'Renovate',
          fileMatch = {'renovate.json'},
          url = 'https://docs.renovatebot.com/renovate-schema.json'
        },
        {
          description = 'JSON schema for NPM package.json files',
          fileMatch = {'package.json'},
          url = 'https://json.schemastore.org/package.json'
        },
        {
          description = 'TypeScript compiler configuration file',
          fileMatch = {'tsconfig.json', 'tsconfig.*.json'},
          url = 'https://json.schemastore.org/tsconfig'
        },
        {
          description = 'Lerna config',
          fileMatch = {'lerna.json'},
          url = 'https://json.schemastore.org/lerna'
        },
        {
          description = 'Babel configuration',
          fileMatch = {'.babelrc.json', '.babelrc', 'babel.config.json'},
          url = 'https://json.schemastore.org/lerna'
        },
        {
          description = 'ESLint config',
          fileMatch = {'.eslintrc.json', '.eslintrc'},
          url = 'https://json.schemastore.org/eslintrc'
        },
        {
          description = 'Prettier config',
          fileMatch = {'.prettierrc', '.prettierrc.json', 'prettier.config.json'},
          url = 'https://json.schemastore.org/prettierrc'
        },
        {
          description = 'Vercel Now config',
          fileMatch = {'now.json'},
          url = 'https://json.schemastore.org/now'
        },
      }
    },
  },
  flags = flags,
  capabilities = capabilities,
}
lspconfig.gopls.setup{
  on_attach = on_attach,
  flags = flags,
  capabilities = capabilities,
  init_options = {
    usePlaceholders = true,
  }
}
lspconfig.yamlls.setup{
  on_attach = on_attach,
  settings = {
    yaml = {
      schemas = {
        ['https://json.schemastore.org/github-workflow'] = '.github/workflows/*.{yml,yaml}',
        ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = 'docker-compose.yml',
      }
    }
  },
  flags = flags,
  capabilities = capabilities,
}
lspconfig.dockerls.setup{
  on_attach = on_attach,
  flags = flags,
  capabilities = capabilities,
}
lspconfig.solargraph.setup{
  on_attach = on_attach,
  flags = flags,
  settings = {
    solargraph = {
      useBundler = true
    }
  },
  capabilities = capabilities,
}
lspconfig.html.setup{
  on_attach = on_attach,
  flags = flags,
  capabilities = capabilities,
}
lspconfig.eslint.setup{
  on_attach = on_attach,
  flags = flags,
  capabilities = capabilities,
}
