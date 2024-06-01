local opts = { noremap = true, silent = true }

-- Leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window resize with arrows
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize +1<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize -1<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -1<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +1<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>e", ":Lex 30<CR>", opts)

-- Move text up and down
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", opts)
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Visual --
-- Stay in indent mode
vim.api.nvim_set_keymap("v", "<", "<gv^", opts)
vim.api.nvim_set_keymap("v", ">", ">gv^", opts)

-- Move text up and down
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
-- Disable copying of deleted content to clipboard when pasting over a visual selection
vim.api.nvim_set_keymap("v", "p", '"_dP', opts)

-- Formatter
vim.api.nvim_set_keymap("n", "<leader>f", ":Format<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>F", ":FormatWrite<CR>", opts)
