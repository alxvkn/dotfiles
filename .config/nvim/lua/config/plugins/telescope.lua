local K = require 'config.util.map'

K.n('<Leader>t<Leader>', [[<Cmd>lua require('telescope.builtin').builtin()<CR>]])
K.n('<Leader>tf', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]])
K.n('<Leader>tg', [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]])
K.n('<Leader>tb', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]])
K.n('<Leader>th', [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]])
K.n('<Leader>tj', [[<Cmd>lua require('telescope.builtin').planets()<CR>]])
