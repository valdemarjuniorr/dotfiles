local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Window splits
map("n", "<C-s>b", "<C-w>s", opts)
map("n", "<C-s>v", "<C-w>v", opts)
map("n", "<C-j>", "<C-W>j", opts)
map("n", "<C-k>", "<C-W>k", opts)
map("n", "<C-h>", "<C-W>h", opts)
map("n", "<C-l>", "<C-W>l", opts)

-- Buffers
map("n", "<C-x>", ":bnext<CR>", opts)
map("n", "<C-z>", ":bprev<CR>", opts)

-- Save
map("n", "<leader>w", ":w!<cr>", opts)

-- Center screen
map("n", "<space>", "zz", opts)

-- Insert mode escape
map("i", "jk", "<ESC>l", opts)

-- FZF
map("n", "<C-p>", ":Files<CR>", opts)
map("n", "<Leader>b", ":Buffers<CR>", opts)

-- LSP
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "<leader>gf", vim.lsp.buf.format, opts)
