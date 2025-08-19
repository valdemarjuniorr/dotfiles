local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- LSP
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "<leader>gf", vim.lsp.buf.format, opts)
