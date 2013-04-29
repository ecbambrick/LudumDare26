------------------------------------------------------------------- GLOBAL DATA

window = {
	width		= love.graphics.getWidth(),
	height		= love.graphics.getHeight(),
}

tile = {
	width		= 50,
	height		= 35,
}

colors = {
	black		= {   0,   0,   0, 255 },
	white		= { 255, 255, 255, 255 },
	beige		= { 247, 242, 203, 255 },
	medBeige	= { 240, 235, 195, 255 },
	darkBeige	= { 220, 215, 180, 255 },
	lightGreen	= { 114, 204, 167, 255 },
	darkGreen	= {  16, 162, 150, 255 },
	lightRed	= { 250, 152, 125, 255 },
	darkRed		= { 240,  96,  96, 255 },
	lightBlue	= {  36, 176, 191, 255 },
	darkBlue	= {   4, 157, 191, 255 },
	lightGray	= { 177, 194, 179, 255 },
	darkGray	= { 119, 134, 145, 255 },
	gray3		= {  75,  75,  75, 255 },
	lightOrange	= { 255, 168,  61, 255 },
	darkOrange	= { 242, 129,  29, 255 },
}

particleEffect = {
	x = 0,
	y = 0,
	color = { 255, 255, 255, 255 },
	timer = 0,
	limit = 1,
	status = "stop"
}

-------------------------------------------------------------------- COMPONENTS

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

----------------------------------------------------------------------- SYSTEMS

updateSystems = {
	require "systems_stage",
	require "systems_input",
	require "systems_spike",
	require "systems_movement",
	require "systems_collision",
	require "systems_particle",
	require "systems_score",
}
renderSystems = {
	require "systems_draw",
}

-------------------------------------------------------------- ENTITY FACTORIES

entities = {

	-- returns a list of entities filtered by the provided component names
	filter = function(self, ...)
		local list = {}
		for i,e in ipairs(self) do
			local success = true
			for j,c in ipairs(arg) do
				if e[c] == nil then success = false end
			end
			if success then table.insert(list, e) end
		end
		return list
	end,
	
	newPlayer = function(self, x, y, color1, color2)
		local e = {
			pos = table.copy(components.pos),
			colors = table.copy(components.colors),
			input = table.copy(components.input),
			block = table.copy(components.block),
			collidable = table.copy(components.collidable),
			pulse = table.copy(components.pulse),
		}
		if show then
			e.displayMovement = table.copy(components.displayMovement)
		end
		e.pos.x = x
		e.pos.y = y
		e.colors.top = color1
		e.colors.side = color2
		table.insert(self, e)
		return e
	end,
	
	newBeacon = function(self, x, y, color1, color2)
		local e = {
			pos = table.copy(components.pos),
			colors = table.copy(components.colors),
			block = table.copy(components.block),
			collidable = table.copy(components.collidable),
		}
		e.pos.x = x
		e.pos.y = y
		e.colors.top = color1
		e.colors.side = color2
		table.insert(self, e)
		return e
	end,
	
	newSpike = function(self, delay, interval, ...)
		local e = {
			spike = table.copy(components.spike),
			pos = table.copy(components.pos),
			pattern = table.copy(components.pattern),
			colors = table.copy(components.colors),
			spike = table.copy(components.spike),
			collidable = table.copy(components.collidable),
		}
		e.pos.x = arg[1]
		e.pos.y = arg[2]
		e.colors.top = colors.white
		e.colors.side = colors.lightGray
		e.spike.timer = -delay
		e.spike.interval1 = interval
		for i = 1, #arg, 2 do
			table.insert(e.pattern, { x = arg[i], y = arg[i+1] })
		end
		table.insert(self, e)
		return e
	end,
	
	newText = function(self, text, font, x, y, color)
		local e = {
			pos = table.copy(components.pos),
			text = table.copy(components.text),
			color = table.copy(components.color),
		}
		e.pos.x = x
		e.pos.y = y
		e.color.rgb = color
		e.text.string = text
		e.text.font = font
		table.insert(self, e)
		return e
	end,
	
	newStage = function(self, id, remaining, status, init)
		local e = {
			stage = table.copy(components.stage),
		}
		e.stage.id = id
		e.stage.status = status
		e.stage.init = init
		e.stage.remaining = remaining
		e.stage.total = remaining
		e.stage.maxMoves = maxMoves
		table.insert(self, e)
		return e
	end,
	
	newStats = function(self)
		local e = {
			stats = table.copy(components.stats),
		}
		table.insert(self, e)
		return e
	end,
}
setmetatable(entities, { __call = entities.filter })