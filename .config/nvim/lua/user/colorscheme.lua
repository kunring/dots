local inactive = "#add1a9"
require("tokyonight").setup({
	style = "storm",
	light_style = "day",
	transparent = true,
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		sidebars = "transparent",
		floats = "transparent",
	},
	hide_inactive_statusline = false,

	on_colors = function(colors)
		colors.comment = inactive
		colors.bg_statusline = ""
		colors.terminal_black = "#a7b0d9"
	end,

	on_highlights = function(highlights, colors)
		highlights.LineNr = { fg = "#99b327" }
		highlights.CursorLineNr = { fg = "#a6ff00" }
		highlights.CursorLine = { bg = "", underline = true }
		highlights.NeoTreeFileStats = { fg = colors.cyan }
		highlights.NeoTreeFileStatsHeader = { fg = colors.cyan, bold = true }
	end,
})

local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

-- Disable ~ in sidebar for blank lines
vim.opt.fillchars = { eob = " " }
