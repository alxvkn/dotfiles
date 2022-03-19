local K = require 'config.util.map'

-- ctrl+; as synonym to ctrl+^
K.n('<C-;>', '<C-^>')

-- go to normal mode from terminal with alt+[
K.t('<A-[>', '<C-\\><C-N>')
