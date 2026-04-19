local util = require("lspconfig.util")

local config = util.default_config
config.cmd = { "clangd" }
config.filetypes = { "c", "h" }
config.init_options = {
	fallbackFlags = { "--std=c23" },
}

return config
