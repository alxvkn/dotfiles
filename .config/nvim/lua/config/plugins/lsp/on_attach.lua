local K = require 'config.util.map'
return function(_, bufnr)
  local opts = { noremap = true, silent = true }

  K.n.buf(bufnr)('K', ':lua vim.lsp.buf.hover()<CR>', opts)
  K.n.buf(bufnr)('gd', ':lua vim.lsp.buf.definition()<CR>', opts)
end
