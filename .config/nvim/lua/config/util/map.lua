-- inspired by numToStr's keymap.lua file
-- https://github.com/numToStr/dotfiles
return setmetatable({
  opts_noremap = function(opts)
    opts = opts or {}
    opts['noremap'] = true
    return opts
  end,
}, {
  __index = function(table, mode)
    return setmetatable({
      map = function(lhs, rhs, opts)
        return vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
      end,
      noremap = function(lhs, rhs, opts)
        opts = table.opts_noremap(opts)
        return vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
      end,
      buf_map = function(bufnr, lhs, rhs)
        opts = table.opts_noremap(opts)
        return vim.api.nvim_buf_set_keymap(bufnr, lhs, rhs, opts)
      end,
    }, {
      __call = function(this, lhs, rhs)
        this.noremap(lhs, rhs)
      end,
    })
  end,
})

-- yo yo i think we should make even harder to understand thing
-- something like K.n() will actually mean K.n.global.noremap()
-- and so that local to buffer keymaps can be created with K.n.buffer.noremap()
-- like some multi level ierarchy shit
-- K.n {
--   global(default),
--   buffer
-- } -> {
--   noremap(default),
--   buffer
-- }
-- yeah and then make K.n default so you can just call K()
-- such an overengineering, i love it
