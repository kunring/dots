require("./device")

hl.env("XCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "kde")
hl.env("QT_PLATFORMTHEME", "kde")
hl.env("QT_PLATFORM_PLUGIN", "kde")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "0")
hl.env("QT_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- https://bbs.archlinux.org/viewtopic.php?pid=2170418#p2170418
hl.env("XDG_MENU_PREFIX", "arch-")

hl.on("hyprland.start", function()
	hl.exec_cmd("swaybg --image ~/.config/hypr/background.png --mode fill")
	hl.exec_cmd("dunst")
	hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
	hl.exec_cmd("waybar")
	hl.exec_cmd("polkit-kde-agent")
	hl.exec_cmd("clipse -listen")
	hl.exec_cmd("~/.config/hypr/batmon.sh")
end)

hl.window_rule({ match = { title = "clipse" }, float = true, size = "{700, 650}", center = true })

hl.config({
	input = {
		kb_layout = "fi",
		kb_variant = "nodeadkeys",
		kb_options = "compose:rctrl",
		follow_mouse = true,
		numlock_by_default = true,
		accel_profile = "flat",
		repeat_delay = 250,
		repeat_rate = 40,
	},
})

hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,
		border_size = 3,
		col = {
			active_border = "#1f9935",
			inactive_border = "#333333",
		},
		layout = "dwindle",
		resize_corner = 1,
	},
})

hl.config({
	decoration = {
		rounding = 0,
		blur = { enabled = false },
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "#1a1a1aee",
		},
	},
})

hl.config({ animations = { enabled = false } })

hl.config({
	dwindle = {
		preserve_split = true,
		permanent_direction_override = true,
	},
})

hl.config({ misc = { disable_hyprland_logo = true } })
hl.config({ xwayland = { force_zero_scaling = true } })
hl.config({ ecosystem = { no_donation_nag = true } })

hl.bind("SUPER + Q", hl.dsp.exec_cmd("foot"))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + E", hl.dsp.exec_cmd("dolphin"))
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + R", hl.dsp.exec_cmd("wofi --show drun"))
hl.bind("SUPER + S", hl.dsp.exec_cmd("~/.config/hypr/selsink.sh"))
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + T", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + CTRL + SHIFT + L", hl.dsp.exec_cmd("swaylock -f -c 000000"))
hl.bind("SUPER + CTRL + SHIFT + S", hl.dsp.exec_cmd("swaylock -f -c 000000 & systemctl suspend"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("foot -T clipse clipse"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("pkill -SIGUSR1 '^waybar$'"))
hl.bind("SUPER + K", hl.dsp.exec_cmd("hyprctl kill"))

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +1%"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -1%"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl -A stop"))

hl.bind("Print", hl.dsp.exec_cmd("grimblast --freeze save area - | wl-copy"))
hl.bind("ALT + Print", hl.dsp.exec_cmd("grimblast --freeze save active - | wl-copy"))
hl.bind("SUPER + Print", hl.dsp.exec_cmd("grimblast --freeze save screen - | wl-copy"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 1%-"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 1%+"))

for key, d in pairs({ H = "l", J = "d", K = "u", L = "r" }) do
	hl.bind("SUPER + " .. key, hl.dsp.focus({ direction = d }))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ direction = d }))
end

for i = 1, 10 do
	hl.bind("SUPER + " .. (i % 10), hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. (i % 10), hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
