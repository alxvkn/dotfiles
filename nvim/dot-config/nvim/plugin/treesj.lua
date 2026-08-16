local treesj = nil

local function stub()
  if treesj == nil then
    vim.pack.add { 'https://github.com/Wansmer/treesj' }

    treesj = require('treesj')

    treesj.setup {
      use_default_keymaps = false,
    }
  end

  vim.keymap.set('n', 'gs', treesj.toggle)

  return treesj.toggle()
end

vim.keymap.set('n', 'gs', stub)
