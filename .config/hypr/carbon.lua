hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@74.973",
	position = "0x0",
	scale = 1,
})
hl.monitor({
	output = "DP-1",
	mode = "1920x1080@144.00",
	position = "1920x0",
	scale = 1,
})

hl.config({ input = { sensitivity = -0.4 } })
