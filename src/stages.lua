-- initialize entities
local w, h, p = tile.width, tile.height

--------------------------------------------------------------------------------

entities:newStage(0, 1, "load", function(self)
	stats.movesLeft = 1000000
	loadTitles = false
	loadedTittles = false
	local title = "TOUCH BLOCKS, AVOID SPIKES"
	local subtitle1 = "MOVE TO THE GREEN BLOCK TO PLAY"
	local subtitle2 = "PRESS TAB TO TOGGLE DIRECTION MARKERS"
	local actors = {
		entities:newPlayer(4*w, 8*h, colors.lightGray, colors.darkGray),
		entities:newText(title, fontM, window.width - fontM:getWidth(title)-18, 0, colors.gray3),
		entities:newBeacon(8*w, 8*h, colors.lightGreen, colors.darkGreen),
		entities:newText(subtitle1, fontS, window.width - fontS:getWidth(subtitle1)-18, 70, colors.gray3),
		entities:newText(subtitle2, fontS, window.width - fontS:getWidth(subtitle2)-18, 100, colors.gray3),
	}
	actors[1].movement = table.copy(components.movement1)
	for i,v in ipairs(actors) do v.actor = { stage = self } end
end)

--------------------------------------------------------------------------------

entities:newStage(1, 3, "asd", function(self)
	stats.movesLeft = 3
	loadTitles = true
	local title = "STAGE ONE"
	local actors = {
		entities:newPlayer(2*w, 8*h, colors.lightGray, colors.darkGray),
		entities:newText(title, fontL, window.width - fontL:getWidth(title)-20, 0, colors.gray3),
		entities:newBeacon(4*w, 6*h, colors.lightGreen, colors.darkGreen),
		entities:newBeacon(6*w, 8*h, colors.lightOrange, colors.darkOrange),
		entities:newBeacon(7*w, 8*h, colors.lightBlue, colors.darkBlue),
	}
	actors[1].movement = table.copy(components.movement1)
	for i,v in ipairs(actors) do v.actor = { stage = self } end
end)

--------------------------------------------------------------------------------

entities:newStage(2, 3, "idle", function(self)
	stats.movesLeft = 6
	local title = "STAGE TWO"	
	local actors = {
		entities:newPlayer(7*w, 8*h, colors.lightGray, colors.darkGray),
		entities:newText(title, fontL, window.width - fontL:getWidth(title)-20, 0, colors.gray3),
		entities:newBeacon(3*w, 8*h, colors.lightGreen, colors.darkGreen),
		entities:newBeacon(9*w, 5*h, colors.lightOrange, colors.darkOrange),
		entities:newBeacon(5*w, 10*h, colors.lightBlue, colors.darkBlue),
		entities:newSpike(0, 0.5, 5*w, 6*h, 6*w, 6*h, 7*w, 6*h, 6*w, 6*h),
	}
	actors[1].movement = table.copy(components.movement1)
	for i,v in ipairs(actors) do v.actor = { stage = self } end
end)

--------------------------------------------------------------------------------

entities:newStage(3, 5, "asd", function(self)	
	stats.movesLeft = 8
	local title = "STAGE THREE"
	local actors = {
		entities:newPlayer(6*w, 8*h, colors.lightGray, colors.darkGray),
		entities:newText(title, fontL, window.width - fontL:getWidth(title)-20, 0, colors.gray3),
		entities:newBeacon(4*w, 9*h, colors.lightBlue, colors.darkBlue),
		entities:newBeacon(8*w, 9*h, colors.lightOrange, colors.darkOrange),
		entities:newBeacon(8*w, 6*h, colors.lightBlue, colors.darkBlue),
		entities:newBeacon(4*w, 6*h, colors.lightOrange, colors.darkOrange),
		entities:newBeacon(6*w, 7*h, colors.lightGreen, colors.darkGreen),
		entities:newSpike(0, 0, 4*w, 5*h),
		entities:newSpike(0, 0, 8*w, 5*h),
	}
	actors[1].movement = table.copy(components.movement1)
	for i,v in ipairs(actors) do v.actor = { stage = self } end
end)

--------------------------------------------------------------------------------

