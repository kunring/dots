local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.mason")
require("user.lsp.handlers").setup()

vim.api.nvim_create_user_command("DiagnosticToggle", function()
	local config = vim.diagnostic.config
	local enabled = not config().signs
	config({
		underline = enabled,
		signs = enabled,
	})
end, { desc = "toggle visibility of diagnostic warnings" })
