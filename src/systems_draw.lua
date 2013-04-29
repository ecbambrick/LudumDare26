return function()

	-- order draw lists by y-coordinate
	local text = entities("text")
	local drawables = entities("pos", "colors")
	table.sort(drawables, function(a,b) return a.pos.y < b.pos.y end)
	
---------------------------------------------------------- DRAW CHECKER PATTERN

	local switch = 0
	for i = tile.width, window.width-tile.width*2, tile.width do
		for j = tile.height*5, window.height-tile.height, tile.height do
			if (j/tile.height)%2 == switch then
			love.graphics.setColor(colors.medBeige)
			love.graphics.rectangle("fill", i, j-20, tile.width, tile.height)
			end
		end
		switch = (switch + 1) % 2
	end

--------------------------------------------------------------------- DRAW TEXT
	
	love.graphics.setFont(fontL)
	for _,e in ipairs(text) do
		love.graphics.setFont(e.text.font)
		love.graphics.setColor(e.color.rgb)
		love.graphics.print(e.text.string, e.pos.x, e.pos.y)
	end
		
------------------------------------------------------------------- DRAW BLOCKS
		
	-- draw blocks and spikes
	for _,e in ipairs(drawables) do

		if e.block and not e.pulse then
			love.graphics.setColor(e.colors.side)
			love.graphics.rectangle("fill", e.pos.x,e.pos.y,tile.width,tile.width)
			love.graphics.setColor(e.colors.top)
			love.graphics.rectangle("fill", e.pos.x,e.pos.y-5,tile.width,tile.height)
		end
		
		if e.block and e.pulse then
			local p = e.pulse
			p.counter = p.counter + 0.05 * p.dir
			if p.counter >= p.max or p.counter <= p.min then
				p.dir = p.dir * -1
			end
			local j = p.counter/2
			
			love.graphics.setColor(e.colors.side)
			love.graphics.rectangle("fill", e.pos.x,e.pos.y,tile.width,tile.width)
			love.graphics.setColor(e.colors.top)
			love.graphics.rectangle("fill", e.pos.x,e.pos.y-5-j,tile.width,tile.height)
		end

-------------------------------------------------------------------- DRAW SPIKE

		local w,h = tile.width, tile.height
		if e.spike and e.spike.active then
			local temp = w - (w*(e.spike.timer - e.spike.interval1))/e.spike.interval3
			local temp2 = h - (h*(e.spike.timer - e.spike.interval1))/e.spike.interval3
			love.graphics.setColor(e.colors.top)
			love.graphics.arc(
				"fill",
				e.pos.x + w/2,
				e.pos.y + w - w/2,
				w/2 - (w/2*(e.spike.timer - e.spike.interval1))/e.spike.interval3,
				0,
				math.pi
			)
			love.graphics.setColor(e.colors.side)
			love.graphics.arc(
				"fill",
				e.pos.x + w/2,
				e.pos.y + w - w/2,
				w/2 - (w/2*(e.spike.timer - e.spike.interval1))/e.spike.interval3,
				0,
				math.pi/2
			)
			
			love.graphics.setColor(e.colors.top)
			love.graphics.polygon(
				"fill",
				e.pos.x + (w-temp)/2,	e.pos.y + tile.width - tile.width/2,
				e.pos.x + w-(w-temp)/2,	e.pos.y + tile.width - tile.width/2,
				e.pos.x + w/2,			(e.pos.y + tile.width - tile.width/2) - temp2
			)
			love.graphics.setColor(e.colors.side)
			love.graphics.polygon(
				"fill",
				e.pos.x + w/2,	e.pos.y + tile.width - tile.width/2,
				e.pos.x + w-(w-temp)/2,	e.pos.y + tile.width - tile.width/2,
				e.pos.x + w/2,			(e.pos.y + tile.width - tile.width/2) - temp2
			)
		end
	end
	
--------------------------------------------------------- DRAW MOVEMENT MARKERS
	
	for _,e in ipairs(drawables) do
		if e.block and e.movement and e.displayMovement then
			local color = colors.black
			color[4] = 100
			love.graphics.setFont(fontS)
			love.graphics.setColor(color)
			for _,m in pairs(e.movement) do
				local x,y,w,h = e.pos.x, e.pos.y, tile.width, tile.height
				local newX, newY =  x+m.x*w, y+m.y*h+15
				if newX >= tile.width and newX < window.width - tile.width
				and newY > tile.height*4 and newY < window.height - tile.height then
					love.graphics.rectangle("line", x+m.x*w, y+m.y*h+15, w, h)
					love.graphics.print(m.key,x+m.x*w+w/2-fontS:getWidth(m.key)/2,y+m.y*h+h/2-2)
				end
			end
			
		end
	end
	
--------------------------------------------------------- DRAW PARTICLE EFFECTS
	
	love.graphics.setColor(colors.white)
	love.graphics.draw(particleEffect.system, 0, 0)
end