entities:newStage(4, 5, "asd", function(self)	
	stats.movesLeft = 7
	local title = "STAGE FOUR"
	local actors = {
		entities:newPlayer(6*w, 8*h, colors.lightGray, colors.darkGray),
		entities:newText(title, fontL, window.width - fontL:getWidth(title)-20, 0, colors.gray3),
		
		entities:newBeacon(4*w, 8*h, colors.lightBlue, colors.darkBlue),
		entities:newBeacon(4*w, 10*h, colors.lightOrange, colors.darkOrange),
		entities:newBeacon(8*w, 8*h, colors.lightGreen, colors.darkGreen),
		entities:newBeacon(8*w, 10*h, colors.lightRed, colors.darkRed),
		entities:newBeacon(6*w, 6*h, colors.lightOrange, colors.darkOrange),
		
		entities:newSpike(0, 0, 5*w, 7*h),
		entities:newSpike(0, 0, 6*w, 7*h),
		entities:newSpike(0, 0, 7*w, 7*h),
		entities:newSpike(0, 0, 5*w, 9*h),
		entities:newSpike(0, 0, 6*w, 9*h),
		entities:newSpike(0, 0, 7*w, 9*h),
		
		entities:newSpike(0, 0.5, 4*w, 9*h),
		entities:newSpike(0.5, 0.5, 8*w, 9*h),
	}
	actors[1].movement = table.copy(components.movement1)
	for i,v in ipairs(actors) do v.actor = { stage = self } end
end)

--------------------------------------------------------------------------------

entities:newStage(5, 3, "asd", function(self)	
	stats.movesLeft = 6
	local title = "STAGE FIVE"
	local actors = {
		entities:newPlayer(1*w, 8*h, colors.lightGray, colors.darkGray),
		entities:newText(title, fontL, window.width - fontL:getWidth(title)-20, 0, colors.gray3),
		entities:newBeacon(5*w, 8*h, colors.lightGreen, colors.darkGreen),
		entities:newBeacon(9*w, 8*h, colors.lightOrange, colors.darkOrange),
		entities:newBeacon(11*w, 8*h, colors.lightBlue, colors.darkBlue),
		entities:newSpike(0, 0.5, 3*w, 6*h),
		entities:newSpike(0.15, 0.5, 3*w, 10*h),
		entities:newSpike(0.30, 0.5, 7*w, 6*h),
		entities:newSpike(0.45, 0.5, 7*w, 10*h),
		entities:newSpike(0.60, 0.5, 10*w, 8*h),
	}
	actors[1].movement = table.copy(components.movement1)
	for i,v in ipairs(actors) do v.actor = { stage = self } end
end)

--------------------------------------------------------------------------------

entities:newStage(6, 1, "asd", function(self)	
	stats.movesLeft = 7
	local title = "STAGE SIX"
	local actors = {
		entities:newPlayer(2*w, 8*h, colors.lightGray, colors.darkGray),
		entities:newText(title, fontL, window.width - fontL:getWidth(title)-20, 0, colors.gray3),
		entities:newBeacon(9*w, 8*h, colors.lightGreen, colors.darkGreen),
		entities:newSpike(0.5, 1, 3*w, 8*h),
		entities:newSpike(0, 1, 8*w, 8*h),
		entities:newSpike(0.5, 1, 7*w, 8*h),
		entities:newSpike(0, 1, 6*w, 8*h),
		entities:newSpike(0.5, 1, 5*w, 8*h),
		entities:newSpike(0, 1, 4*w, 8*h),
		
		entities:newSpike(0, 0, 4*w, 6*h),
		entities:newSpike(0, 0, 5*w, 6*h),
		entities:newSpike(0, 0, 6*w, 6*h),
		entities:newSpike(0, 0, 7*w, 6*h),
		entities:newSpike(0, 0, 4*w, 5*h),
		entities:newSpike(0, 0, 5*w, 5*h),
		entities:newSpike(0, 0, 6*w, 5*h),
		entities:newSpike(0, 0, 7*w, 5*h),
		
		entities:newSpike(0, 0, 4*w, 10*h),
		entities:newSpike(0, 0, 5*w, 10*h),
		entities:newSpike(0, 0, 6*w, 10*h),
		entities:newSpike(0, 0, 7*w, 10*h),
		entities:newSpike(0, 0, 4*w, 11*h),
		entities:newSpike(0, 0, 5*w, 11*h),
		entities:newSpike(0, 0, 6*w, 11*h),
		entities:newSpike(0, 0, 7*w, 11*h),
	}
	actors[1].movement = table.copy(components.movement1)
	for i,v in ipairs(actors) do v.actor = { stage = self } end
end)

