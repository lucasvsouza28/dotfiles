-- Extra autostart processes.
-- o.launch_on_start("my-service")

o.window({
	initial_class = "^discord$",
}, {
	workspace = "2 silent",
})

o.exec_on_start("hyprctl dispatch workspace 1")
o.launch_on_start("omarchy launch browser")
o.launch_on_start("discord.desktop")
