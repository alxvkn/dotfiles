local luadev = require('lua-dev').setup {
  runtime_path = true,
  lspconfig = {
    root_dir = require('lspconfig').util.root_pattern 'init.lua',
  },
}
require('lspconfig').sumneko_lua.setup(luadev)