--------------------------------------------------------------------------------

entities:newStage(7, 5, "asd", function(self)	
	stats.movesLeft = 12
	local title = "STAGE SEVEN"
	local actors = {
		entities:newPlayer(6*w, 8*h, colors.lightGray, colors.darkGray),
		entities:newText(title, fontL, window.width - fontL:getWidth(title)-20, 0, colors.gray3),
		
		entities:newBeacon(7*w, 8*h, colors.lightOrange, colors.darkOrange),
		entities:newBeacon(9*w, 7*h, colors.lightBlue, colors.darkBlue),
		entities:newBeacon(8*w, 6*h, colors.lightGreen, colors.darkGreen),
		entities:newBeacon(2*w, 8*h, colors.lightRed, colors.darkRed),
		entities:newBeacon(3*w, 10*h, colors.lightOrange, colors.darkOrange),
		
		entities:newSpike(0, 0, 5*w, 7*h),
		entities:newSpike(0, 0, 6*w, 7*h),
		entities:newSpike(0, 0, 7*w, 7*h),
		entities:newSpike(0, 0, 5*w, 9*h),
		entities:newSpike(0, 0, 6*w, 9*h),
		entities:newSpike(0, 0, 7*w, 9*h),
		entities:newSpike(0, 0, 5*w, 8*h),
		entities:newSpike(0, 0, 9*w, 6*h),
		
		entities:newSpike(0.75, 0.5, 8*w, 7*h),
		entities:newSpike(0.5, 0.5, 8*w, 8*h),
		entities:newSpike(0.25, 0.5, 8*w, 9*h),
		entities:newSpike(0, 0.5, 4*w, 10*h),
		
		entities:newSpike(0, 0.5, 2*w, 9*h),
		entities:newSpike(0.25, 0.5, 2*w, 10*h),
	}
	actors[1].movement = table.copy(components.movement1)
	for i,v in ipairs(actors) do v.actor = { stage = self } end
end)

--------------------------------------------------------------------------------

entities:newStage(8, 4, "asd", function(self)	
	stats.movesLeft = 12
	local title = "STAGE EIGHT"
	local actors = {
		entities:newPlayer(1*w, 8*h, colors.lightGray, colors.darkGray),
		entities:newText(title, fontL, window.width - fontL:getWidth(title)-20, 0, colors.gray3),
		
		entities:newBeacon(6*w, 11*h, colors.lightRed, colors.darkRed),
		entities:newBeacon(5*w, 8*h, colors.lightBlue, colors.darkBlue),
		entities:newBeacon(9*w, 7*h, colors.lightGreen, colors.darkGreen),
		entities:newBeacon(11*w, 8*h, colors.lightOrange, colors.darkOrange),
		
		entities:newSpike(0, 0, 3*w, 8*h),
		entities:newSpike(0, 0, 7*w, 8*h),
		entities:newSpike(0, 0, 5*w, 9*h),
		
		entities:newSpike(0.0, 0.6, 2*w, 8*h),
		entities:newSpike(0.1, 0.6, 2*w, 9*h),
		entities:newSpike(0.2, 0.6, 3*w, 9*h),
		entities:newSpike(0.3, 0.6, 4*w, 9*h),
		entities:newSpike(0.4, 0.6, 4*w, 8*h),
		entities:newSpike(0.6, 0.6, 4*w, 7*h),
		entities:newSpike(0.7, 0.6, 3*w, 7*h),
		entities:newSpike(0.8, 0.6, 2*w, 7*h),
		
		entities:newSpike(0.0, 0.6, 6*w, 8*h),
		entities:newSpike(0.1, 0.6, 6*w, 9*h),
		entities:newSpike(0.2, 0.6, 7*w, 9*h),
		entities:newSpike(0.3, 0.6, 8*w, 9*h),
		entities:newSpike(0.4, 0.6, 8*w, 8*h),
		entities:newSpike(0.6, 0.6, 8*w, 7*h),
		entities:newSpike(0.7, 0.6, 7*w, 7*h),
		entities:newSpike(0.8, 0.6, 6*w, 7*h),
		
	}
	for i = 1,11 do
		table.insert(actors, entities:newSpike(0, 0, i*w, 4*h))
		table.insert(actors, entities:newSpike(0, 0, i*w, 5*h))
		table.insert(actors, entities:newSpike(0, 0, i*w, 6*h))
		table.insert(actors, entities:newSpike(0, 0, i*w, 10*h))
		if i ~= 6 then
			table.insert(actors, entities:newSpike(0, 0, i*w, 11*h))
		end
	end
	actors[1].movement = table.copy(components.movement1)
	for i,v in ipairs(actors) do v.actor = { stage = self } end
end)

