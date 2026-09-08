local M = {}

---@class Test
---@field src string
---@field f function

---@type Test[]
local tests = {}

---@param f function
function M.add(f)
  local src = debug.getinfo(2, 'S').source
  src = src:gsub('.*/', '')

  table.insert(tests, {
    f = f,
    src = src
  })
end

local function log(msg)
  vim.notify('config_test: INFO ' .. msg, vim.log.levels.INFO)
end

local function log_pass(src)
  if #vim.api.nvim_list_uis() < 1 then
    io.write('\27[0;32m\n')
    io.write(('config_test: test from %s passed'):format(src))
    io.write('\27[0m\n')
  else
    vim.api.nvim_echo({ { ('config_test: test from %s passed'):format(src), 'OkMsg' } }, true, {})
  end
end

local function log_fail(src, err)
  if #vim.api.nvim_list_uis() < 1 then
    io.write('\27[0;31m\n')
    io.write(('config_test: test from %s failed: \n\t%s'):format(src, err))
    io.write('\27[0m\n')
  else
    vim.notify(('config_test: test from %s failed: \n\t%s'):format(src, err), vim.log.levels.ERROR)
  end
end

function M.run()
  for i, test in ipairs(tests) do
    log('running test from ' .. test.src)
    local ok, err = pcall(test.f)
    if not ok then
      log_fail(test.src, err)
      vim.cmd('cquit ' .. i)
    else
      log_pass(test.src)
    end
  end
end

return M
