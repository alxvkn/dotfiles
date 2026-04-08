vim.pack.add { 'https://github.com/neovim/nvim-lspconfig' }

---@type vim.lsp.Config[]
local servers = {
  {
    'lua_ls',
    ---@type lspconfig.settings.lua_ls
    settings = {
      Lua = {
        workspace = {
          library = {
            vim.fn.stdpath('data') .. '/site/pack/core/opt/nvim-lspconfig',
            vim.env.VIMRUNTIME,
          }
        }
      }
    }
  },
  { 'clangd' },
  { 'bashls' },
  { 'pyright' },
  { 'rust_analyzer' },
  { 'dartls' },
  { 'emmet_ls' },
  { 'html' },
  { 'htmx' },
  { 'vala_ls' },
  { 'phpactor' },
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
  { 'yamlls' },
  { 'ansiblels' },
  { 'lemminx' },
  { 'gopls' },
  -- { 'denols' },
  { 'ts_ls' },
  { 'svelte' },
  { 'glsl_analyzer' },
}

for _, s in ipairs(servers) do
  local name = s[1]
  local config = {}

  for k, v in pairs(s) do
    if type(k) ~= 'number' then
      config[k] = v
    end
  end

  if #config then
    vim.lsp.config(name, config)
  end

  vim.lsp.enable(name)
end

local augroup = vim.api.nvim_create_augroup('my.lsp_setup', {})
vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup,
  callback = function()
    vim.o.signcolumn = 'yes'
  end
})
