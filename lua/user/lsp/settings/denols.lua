vim.g.markdown_fenced_languages = {
	"ts=typescript",
}

return {
	single_file_support = false,
	root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
}
