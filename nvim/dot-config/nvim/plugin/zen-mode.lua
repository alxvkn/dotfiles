local zen = nil

local function load_or_forward_toggle()
  if not zen then
    vim.pack.add { 'https://github.com/folke/zen-mode.nvim' }
    zen = require('zen-mode')
    zen.setup()
  end

  zen.toggle()
end

vim.keymap.set('n', '<Leader>z', load_or_forward_toggle)
