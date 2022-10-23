local lspconfig = require 'lspconfig'

local on_attach = require 'config.plugins.lsp.on_attach'

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- stop all active clients if there are any
-- (if config is reloaded)
vim.lsp.stop_client(vim.lsp.get_active_clients(), true)

-- servers with default settings
local servers = {
  'clangd',
  'bashls',
  'pyright',
  'rust_analyzer',
  'dartls',
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
-- servers that need some extra configuration
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'svelte',
  },
  cmd = { 'npx', 'typescript-language-server', '--stdio' },
}
lspconfig.svelte.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'npx', 'svelte-language-server', '--stdio' },
}
lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'vscode-json-languageserver', '--stdio' },
}
