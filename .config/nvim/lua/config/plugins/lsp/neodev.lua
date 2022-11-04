require('neodev').setup {
  runtime_path = true,
}
require('lspconfig').sumneko_lua.setup {
  on_attach = require 'config.plugins.lsp.on_attach',
  root_dir = require('lspconfig').util.root_pattern(
    'init.lua', --[[make root dir .config/nvim]]
    '.luarc.json',
    '.luacheckrc',
    '.git'
  ),
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
    },
  },
}
