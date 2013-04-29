return function(dt)

	-- update remaining moves text
	if moveLimit then 
		moveLimit.text.string = "REMAINING MOVES: "..stats.movesLeft
	end

	-- display the remaining moves text when finishing the first stage
	if loadTitles and not loadedTitles then	
		moveLimit = entities:newText("REMAINING MOVES: "..0, fontS, window.width - fontS:getWidth("REMAINING MOVES: "..0)-30, 80, colors.gray3)
		loadedTitles = true
	elseif not loadTitles then
		-- table.clear(score)
		if moveLimit then table.clear(moveLimit) end
		moveLimit = nil
		loadedTitles = false
	end
	
	-- get the player
	local player
	for _,e in ipairs(entities("input")) do
		player = e
	end
	
	-- get the stage
	local stage
	for _,e in ipairs(entities("stage")) do
		if e.stage.status == "loaded" then stage = e.stage end
	end
	
	-- kill the player if they have run out of moves unless
	-- their final move completed the stage
	if stats.dead and stage then
		stats.dead = false
		for i in ipairs(pianoLow) do
			love.audio.stop(pianoLow[i])
			love.audio.play(pianoLow[i])
		end
		piano.current = 1
		stage.status = "reload"
		stage.remaining = stage.total
		particleEffect.color = player.colors.top
		particleEffect.status = "start"
		particleEffect.x = player.pos.x + tile.width/2
		particleEffect.y = player.pos.y + tile.height/2 + 15
	end

end
		