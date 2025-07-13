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
      { 'intelephense' },
      { 'jdtls' },
      { 'kotlin_language_server' },
      { 'cmake' },
      { 'mesonlsp' },
      { 'tinymist' },
      { 'cssls' },
      { 'tailwindcss' },
      { 'csharp_ls' },
      { 'lua_ls' },
      { 'jsonls' },
      { 'denols',
        root_markers = { 'deno.json', 'deno.jsonc' },
        on_attach = function(client, bufnr)
          if lspconfig.util.root_pattern('package.json')(vim.fn.getcwd()) then
            client.stop()
            return
          end
          on_attach(client, bufnr)
        end,
      },
      { 'ts_ls',
        on_attach = function(client, bufnr)
          if lspconfig.util.root_pattern('deno.json', 'deno.jsonc')(vim.fn.getcwd()) then
            client.stop()
            return
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
    for _, server in ipairs(servers) do
      local name = server[1]
      local config = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      for k, v in pairs(server) do
        -- if field key is not a number - than it's a custom config field
        if type(k) ~= 'number' then
          config[k] = v
        end
      end

      vim.lsp.config(name, config)
      vim.lsp.enable(name)
    end
  end,
}
