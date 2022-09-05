-- vim key mappings
local map = require('utils').map

-- leader key
vim.g.mapleader = ';'

-- format
map('n', '<leader>;', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })

-- switch terminal panes
map('n', '<C-j>', '<C-w>j', { silent = true })
map('n', '<C-k>', '<C-w>k', { silent = true })
map('n', '<C-h>', '<C-w>h', { silent = true })
map('n', '<C-l>', '<C-w>l', { silent = true })

-- vim diagnostics lsp
map('n', '<space>e', vim.diagnostic.open_float, { silent = true })
map('n', '[d', vim.diagnostic.goto_prev, { silent = true })
map('n', ']d', vim.diagnostic.goto_next, { silent = true })
map('n', '<space>q', vim.diagnostic.setloclist, { silent = true })


