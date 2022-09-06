local present, lsp = pcall(require, 'lspconfig')
local map = require('utils').map
if (not present) then
  return
end


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local lsp_defaults = {
  capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = {
      noremap=true,
      silent=true,
    }

    map('n', 'gD', vim.lsp.buf.declaration, bufopts)
    map('n', 'gd', vim.lsp.buf.definition, bufopts)
    map('n', 'K', vim.lsp.buf.hover, bufopts)
    map('n', 'gi', vim.lsp.buf.implementation, bufopts)
    map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    map('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    map('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    map('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    map('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    map('n', 'gr', vim.lsp.buf.references, bufopts)
    map('n', '<space>f', vim.lsp.buf.formatting, bufopts)
  end
}

lsp.util.default_config = vim.tbl_extend(
  'force', 
  lsp.util.default_config, 
  lsp_defaults
)

lsp.tsserver.setup({})
lsp.dockerls.setup({})
lsp.eslint.setup({})
lsp.graphql.setup({})
lsp.jsonls.setup({})
lsp.prismals.setup({})
lsp.eslint.setup({})
lsp.sumneko_lua.setup({})