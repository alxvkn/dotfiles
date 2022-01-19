local packer_just_installed = nil

-- installing packer.nvim if it isn't already installed
local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) ~= 0 then
    print('cloning packer.nvim with git into ' .. packer_path)
    vim.fn.system({'git', 'clone', '--depth=1',
        'https://github.com/wbthomason/packer.nvim', packer_path})
    if vim.v.shell_error == 0 then
        print'successfully installed packer.nvim'
        packer_just_installed = true
    else
        print'something went wrong. check if git is available in $PATH'
        return
    end
end

require'plugins'

-- if packer.nvim was installed at this exact config run:
-- - run packer.sync() to install all specified plugins;
-- - setup autocmd to notify user when packer.sync() is completed;
-- - stop execution of this config;
if packer_just_installed then
    require'packer'.sync()
    vim.cmd[[autocmd! User PackerComplete echo 'looks like packer.sync() completed. you must(should) restart neovim']]
    -- life would be easier if there was a way to make packer.sync() blocking
    return -- prevent further config execution, since plugins are not yet installed
end

local function map(mode, lhs, rhs, opts)
    if opts then opts['noremap'] = true
    else opts = {noremap = true} end
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- enable mouse in all modes
vim.o.mouse = 'a'

-- at moment i thought i understood how indentation settings work
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.autoindent = true

-- Fix for some mystery happening to # symbol
vim.o.smartindent = false
vim.o.cindent = true
vim.opt.cinkeys:remove'0#'
vim.opt.indentkeys:remove'0#'

-- no swapfiles
vim.o.swapfile = false
vim.o.number = true

-- only ignore case in command completion
vim.cmd[[
    augroup ignorecase_commandmode
        autocmd!
        autocmd CmdLineEnter : let &ignorecase = 1
        autocmd CmdLineLeave : let &ignorecase = 0
    augroup end
]]

-- reload any of the config files as soon as it's written
vim.cmd('autocmd! BufWritePost ' .. vim.fn.stdpath('config') .. '/* source <afile>')

-- Russian keys
vim.o.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'

-- :e # by ctrl+j
map('n', '<C-J>', '<C-^>', {})


-- Plugins configuration/setup
-- why he couldn't make it lowercase btw?
require'Comment'.setup()

-- lualine
require'lualine'.setup()

-- nvim-cmp
vim.o.completeopt = 'menuone,noselect'
local cmp = require'cmp'
cmp.setup({
    snippet = {},
    mapping = {
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'})
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer' }
    })
})
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
cmp.setup.cmdline('/', {
    sources = cmp.config.sources({
        { name = 'buffer' }
    })
})

-- nvim-lspconfig
local lspconfig = require'lspconfig'
local on_attach = function(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require'cmp_nvim_lsp'.update_capabilities(capabilities)

-- stop all active clients if there are any
-- (if config is reloaded)
vim.lsp.stop_client(vim.lsp.get_active_clients(), true)

-- servers with default settings
local servers = {
    'clangd',
    'bashls'
}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end
-- servers that need some extra configuration
lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { 'npx', 'typescript-language-server', '--stdio' }
}



-- Appearance
vim.o.termguicolors = true
vim.cmd'colorscheme horizon'
vim.o.guifont = 'Fira Code:h10'
