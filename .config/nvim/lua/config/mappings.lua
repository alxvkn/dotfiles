local K = require 'config.util.map'

-- go to normal mode from terminal with alt+[
K.t('<A-[>', '<C-\\><C-N>')

K.n('<C-j>', '<Cmd>bnext<CR>')
K.n('<C-k>', '<Cmd>bprevious<CR>')
