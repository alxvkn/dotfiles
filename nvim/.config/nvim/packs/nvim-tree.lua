return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup {
      diagnostics = {
        enable = true,
        icons = {
          hint = "󰌶",
          info = "",
          warning = "󰀪",
          error = "󰅚",
        },
      },
      modified = {
        enable = true,
      }
    }
    vim.keymap.set('n', '<Leader>k', ':NvimTreeToggle<Cr>')
  end,
}
