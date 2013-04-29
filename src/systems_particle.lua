local particleSystem = love.graphics.newParticleSystem(particle, 100)
	  particleSystem:setEmissionRate(200)
	  particleSystem:setSpeed(10, 500)
	  particleSystem:setSizes(1, 1)
	  particleSystem:setLifetime(0.2)
	  particleSystem:setParticleLife(1)
	  particleSystem:setDirection(0)
	  particleSystem:setSpread(math.pi*2)
	  particleSystem:setDirection(-math.pi/2)

particleEffect.system = particleSystem

return function(dt)

	if particleEffect.status == "start" then
		local c = particleEffect.color
		particleSystem:setPosition(particleEffect.x,particleEffect.y)
		particleSystem:setColors(c[1], c[2], c[3], 100, c[1], c[2], c[3], 0)
		particleSystem:start()
		particleEffect.status = "update"
		particleEffect.timer = 0
	end
	
	if particleEffect.status == "update" then
		particleSystem:update(dt)
		if not particleSystem.isActive then
			particleEffect.status = "stop"
		end
	end
	
	if particleEffect.status == "stop" then
		particleSystem:stop()
		particleEffect.status = "idle"
	end
	
end
