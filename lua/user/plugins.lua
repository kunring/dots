-- Use lazy.nvim as the plugin manager
-- https://github.com/folke/lazy.nvim

-- Bootstrap plugin manager if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
	"--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable", -- latest stable release
	lazypath,
})
end
vim.opt.rtp:prepend(lazypath)

-- Start plugin manager
require("lazy").setup({
	"folke/lazy.nvim",
	"Raimondi/delimitMate", -- Bracket matching
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "typescript", "rust", "python" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = false },  
			})
		end
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	"mhartington/formatter.nvim",
	"folke/tokyonight.nvim",
	"lewis6991/gitsigns.nvim",

	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp",

	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",

	"rafamadriz/friendly-snippets",

	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
})


