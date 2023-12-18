require("tokyonight").setup({
	style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	light_style = "day", -- The theme is used when the background is set to light
	transparent = true, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "transparent", -- style for sidebars, see below
		floats = "transparent", -- style for floating windows
	},
	hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.

	on_colors = function(colors)
		colors.comment = "#add1a9"
		colors.bg_statusline = ""
		colors.terminal_black = "#a7b0d9"
	end,

	on_highlights = function(highlights, colors)
		highlights.LineNr = { fg = "#99b327" }
		highlights.CursorLineNr = { fg = "#a6ff00" }
		highlights.CursorLine = { bg = "", underline = true }
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
