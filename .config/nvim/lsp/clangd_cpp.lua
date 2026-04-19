local util = require("lspconfig.util")

local config = util.default_config
config.cmd = { "clangd" }
config.filetypes = { "cc", "cpp", "cxx", "hh", "hpp", "hxx" }
config.init_options = {
	fallbackFlags = { "-std=c++20" },
}

return config
