local present, lspsaga = pcall(require, 'lspsaga')
if (not present) then 
  return 
end

lspsaga.init_lsp_saga {
  server_filetype_map = {}
}

local opts = { 
  noremap = true, 
  silent = true 
}

local map = vim.keymap.set

map('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
map('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
map('n', 'gd', '<Cmd>Lspsaga lsp_finder<cr>', opts)
map('i', '<C-k>', '<Cmd>Lspsaga signature_help<cr>', opts)
map('n', 'gp', '<Cmd>Lspsaga preview_definition<cr>', opts)
map('n', 'gr', '<Cmd>Lspsaga rename<cr>', opts)
