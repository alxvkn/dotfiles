local K = require 'config.util.map'

local lspconfig = require 'lspconfig'
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true }

  K.n.buf(bufnr)('K', ':lua vim.lsp.buf.hover()<CR>', opts)
  K.n.buf(bufnr)('gd', ':lua vim.lsp.buf.definition()<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- stop all active clients if there are any
-- (if config is reloaded)
vim.lsp.stop_client(vim.lsp.get_active_clients(), true)

-- servers with default settings
local servers = {
  'clangd',
  'bashls',
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
  cmd = { 'npx', 'typescript-language-server', '--stdio' },
}
