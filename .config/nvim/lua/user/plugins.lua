local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"folke/lazy.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "typescript", "rust", "python" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = false },
			})
		end,
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

	{
		"utilyre/barbecue.nvim",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"numToStr/Comment.nvim",
		init = function()
			require("Comment").setup()
		end,
	},
	{
		"vuki656/package-info.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		init = function()
			local npminfo = require("package-info")
			npminfo.setup()
			local opts = { noremap = true, silent = true }
			vim.keymap.set({ "n" }, "<LEADER>nt", npminfo.toggle, opts)
			vim.keymap.set({ "n" }, "<LEADER>nu", npminfo.update, opts)
			vim.keymap.set({ "n" }, "<LEADER>nd", npminfo.delete, opts)
			vim.keymap.set({ "n" }, "<LEADER>ni", npminfo.install, opts)
			vim.keymap.set({ "n" }, "<LEADER>np", npminfo.change_version, opts)
		end,
	},
	"jghauser/mkdir.nvim",
	{
		"kunring/copy-as-markdown.nvim",
		init = function()
			require("copy-as-markdown").setup()
			local opts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap("n", "<leader>cm", ":CopyAsMarkdown<CR>", opts)
			vim.api.nvim_set_keymap("v", "<leader>cm", ":CopyAsMarkdown<CR>", opts)
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		init = function()
			require("neo-tree").setup({
				filesystem = {
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = false,
					},
					hijack_netrw_behavior = "open_current",
				},
				event_handlers = {
					{
						event = "neo_tree_popup_input_ready",
						handler = function()
							vim.cmd("stopinsert")
							vim.api.nvim_feedkeys("0l", "m", false)
						end,
					},
				},
			})
			local opts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree toggle position=current<CR>", opts)

			-- Disable netrw
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
	},
})
