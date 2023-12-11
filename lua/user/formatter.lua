local function denoprettier(filetype)
	return function()
		if require("user.util").is_deno() then
			return require("formatter.filetypes." .. filetype).denofmt()
		else
			return require("formatter.filetypes." .. filetype).prettier()
		end
	end
end

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
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
	},
})
