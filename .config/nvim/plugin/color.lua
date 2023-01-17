-- TODO: don't termguicolors = false if TERM is linux
vim.o.termguicolors = true

local f = io.open(os.getenv('HOME') .. '/.cache/wal/colors-wal.vim', 'r')
if f ~= nil then
  f:close()
  local ok, pywal = pcall(require, 'pywal')
  if ok then
    pywal.setup()
  end
else
  pcall(
    vim.cmd.colorscheme,
    'base16-gruvbox-material-dark-hard'
  )
end
