-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,
	},
	-- Master switch for the blur pipeline. Required before any blur layer rule
	-- has a visible effect; on its own it blurs nothing.
	decoration = {
		blur = {
			enabled = true,
		},
	},
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#animations
hl.curve("overshoot", { type = "bezier", points = { { 0.5, 0.9 }, { 0.1, 1.1 } } })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = "overshoot" })
