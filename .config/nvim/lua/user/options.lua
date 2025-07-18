vim.opt.backup = false
vim.opt.cmdheight = 2
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = ""
vim.opt.pumheight = 15
vim.opt.showmode = true
vim.opt.showtabline = 1
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeoutlen = 1000
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.writebackup = false
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.cursorline = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.modeline = true
vim.opt.modelines = 3
vim.opt.linebreak = true

-- godmode
--vim.opt.scrolloff = 4
--vim.opt.sidescrolloff = 4

vim.cmd([[set iskeyword+=-]])

vim.g.delimitMate_expand_cr = 2
vim.g.delimitMate_expand_space = true

-- Disable vim autoindenting based on keys in scala.
-- The provided config seems to be outdated for scala 3.
vim.api.nvim_create_autocmd("FileType", {
	pattern = "scala",
	callback = function()
		vim.opt_local.indentkeys = ""
	end,
})
