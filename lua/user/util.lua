local M = {}

M.is_deno = function()
	return require("lspconfig").util.root_pattern("deno.json", "deno.jsonc") ~= nil
end

return M
