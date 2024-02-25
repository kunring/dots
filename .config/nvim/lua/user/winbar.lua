local barbecue_status_ok, barbecue = pcall(require, "barbecue")
if not barbecue_status_ok then
	return
end

barbecue.setup({
	attach_navic = false,
	create_autocmd = false,
	show_modified = true,
})

local barbecue_ui_status_ok, barbecue_ui = pcall(require, "barbecue.ui")
if not barbecue_ui_status_ok then
	return
end

vim.api.nvim_create_autocmd({
	"WinResized",
	"BufWinEnter",
	"CursorHold",
	"InsertLeave",
	"BufModifiedSet",
}, {
	group = vim.api.nvim_create_augroup("barbecue.updater", {}),
	callback = function()
		barbecue_ui.update()
	end,
})
