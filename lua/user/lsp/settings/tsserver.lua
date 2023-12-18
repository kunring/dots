return {
	single_file_support = false,
	root_dir = function(fname)
		if not require("user.util").find_denojsonc_ancestor(fname) then
			return require("lspconfig").util.find_package_json_ancestor(fname)
		end
	end,
}
