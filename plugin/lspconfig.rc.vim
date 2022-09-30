if !exists('g:lspconfig')
  finish
endif

"nvim_lsp.clangd.setup {
  "on_attach = on_attach,
  "filetypes = { "c", "cpp", "ino", "h" },
"}

lua << EOF
local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  -- Mappings.

  local opts = { noremap = true, silent = false }

  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<Leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<Leader>k', '<cmd>lua vim.lsp.buf.format()<CR>', opts)

  --protocol.CompletionItemKind = {
  --  '', -- Text
  --  '', -- Method
  --  '', -- Function
  --  '', -- Constructor
  --  '', -- Field
  --  '', -- Variable
  --  '', -- Class
  --  'ﰮ', -- Interface
  --  '', -- Module
  --  '', -- Property
  --  '', -- Unit
  --  '', -- Value
  --  '', -- Enum
  --  '', -- Keyword
  --  '﬌', -- Snippet
  --  '', -- Color
  --  '', -- File
  --  '', -- Reference
  --  '', -- Folder
  --  '', -- EnumMember
  --  '', -- Constant
  --  '', -- Struct
  --  '', -- Event
  --  'ﬦ', -- Operator
  --  '', -- TypeParameter
  --}
end

nvim_lsp.clangd.setup {
  on_attach = on_attach,
  filetypes = { "h", "c", "cpp" }
}
--nvim_lsp.ccls.setup {
--  on_attach = on_attach,
--  filetypes = { "h", "c", "cpp" }
--}

nvim_lsp.pylsp.setup {
  on_attach = on_attach,
  settings = {
      configurationSources = {"flake8"},
      formatCommand = {"black"}
  }
--  filetypes = { "python" }
}

nvim_lsp.cmake.setup {
  on_attach = on_attach,
  filetypes = { "cmake" }
}


EOF
