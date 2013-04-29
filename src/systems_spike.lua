return function(dt)
	for _,e in ipairs(entities("spike", "pos")) do
		local s = e.spike
		
		
		if s.interval1 == 0 then
			s.active = true
			s.timer = 0
		else
		
		-- increment timer
		s.timer = s.timer + dt
		if s.timer > s.interval1 then
			s.active = true
		end
		
		
		-- update spike position
		if s.timer > s.interval1 + s.interval3 then
			e.spike.active = false
			e.pattern.pos = e.pattern.pos % #e.pattern + 1
			e.pos.x = e.pattern[e.pattern.pos].x
			e.pos.y = e.pattern[e.pattern.pos].y
			e.spike.timer = 0
		end
	end
	end
end