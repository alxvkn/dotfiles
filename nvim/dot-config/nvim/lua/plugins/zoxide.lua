---@type LazySpec
return {
  'nanotee/zoxide.vim',
  config = function()
    vim.keymap.set('n', '<Leader>z<Space>', ':Z ')
    -- TODO: zoxide telscope
    vim.keymap.set('n', '<Leader>zi', '<cmd>Zi<Cr>')
  end
}
