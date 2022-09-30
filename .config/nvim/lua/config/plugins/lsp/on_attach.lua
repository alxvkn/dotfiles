local K = require 'config.util.map'
return function(_, bufnr)
  local opts = { noremap = true, silent = true }

  K.n.buf(bufnr)('K', function() vim.lsp.buf.hover() end, opts)
  K.n.buf(bufnr)('<Leader>gd', function() vim.lsp.buf.definition() end, opts)
  K.n.buf(bufnr)('<Leader>gD', function() vim.lsp.buf.declaration() end, opts)
  K.n.buf(bufnr)('<Leader>td', function() vim.lsp.buf.type_definition() end, opts)
  K.n.buf(bufnr)('<Leader>gi', function() vim.lsp.buf.implementation() end, opts)
  K.n.buf(bufnr)('<Leader>gr', function() vim.lsp.buf.references() end, opts)
  K.n.buf(bufnr)('<Leader>wa', function() vim.lsp.buf.add_workspace_folder() end, opts)
  K.n.buf(bufnr)('<Leader>wr', function() vim.lsp.buf.remove_workspace_folder() end, opts)
  K.n.buf(bufnr)('<Leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  K.n.buf(bufnr)('<Leader>rn', function() vim.lsp.buf.rename() end, opts)
  K.n.buf(bufnr)('<Leader>ca', function() vim.lsp.buf.code_action() end, opts)
  K.n.buf(bufnr)('<Leader>lf', function() vim.lsp.buf.formatting() end, opts)
end
