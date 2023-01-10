return function(_, bufnr)
  local opts = { silent = true }

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
