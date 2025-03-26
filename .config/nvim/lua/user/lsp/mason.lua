function merge(t1, t2)
    local result = {}
    for i = 1, #t1 do
        table.insert(result, t1[i])
    end
    for i = 1, #t2 do
        table.insert(result, t2[i])
    end
    return result
end
local mason_servers = {}
local system_servers = {
	"hls",
	"tsserver",
	"lua_ls",
	"rust_analyzer",
	"pyright",
	"denols",
	"clangd",
}
local servers = merge(mason_servers, system_servers)
local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = mason_servers,
	automatic_installation = { exclude = system_servers },
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
