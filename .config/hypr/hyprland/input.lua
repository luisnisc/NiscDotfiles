hl.config({
	input = {
		natural_scroll = false,
		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "top",
	action = "fullscreen",
})

hl.gesture({ fingers = 2, direction = "pinch", action = "cursorZoom", zoom_level = 4 })
