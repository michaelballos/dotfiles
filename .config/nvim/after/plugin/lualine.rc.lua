local present, lualine = pcall(require, "lualine")
if (not present) then return end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'solarized_dark',
    section_separators = { 
      left = '', 
      right = '' 
    },
    component_separators = { 
      left = '', 
      right = '' 
    },
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = {{
      'filename',
      -- displays file present (readonly status, modified status)
      file_present = true, 
      -- 0 = just filename, 1 = relative path, 2 = absolute path
      path = 0 
    }},
    lualine_x = {
      'encoding',
      'filetype',
      { 
        'diagnostics', 
          sources = { 'nvim_diagnostic' }, 
          symbols = { 
            error = ' ', 
            warn = ' ', 
            info = ' ',
            hint = ' ' 
          }
      },
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{
      'filename',
      file_present = true, 
      path = 1 
    }},
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'fugitive' }
}
