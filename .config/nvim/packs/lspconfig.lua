
require('packer').use {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require 'lspconfig'

    local on_attach = require('on_attach').on_attach

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
      'emmet_ls',
      'html',
      'cssls',
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
  end,
}

require('packer').use {
  'folke/neodev.nvim',
  config = function()
    require('neodev').setup {}
    local lspconfig = require 'lspconfig'
    lspconfig.sumneko_lua.setup {
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
