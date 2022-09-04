local present, telescope = pcall(require, 'telescope')
local map = require('utils').map
if (not present) then 
  return 
end
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end
local fb_actions = require'telescope'.extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme = 'ivy',
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
  },
}

telescope.load_extension('file_browser')

map('n', '<leader>f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
map('n', '<leader>g', function()
  builtin.live_grep()
end)
map('n', '<leader>b', function()
  builtin.buffers()
end)
map('n', '<leader>t', function()
  builtin.help_tags()
end)
map('n', '<leader>;', function()
  builtin.resume()
end)
map('n', '<leader>e', function()
  builtin.diagnostics()
end)
map('n', '<leader>s', function()
  telescope.extensions.file_browser.file_browser({
    path = '%:p:h',
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = 'normal',
    layout_config = { height = 40 }
  })
end)
