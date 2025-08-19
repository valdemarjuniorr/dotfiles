-- UI
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true

-- Behavior
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.backspace = "indent,eol,start"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.encoding = "utf-8"
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.laststatus = 2
vim.opt.hidden = true
vim.opt.ruler = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Performance
vim.opt.lazyredraw = true
vim.opt.synmaxcol = 300
vim.opt.updatetime = 300

-- Indentation
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- Wild menu
vim.opt.wildmenu = true
vim.opt.wildmode = "list:full"
vim.opt.wildignore:append({
	"*.o,*.obj,*.dll,*.exe",
	"*.git,*.svn",
	"*.zip,*.tar.gz",
	"*.pyc",
	"*.DS_Store",
	"*.db",
})
