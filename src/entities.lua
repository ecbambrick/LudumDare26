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
