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

  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<Leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end

  protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
  }
end

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "typescript.tsx" }
}

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
  filetypes = { "python" }
}

nvim_lsp.bashls.setup {
  on_attach = on_attach,
  filetypes = { "sh" }
}

nvim_lsp.texlab.setup {
  on_attach = on_attach,
  filetypes = { "tex" }
}

nvim_lsp.solargraph.setup {
  on_attach = on_attach,
  filetypes = { "rb", "ruby" }
}

nvim_lsp.jsonls.setup{}

--require("null-ls").setup({
--    sources = {
--        require("null-ls").builtins.formatting.stylua,
--        require("null-ls").builtins.diagnostics.eslint,
--        require("null-ls").builtins.completion.spell,
--    },
--})


EOF
