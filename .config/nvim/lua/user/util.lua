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

M.merge = function(t1, t2)
	local result = {}
	for i = 1, #t1 do
		table.insert(result, t1[i])
	end
	for i = 1, #t2 do
		table.insert(result, t2[i])
	end
	return result
end

return M
