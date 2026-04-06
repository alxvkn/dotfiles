vim.pack.add { 'https://github.com/neovim/nvim-lspconfig' }

local servers = {
  'lua_ls'
}

for _, s in ipairs(servers) do
  vim.lsp.enable(s)
end
