#!/bin/lua

local LABEL = os.getenv('LABEL') or 'ram:'
local KIBI_IN_GIBI = 1048576

local function get_value(line)
  local words = {}
  for w in string.gmatch(line, '%w+') do
    table.insert(words, w)
  end
  return tonumber(words[2])
end

local total, avail, used

for l in io.open('/proc/meminfo'):lines() do
  if string.find(l, 'MemTotal') then
    total = get_value(l)
  elseif string.find(l, 'MemAvailable') then
    avail = get_value(l)
  end
  if total and avail then break end
end

used = total - avail

total, avail, used = total / KIBI_IN_GIBI, avail / KIBI_IN_GIBI, used / KIBI_IN_GIBI

print(('%s %.1fG/%.1fG'):format(LABEL, used, total))
