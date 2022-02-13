local K = require 'config.util.map'
return function(_, bufnr)
  local opts = { noremap = true, silent = true }

  K.n.buf(bufnr)('K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  K.n.buf(bufnr)('<Leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  K.n.buf(bufnr)('<Leader>gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  K.n.buf(bufnr)('<Leader>td', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  K.n.buf(bufnr)('<Leader>gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  K.n.buf(bufnr)('<Leader>gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  K.n.buf(bufnr)('<Leader>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  K.n.buf(bufnr)('<Leader>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  K.n.buf(bufnr)('<Leader>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  K.n.buf(bufnr)('<Leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  K.n.buf(bufnr)('<Leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  K.n.buf(bufnr)('<Leader>lf', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end
