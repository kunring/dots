vim.api.nvim_create_user_command("NoiseToggle", function()
	local diagnostic_config = vim.diagnostic.config
	local enabled = not diagnostic_config().signs
	diagnostic_config({
		underline = enabled,
		signs = enabled,
	})
	require("gitsigns").toggle_signs()
end, { desc = "toggle visibility of diagnostic warnings" })

vim.cmd("NoiseToggle") -- defaulting to enabled
