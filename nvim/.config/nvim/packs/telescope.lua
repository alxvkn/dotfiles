return {
  'nvim-telescope/telescope.nvim',
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<Leader>t<Leader>', builtin.builtin)
    vim.keymap.set('n', '<Leader>jf', builtin.find_files, { desc = '[J]ump to [F]ile' })
    vim.keymap.set('n', '<Leader>jg', builtin.git_files, { desc = '[J]ump to [G]it file' })
    vim.keymap.set('n', '<Leader>jn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[J]ump to [N]eovim config files' })
    vim.keymap.set('n', '<Leader>jb', builtin.buffers, { desc = '[J]ump to [B]uffer' })
    vim.keymap.set('n', '<Leader>jh', builtin.help_tags, { desc = '[J]ump to [H]elp tag' })
    vim.keymap.set('n', '<Leader>jj', builtin.planets)

    vim.keymap.set('n', '<Leader>ds', builtin.lsp_document_symbols, { desc = 'Jump to [D]ocument [S]ymbol' })
    vim.keymap.set('n', '<Leader>ws', builtin.lsp_workspace_symbols, { desc = 'Jump to [W]orkspace [S]ymbol' })

    vim.keymap.set('n', '<Leader>tc', function() builtin.colorscheme { enable_preview = true } end)
  end,
}
