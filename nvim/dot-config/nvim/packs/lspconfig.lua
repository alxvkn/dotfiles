return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require 'lspconfig'

    local on_attach = require('on_attach').on_attach

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- servers with default settings
    local servers = {
      { 'gopls' },
      { 'clangd' },
      { 'bashls' },
      { 'pyright' },
      { 'rust_analyzer' },
      { 'dartls' },
      { 'emmet_ls' },
      { 'html' },
      { 'cssls' },
      { 'csharp_ls' },
      { 'denols',
        root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc'),
        on_attach = function(client, bufnr)
          if lspconfig.util.root_pattern('package.json')(vim.fn.getcwd()) then
            client.stop()
          end
          on_attach(client, bufnr)
        end,
      },
      { 'ts_ls',
        on_attach = function(client, bufnr)
          if lspconfig.util.root_pattern('deno.json', 'deno.jsonc')(vim.fn.getcwd()) then
            client.stop()
          end
          on_attach(client, bufnr)
        end,
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
      },
      { 'svelte',
        cmd = { 'npx', 'svelte-language-server', '--stdio' },
      },
    }
    for _, lsp in ipairs(servers) do
      local name = lsp[1]
      local config = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      for k, v in pairs(lsp) do
        if type(k) ~= 'number' then
          config[k] = v
        end
      end

      lspconfig[name].setup(config)
    end
  end,
}
