local on_attach = function(_, bufnr)
  local opts = { silent = true, buffer = bufnr }

  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '<Leader>gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', '<Leader>gD', function() vim.lsp.buf.declaration() end, opts)
  vim.keymap.set('n', '<Leader>td', function() vim.lsp.buf.type_definition() end, opts)
  vim.keymap.set('n', '<Leader>gi', function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set('n', '<Leader>gr', function() vim.lsp.buf.references() end, opts)
  vim.keymap.set('n', '<Leader>wa', function() vim.lsp.buf.add_workspace_folder() end, opts)
  vim.keymap.set('n', '<Leader>wr', function() vim.lsp.buf.remove_workspace_folder() end, opts)
  vim.keymap.set('n', '<Leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  vim.keymap.set('n', '<Leader>rn', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('n', '<Leader>ca', function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set('n', '<Leader>lf', function() vim.lsp.buf.format() end, opts)
end

require('packer').use {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require 'lspconfig'

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
  end,
}

require('packer').use {
  'folke/neodev.nvim',
  config = function()
    require('neodev').setup {}
    local lspconfig = require 'lspconfig'
    lspconfig.sumneko_lua.setup {
      on_attach = on_attach,
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
