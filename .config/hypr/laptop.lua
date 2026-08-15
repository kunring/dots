hl.monitor({
	output = "eDP-1",
	mode = "1920x1200@60.00",
	position = "0x0",
	scale = 1.25,
})
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

hl.config({
	input = {
		sensitivity = 0.4,
		touchpad = {
			natural_scroll = false,
			scroll_factor = 0.2,
		},
	},
})
hl.device({
	name = "tpps/2-synaptics-trackpoint", -- ThinkPad nipple
	sensitivity = 0.3,
	scroll_factor = 0.1,
})
