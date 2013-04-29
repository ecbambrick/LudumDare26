components = {

	block = {},
	
	displayMovement = {},
	
	collidable = {},
	
	pulse = {
		min = 0,
		max = 10,
		counter = 0,
		dir = 1,
	},
	
	stats = {
		movesLeft = 1,
		score = 0,
	},
	
	pos = {
		x = 0,
		y = 0,
	},
	
	colors = {
		top = { 255, 255, 255, 255 },
		side = { 255, 255, 255, 255 }
	},
	
	color = {
		rgb = { 255, 255, 255, 255 },
	},
	
	text = {
		string = "",
		font = love.graphics.getFont(),
	},
	
	input = {
		interval = 0.15,
		timer = 0,
		active = false,
		last = nil,
	},
	
	movement1 = {
		up = { key = "w", x = 0, y = -1 },
		down = { key = "x", x = 0, y = 1 },
		left = { key = "a", x = -1, y = 0 },
		right = { key = "d", x = 1, y = 0 },
		upLeft = { key = "q", x = -2, y = -2 },
		upRight = { key = "e", x = 2, y = -2 },
		downLeft = { key = "z", x = -2, y = 2 },
		downRight = { key = "c", x = 2, y = 2 },
	},
	
	spike = {
		active = false,
		timer = 0,
		interval1 = 0.5,
		interval2 = 0.1,
		interval3 = 0.3,
	},
	
	pattern = {
		pos = 1;
	},
	
	stage = {
		id = 1,
		status = "empty",
		init = nil,
		remaining = 1,
		total = 1,
		maxMoves = 1,
	}
	
}
