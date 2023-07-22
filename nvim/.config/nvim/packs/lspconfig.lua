return {
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
    lspconfig.denols.setup {
      on_attach = function(client, bufnr)
        if lspconfig.util.root_pattern('package.json')(vim.fn.getcwd()) then
          client.stop()
        end
        on_attach(client, bufnr)
      end,
      capabilities = capabilities,
    }
    lspconfig.tsserver.setup {
      on_attach = function(client, bufnr)
        if lspconfig.util.root_pattern('deno.json', 'deno.jsonc')(vim.fn.getcwd()) then
          client.stop()
        end
        on_attach(client, bufnr)
      end,
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
