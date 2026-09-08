local M = {}

---@param keys string
---@param mode? string Default: 'mx'
function M.feedkeys(keys, mode)
  local actual_keys = vim.api.nvim_replace_termcodes(keys, true, false, true)
  vim.api.nvim_feedkeys(actual_keys, mode or 'mx', false)
end

return M
