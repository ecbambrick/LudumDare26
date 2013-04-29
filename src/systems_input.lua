return function(dt)

	-- system input
	if love.keyboard.isDown("lalt") and love.keyboard.isDown("f4") then
		love.event.quit()
	end
	
	-- player input
	for _,e in ipairs(entities("input")) do
		local input, pos, move = e.input, e.pos, e.controls
		input.last = nil
		
		-- check a timer to see if the player has pressed keys too quickly
		-- this keeps the input event from firing every frame
		if input.timer <= input.interval then
			input.timer = input.timer + dt
		else
		
			-- GUI input
			if love.keyboard.isDown("tab") then
				if e.displayMovement then e.displayMovement = nil
				else e.displayMovement = {} end
				show = not show
				input.last = "tab"
			end
			
			-- movement input
			if love.keyboard.isDown("a") then
				input.last = "left"
			elseif love.keyboard.isDown("d") then
				input.last = "right"
			elseif love.keyboard.isDown("w") then
				input.last = "up"
			elseif love.keyboard.isDown("s","x") then
				input.last = "down"
			elseif love.keyboard.isDown("q") then
				input.last = "upLeft"
			elseif love.keyboard.isDown("e") then
				input.last = "upRight"
			elseif love.keyboard.isDown("z") then
				input.last = "downLeft"
			elseif love.keyboard.isDown("c") then
				input.last = "downRight"
			end
			
			-- reset timer
			if input.last then
				input.timer = 0
			end
		end
	end
end