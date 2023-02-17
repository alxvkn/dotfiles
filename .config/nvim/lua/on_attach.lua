local M = {}

M.on_attach = function(_, bufnr)
  local opts = { silent = true, buffer = bufnr }

  vim.keymap.set('i', '<c-l>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<Leader>gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', '<Leader>gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', '<Leader>td', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<Leader>gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<Leader>gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<Leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format, opts)
end

return M
