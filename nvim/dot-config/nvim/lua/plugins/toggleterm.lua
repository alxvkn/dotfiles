---@type LazySpec
return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup {
      size = function(term)
        if term.direction == 'horizontal' then
          return vim.o.lines / 3
        elseif term.direction == 'vertical' then
          return vim.o.columns / 2
        end
      end,
      open_mapping = '<A-;>',
      direction = 'horizontal',
    }
  end,
}
