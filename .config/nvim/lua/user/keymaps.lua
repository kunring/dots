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

-- Toggle "noise" (LSP diagnostic nags, gitsigns)
vim.api.nvim_set_keymap("n", "<leader>d", ":NoiseToggle<CR>", opts)

-- Disabling a default mapping for opening the current symbol in man.lua.
-- This mapping stays as the default only when the buffer has no loaded LSP.
-- I don't fully understand how this works internally, as simply calling
-- vim.keymap.del says there is no mapping. However, binding it to a no-op
-- seems to achieve the desired behaviour.
vim.api.nvim_set_keymap("n", "K", "<nop>", opts)
