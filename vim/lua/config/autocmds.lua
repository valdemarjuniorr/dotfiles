-- Filetype-specific indentation
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.lua",
	command = "setlocal noexpandtab tabstop=2 shiftwidth=2",
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.go",
	command = "setlocal noexpandtab tabstop=2 shiftwidth=2",
})

-- Quickfix window at bottom
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	command = "wincmd J",
})
