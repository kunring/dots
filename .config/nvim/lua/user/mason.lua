-- System provided lspconfig servers
local servers = {
	"hls",
	"ts_ls",
	"lua_ls",
	"rust_analyzer",
	"pyright",
	"denols",
	"clangd_c",
	"clangd_cpp",
	"metals",
}

for _, server in pairs(servers) do
	vim.lsp.enable(server)
end
