-- Mason provided lspconfig servers
local mason_servers = {}
-- System provided lspconfig servers
local system_servers = {
	"hls",
	"ts_ls",
	"lua_ls",
	"rust_analyzer",
	"pyright",
	"denols",
	"clangd",
	"metals",
}
local servers = require("user.util").merge(mason_servers, system_servers)
local settings = {
	ui = { border = "single" },
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = mason_servers,
	automatic_installation = { exclude = system_servers },
})

for _, server in pairs(servers) do
	vim.lsp.enable(server)
end
