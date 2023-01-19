require('packer').use {
  'nvim-telescope/telescope.nvim',
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<Leader>t<Leader>', builtin.builtin)
    vim.keymap.set('n', '<Leader>tf', builtin.find_files)
    vim.keymap.set('n', '<Leader>tg', builtin.git_files)
    vim.keymap.set('n', '<Leader>tb', builtin.buffers)
    vim.keymap.set('n', '<Leader>th', builtin.help_tags)
    vim.keymap.set('n', '<Leader>tj', builtin.planets)

    vim.keymap.set('n', '<Leader>ds', builtin.lsp_document_symbols)
    vim.keymap.set('n', '<Leader>ws', builtin.lsp_workspace_symbols)

    vim.keymap.set('n', '<Leader>tc', function() builtin.colorscheme { enable_preview = true } end)
  end,
}
