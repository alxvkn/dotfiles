local luadev = require('lua-dev').setup {
  runtime_path = true,
  lspconfig = {
    on_attach = require 'config.plugins.lsp.on_attach',
    root_dir = require('lspconfig').util.root_pattern(
      'init.lua', --[[make root dir .config/nvim]]
      '.luarc.json',
      '.luacheckrc',
      '.git'
    ),
  },
}
require('lspconfig').sumneko_lua.setup(luadev)
