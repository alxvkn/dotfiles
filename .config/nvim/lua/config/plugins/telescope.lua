local K = require 'config.util.map'

K.n('<Leader>f<Leader>', [[<Cmd>lua require('telescope.builtin').builtin()<CR>]])
K.n('<Leader>ff', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]])
K.n('<Leader>fg', [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]])
K.n('<Leader>fb', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]])
K.n('<Leader>fh', [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]])
K.n('<Leader>fj', [[<Cmd>lua require('telescope.builtin').planets()<CR>]])
