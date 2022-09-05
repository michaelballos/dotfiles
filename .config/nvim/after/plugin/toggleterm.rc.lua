local present, toggleterm = pcall(require, 'toggleterm')
local map = require('utils').map
if (not present) then
  return
end

toggleterm.setup{
  open_mapping = [[<leader>n]],
  hide_numbers = true,
  direction = 'float',
}

-- config for lazygit bc im lazy
-- custom terminal to launch lazygit in
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = 'lazygit',
  hidden = true,
  direction = 'float',
  float_opts = {
    border = 'curved'
  },
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
  end,
  on_close = function()
    vim.notify('Wow another contribution!. Get a life pussy hehe', nil, {
      title = 'Sucka sucka cock'
    })
  end
})

function lazygit_toggle()
  lazygit:toggle()
end

-- can only be opened with keybind
map('n', '<leader>z', '<cmd>lua lazygit_toggle()<CR>', { silent = true })
