local M = {}

---@param client vim.lsp.Client
---@param bufnr number
M.on_attach = function(client, bufnr)
  local opts = { silent = true, buffer = bufnr }

  if client:supports_method('textDocuemnt/foldingRange', bufnr) then
    vim.wo[0][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
  end

  if vim.lsp.inlay_hint then
    vim.lsp.inlay_hint.enable(true)

    vim.keymap.set('n', '<Leader>I', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, opts)

    local customizeHighlight = function()
      local hl = vim.api.nvim_get_hl(0, { name = 'LspInlayHint', link = false })

      vim.api.nvim_set_hl(0, 'LspInlayHint', {
        fg = hl.fg,
        bg = hl.bg,
        italic = true,
      })
    end
    customizeHighlight()

    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = customizeHighlight
    })
  end

  vim.keymap.set('i', '<c-l>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
  vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
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
