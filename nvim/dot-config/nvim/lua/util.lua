local M = {}

---@param t table
---@returns bool
function M.table_has_value(t, value)
  for _,v in pairs(t) do
    if v == value then
      return true
    end
  end

  return false
end

return M
