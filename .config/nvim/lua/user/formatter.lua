local function denoprettier(filetype)
	return function()
		if
			require("user.util").find_denojsonc_ancestor(
				vim.api.nvim_buf_get_name(0)
			)
		then
			return require("formatter.filetypes." .. filetype).denofmt()
		else
			return require("formatter.filetypes." .. filetype).prettier()
		end
	end
end

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.INFO,
	filetype = {
		typescript = {
			denoprettier("typescript"),
		},
		javascript = {
			denoprettier("javascript"),
		},
		json = {
			denoprettier("json"),
		},
		jsonc = {
			denoprettier("json"),
		},
		html = {
			require("formatter.filetypes.html").prettier,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		python = {
			require("formatter.filetypes.python").black,
		},
		c = {
			require("formatter.filetypes.c").clangformat,
		},
		cpp = {
			require("formatter.filetypes.cpp").clangformat,
		},
		css = {
			require("formatter.filetypes.html").prettier,
		},
		haskell = function()
			return {
				exe = "ormolu",
				args = { "--no-cabal" },
				stdin = true,
			}
		end,
	},
})
