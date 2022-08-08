-- inspired by numToStr's keymap.lua file
-- https://github.com/numToStr/dotfiles
return setmetatable({
  opts_noremap = function(opts)
    opts = opts or {}
    opts['remap'] = false
    return opts
  end,
}, {
  __index = function(table, mode)
    return setmetatable({
      map = function(lhs, rhs, opts)
        return vim.keymap.set(mode, lhs, rhs, opts)
      end,
      noremap = function(lhs, rhs, opts)
        opts = table.opts_noremap(opts)
        return vim.keymap.set(mode, lhs, rhs, opts)
      end,
      buf = function(bufnr)
        return setmetatable({
          map = function(lhs, rhs, opts)
            opts = opts or {}
            opts.buffer = bufnr
            return vim.keymap.set(mode, lhs, rhs, opts)
          end,
          noremap = function(lhs, rhs, opts)
            opts = table.opts_noremap(opts)
            opts.buffer = bufnr
            return vim.keymap.set(mode, lhs, rhs, opts)
          end,
        }, {
          __call = function(this, lhs, rhs, opts)
            this.noremap(lhs, rhs, opts)
          end,
        })
      end,
    }, {
      __call = function(this, lhs, rhs, opts)
        this.noremap(lhs, rhs, opts)
      end,
    })
  end,
})

-- usage is something like
-- ...
-- local K = require '*thismodule*'
-- K.n() -- creates global mapping in normal mode with noremap, like :nnoremap
-- K.n.noremap() -- same as above, but explicitly
-- K.n.map() -- creates global mapping in normal mode without noremap, like :nmap
-- ...
--
-- K.n.buf(bufnr) provides just the same interface (noremap(), map())
-- but mappings will be created local to buffer identified by bufnr
--
-- n field in above can be replaced with any mode letter (i,c,x,...)
