#!/bin/lua

local function is_in_list(v, list)
  for _, value in ipairs(list) do
    if value == v then
      return true
    end
  end
  return false
end

local F = {
  bold = '\27[1m',
  reset = '\27[0m',
}

---@enum Mode
local Mode = {
  'fresh',
  'reuse',
}

---@param s string
---@return boolean
local function is_mode(s)
  return is_in_list(s, Mode)
end

-- TODO: ignore lock file, like an ultrafresh bootstrap mode
-- also should rethink if lazy-loading should also be lazy-downloading

---@type { mode: Mode, headless: boolean|true }
local settings = {
  headless = true
}

local function help()
  ---@class help_entry
  ---@field flag string
  ---@field desc string

  local modes_string = '{'.. table.concat(Mode, '|') .. '}'

  ---@type table<string, help_entry>
  local entries = {
    mode = {
      flag = '-m, --mode ' .. modes_string,
      desc = 'choose run mode (required)',
    },
    help = {
      flag = '-h, --help',
      desc = 'print this message',
    },
    interactive = {
      flag = '-i, --interactive',
      desc = 'run nvim interactively'
    }
  }

  print(('usage:\n\t%s -m %s [-h] [-i]\noptions:'):format(arg[0], modes_string))
  for _, e in pairs(entries) do
    print(string.format('\t%-32s %s', F.bold .. e.flag .. F.reset, e.desc))
  end
end

local argi = 1
while argi <= #arg do
  if is_in_list(arg[argi], {'--help', '-h'}) then
    help()
    os.exit(0)
  elseif is_in_list(arg[argi], {'--interactive', '-i'}) then
    settings.headless = false
  elseif is_in_list(arg[argi], {'--mode', '-m'}) then
    argi = argi + 1 -- consume two arguments
    local mode = arg[argi]

    if not is_mode(mode) then
      io.stderr:write(('"%s" is not a valid run mode.\n'):format(mode))
      help()
      os.exit(1)
    end

    ---@cast mode Mode
    settings.mode = mode
  else
    io.stderr:write(('mibombo. invalid argument: %s\n'):format(arg[argi]))
    help()
    os.exit(1)
  end
  argi = argi + 1
end

if settings.mode == nil then
  io.stderr:write('you have to specify a running mode\n')
  help()
  os.exit(1)
end

local function execute(command)
  local _, _, code = os.execute(command)
  return code
end

local NVIM_ARG_RUN_CONFIG_TEST = [["+lua require('config_test').run()"]]

local NVIM_ARGS = NVIM_ARG_RUN_CONFIG_TEST

if settings.headless then
  NVIM_ARGS = '--headless ' .. NVIM_ARG_RUN_CONFIG_TEST .. ' +qa'
end

local IMAGE_NAME = 'nvim-test-alpine'
local CONTAINERFILE = './nvim.Dockerfile'

os.execute(('podman build -t %s -f %s'):format(IMAGE_NAME, CONTAINERFILE))

local CONFIG_DIR = './nvim/dot-config/nvim/'

local function make_command(extra_podman_args, extra_nvim_args)
  local command = ('podman run --rm -it -v %s:/root/.config/nvim:O %s %s %s %s')
      :format(
        CONFIG_DIR,
        extra_podman_args or '',
        IMAGE_NAME,
        NVIM_ARGS,
        extra_nvim_args or ''
      )
  return command
end

local modes = {
  fresh = function()
    return execute(make_command('--tmpfs /root/.local/share'))
  end,
  reuse = function()
    return execute(make_command('-v nvim-test-data:/root/.local/share'))
  end
}

os.exit(modes[settings.mode]())
