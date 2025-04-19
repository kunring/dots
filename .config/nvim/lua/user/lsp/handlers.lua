local M = {}
local diagnostic_config = {
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
		linhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
		},
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

M.setup = function()
	vim.diagnostic.config(diagnostic_config)

	-- Not sure what this effects. Seems like rounded borders have to be set
	-- from the keymap anyways. All documentation I found suggests this should
	-- control the floating window, but I haven't seen that happen.
	-- TODO: Test on a blank config.
	-- TODO: Group all floating window configs into one.
	vim.lsp.handlers["textDocument/hover"] =
		vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})
	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "rounded",
		})
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.documentHighlight then
		vim.api.nvim_exec2(
			[[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			{ output = false }
		)
	end
end

local cmds = {
	{
		key = "gD",
		action = "<cmd>lua vim.lsp.buf.declaration()<CR>",
	},
	{
		key = "gd",
		action = "<cmd>lua vim.lsp.buf.definition()<CR>",
	},
	{
		key = "K",
		action = '<cmd>lua vim.lsp.buf.hover({ border = "rounded" })<CR>',
	},
	{
		key = "gi",
		action = "<cmd>lua vim.lsp.buf.implementation()<CR>",
	},
	{
		key = "<C-k>",
		action = "<cmd>lua vim.lsp.buf.signature_help()<CR>",
	},
	{
		key = "<leader>rn",
		action = "<cmd>lua vim.lsp.buf.rename()<CR>",
	},
	{
		key = "gr",
		action = "<cmd>lua vim.lsp.buf.references()<CR>",
	},
	{
		key = "<leader>ca",
		action = "<cmd>lua vim.lsp.buf.code_action()<CR>",
	},
	{
		key = "[d",
		action = '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
	},
	{
		key = "gl",
		action = '<cmd>lua vim.diagnostic.open_float({ scope = "line", border = "rounded" })<CR>',
	},
	{
		key = "]d",
		action = '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
	},
	{
		key = "<leader>q",
		action = "<cmd>lua vim.diagnostic.setloclist()<CR>",
	},
}
local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	for _, cmd in pairs(cmds) do
		vim.api.nvim_buf_set_keymap(bufnr, "n", cmd.key, cmd.action, opts)
	end
end

M.on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	if client.server_capabilities["documentSymbolProvider"] then
		require("nvim-navic").attach(client, bufnr)
	end
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
	M.capabilities = cmp_nvim_lsp.default_capabilities()
end

return M
