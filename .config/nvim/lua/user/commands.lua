vim.api.nvim_create_user_command("NoiseToggle", function()
	local noiseEnabled = not vim.diagnostic.is_enabled()
	vim.diagnostic.enable(noiseEnabled)
	require("gitsigns").toggle_signs(noiseEnabled)
end, { desc = "toggle visibility of diagnostic warnings" })
vim.cmd("NoiseToggle") -- defaulting to enabled

vim.api.nvim_create_user_command("Today", function()
	vim.fn.search("# Tänään")
end, { desc = "Hyppää kalenterissa tähän päivään" })
