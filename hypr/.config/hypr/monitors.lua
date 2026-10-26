-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 1
local omarchy_monitor_scale = "auto"

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
hl.monitor({
	output = "DP-1",
	mode = "1920x1080@144",
	position = "0x0",
	scale = omarchy_monitor_scale,
})
hl.monitor({
	output = "HDMI-A-2",
	mode = "preferred",
	position = "1920x0",
	scale = omarchy_monitor_scale,
})
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = omarchy_monitor_scale,
})

-- Sunshine virtual display: keep it on a workspace we never use.
hl.workspace_rule({ workspace = "99", monitor = "HEADLESS-1", default = true })
