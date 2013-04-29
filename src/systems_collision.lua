return function(dt)
	local collidableEntities = entities("pos", "collidable")
	for _,a in ipairs(collidableEntities) do
		for __,b in ipairs(collidableEntities) do
			if a ~= b and a.pos.x == b.pos.x and a.pos.y == b.pos.y then
				local stage = a.actor.stage
				if not stats.turnsLeft or stats.turnsLeft > 0 then
				
					-- player and spike collide
					-- mark player as dead
					if a.block and a.input and b.spike and b.spike.active then
						stats.dead = true
					end
					
					-- player and block collide
					-- remove the block, move to next stage if necessary
					if a.block and a.input and b.block then
						particleEffect.color = b.colors.top
						particleEffect.status = "start"
						particleEffect.x = b.pos.x + tile.width/2
						particleEffect.y = b.pos.y + tile.height/2 + 15
						local note = piano.pattern[piano.prev]
						love.audio.stop(pianoHigh[note])
						love.audio.play(pianoHigh[note])
						b.collidable = nil
						b.colors = nil
						stage.remaining = stage.remaining - 1
						if stage.remaining <= 0 then
							stage.status = "next"
							stats.dead = false
						end
					end
					
				end
			end
		end
	end
end