--------------------------------------------------------------------------------

entities:newStage(9, 4, "asd", function(self)	
	stats.movesLeft = 11
	local title = "STAGE NINE"
	local actors = {
		entities:newPlayer(1*w, 8*h, colors.lightGray, colors.darkGray),
		entities:newText(title, fontL, window.width - fontL:getWidth(title)-20, 0, colors.gray3),
		entities:newBeacon(4*w, 8*h, colors.lightRed, colors.darkRed),
		entities:newBeacon(8*w, 8*h, colors.lightRed, colors.darkRed),
		entities:newBeacon(8*w, 5*h, colors.lightRed, colors.darkRed),
		entities:newBeacon(11*w, 8*h, colors.lightRed, colors.darkRed),
		
	}
	for i = 2,11 do
		for j = 4,11 do
			if not ( i==1 or i==4 or i==8 or i == 11 ) then
				table.insert(actors, entities:newSpike(j*0.5/11, 0.5, i*w, j*h))
			end
		end
	end
	for i = 2,11 do
		for j = 4,11 do
			if not ( j==5 or j==8 ) then
				table.insert(actors, entities:newSpike(i*0.5/11, 0.5, i*w, j*h))
			end
		end
	end
	actors[1].movement = table.copy(components.movement1)
	for i,v in ipairs(actors) do v.actor = { stage = self } end
end)

--------------------------------------------------------------------------------

entities:newStage(10, 1, "asd", function(self)	
	loadTitles = false
	loadedTitles = false
	stats.movesLeft = 100000
	local title = "FINAL STAGE"
	local subtitle = "NO TURN LIMIT"
	local actors = {
		entities:newPlayer(1*w, 8*h, colors.lightGray, colors.darkGray),
		entities:newText(title, fontL, window.width - fontL:getWidth(title)-20, 0, colors.gray3),
		entities:newText(subtitle, fontS, window.width - fontS:getWidth(subtitle)-20, 80, colors.gray3),
		entities:newBeacon(11*w, 8*h, colors.lightGreen, colors.darkGreen),
	}
	for i = 1,11 do
		for j = 4,11 do
			if not (i == 1 and j == 8) 
			and not (i == 11 and j == 8) 
			and not (i == 6 and j == 8) then
				table.insert(actors, entities:newSpike(math.random(), 1, i*w, j*h))
			end
		end
	end
	actors[1].movement = table.copy(components.movement1)
	for i,v in ipairs(actors) do v.actor = { stage = self } end
end)

--------------------------------------------------------------------------------

entities:newStage(11, 1, "asd", function(self)	
	stats.movesLeft = 100000
	local title = "CONGRATULATIONS"
	local subtitle = "MOVE TO THE GREEN BLOCK TO PLAY AGAIN"
	local actors = {
		entities:newPlayer(4*w, 8*h, colors.lightGray, colors.darkGray),
		entities:newText(title, fontM, window.width - fontM:getWidth(title)-20, 0, colors.gray3),
		entities:newBeacon(8*w, 8*h, colors.lightGreen, colors.darkGreen),
		entities:newText(subtitle, fontS, window.width - fontS:getWidth(subtitle)-18, 70, colors.gray3),
	}
	actors[1].movement = table.copy(components.movement1)
	for i,v in ipairs(actors) do v.actor = { stage = self } end
end)
