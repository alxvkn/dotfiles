local M = {}

---@param t table
---@returns bool
function M.table_has_value(t, value)
  for _, v in pairs(t) do
    if v == value then
      return true
    end
  end

  return false
end

function M.bind(f, ...)
  local args = { ... }
  local n = select('#', ...)

  return function()
    return f(unpack(args, 1, n))
  end
end

function M.pack_del_inactive()
  local inactive = vim.iter(vim.pack.get())
      :filter(function(x) return not x.active end)
      :map(function(x) return x.spec.name end):totable()

  if #inactive < 1 then
    vim.notify('no inactive plugins')
    return
  end

  vim.print(inactive)
  if vim.fn.confirm('delete?', '&No\n&Ok') == 2 then
    vim.notify('deleting')
    vim.pack.del(inactive, {})
  end
end

return M
