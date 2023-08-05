return {
  'folke/neodev.nvim',
  ft = 'lua',
  config = function()
    require('neodev').setup {}
    local lspconfig = require 'lspconfig'
    lspconfig.lua_ls.setup {
      on_attach = require('on_attach').on_attach,
      root_dir = function(filename)
        local dir = lspconfig.util.root_pattern(
          'init.lua', --[[make root dir .config/nvim]]
          '.luarc.json',
          '.luacheckrc',
          '.git'
        )(filename)
        -- run in single file mode if detected root dir is $HOME
        if dir == os.getenv('HOME') then
          dir = nil
        end
        return dir
      end,
      settings = {
        Lua = {
          completion = {
            callSnippet = 'Replace',
          },
        },
      },
    }
  end,
}
