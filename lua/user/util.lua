local M = {}

M.is_deno = function()
	return require("lspconfig").util.root_pattern("deno.json", "deno.jsonc") ~= nil
end

M.find_denojsonc_ancestor = function(startpath)
	return require("lspconfig").util.search_ancestors(startpath, function(path)
		if require("lspconfig").util.path.is_file(require("lspconfig").util.path.join(path, "deno.jsonc")) then
			return path
		end
	end)
end

return M
