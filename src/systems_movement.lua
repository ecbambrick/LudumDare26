return function(dt)
	for _,e in ipairs(entities("movement", "pos")) do
		if e.input.last then
			local move, x, y = e.movement[e.input.last]
			if move then
			
				x = e.pos.x + e.movement[e.input.last].x * tile.width
				y = e.pos.y + e.movement[e.input.last].y * tile.height
			
				-- keep player within board boundaries
				-- subtract from the remaining moves for the stage
				if x > 0 and x < window.width - tile.width
				and y > tile.height*3 and y < window.height - tile.height - 15 then
					e.pos.x = x
					e.pos.y = y					
					local note = piano.pattern[piano.current]
					love.audio.stop(piano[note])
					love.audio.play(piano[note])
					piano.prev = piano.current
					piano.current = piano.current % #piano.pattern + 1
					stats.movesLeft = stats.movesLeft - 1
				end
				
				if stats.movesLeft == 0 then
					stats.dead = true
				end
				
			end
		end
	end
end