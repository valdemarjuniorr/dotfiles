return {
	-- Colorscheme
	{
		"ayu-theme/ayu-vim",
		config = function()
			vim.cmd.colorscheme("ayu")
		end,
	},

	-- UI
	{ "vim-airline/vim-airline" },
	{ "vim-airline/vim-airline-themes" },
	{
		"luochen1990/rainbow",
		config = function()
			vim.g.rainbow_active = 1
		end,
	},

	-- File explorer
	{
		"preservim/nerdtree",
		cmd = { "NERDTreeToggle", "NERDTreeFind" },
		config = function()
			vim.g.NERDTreeShowHidden = 1
			vim.g.NERDTreeIgnore = { "\\.vim$", "\\.git$", "\\.DS_Store$" }
		end,
	},

	-- FZF
	{ "junegunn/fzf", build = ":fzf#install()" },
	{ "junegunn/fzf.vim" },

	-- Go
	{
		"fatih/vim-go",
		build = ":GoInstallBinaries",
		ft = "go",
		config = function()
			vim.g.go_fmt_command = "goimports"
			vim.g.go_autodetect_gopath = 1
			vim.g.go_highlight_build_constraints = 1
		end,
	},

	-- Extra utilities
	{ "ntpeters/vim-better-whitespace" },
	{ "tpope/vim-endwise" },
	{ "godlygeek/tabular" },
	{
		"terryma/vim-multiple-cursors",
		config = function()
			vim.g.multi_cursor_use_default_mapping = 0
			vim.g.multi_cursor_next_key = "<C-i>"
			vim.g.multi_cursor_prev_key = "<C-y>"
			vim.g.multi_cursor_skip_key = "<C-b>"
			vim.g.multi_cursor_quit_key = "<Esc>"
		end,
	},
	{
		"Raimondi/delimitMate",
		config = function()
			vim.g.delimitMate_expand_cr = 1
			vim.g.delimitMate_expand_space = 1
			vim.g.delimitMate_smart_quotes = 1
		end,
	},
	{ "folke/trouble.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		config = function()
			local telescope = require("telescope")
			telescope.setup({})
		end,
	},
}
