local M = {}

---@return boolean
function M.table_has_value(table, value)
  for _, v in pairs(table) do
    if v == value then
      return true
    end
  end

  return false
end

return M
