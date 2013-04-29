local load, unload, reload, main

main = function(dt)
	for _,e in ipairs(entities("stage")) do
	
		if e.stage.status == "load" then
			load(e.stage)
			e.stage.status = "loaded"
			
		elseif e.stage.status == "unload" then
			unload(e.stage)
			e.stage.status = "unloaded"
			
		elseif e.stage.status == "reload" then
			reload(e.stage)
			e.stage.status = "loaded"
			
		elseif e.stage.status == "next" then
			e.stage.remaining = e.stage.total
			unload(e.stage)
			for _,f in ipairs(entities("stage")) do
				if f.stage.id == e.stage.id % 11 + 1 then
					load(f.stage)
					f.stage.status = "loaded"
				end
			end
			e.stage.status = "unloaded"
		end
		
	end
end

load = function(stage)
	stage:init()
end

reload = function(stage)
	for _,e in ipairs(entities("actor")) do
		if e.actor.stage == stage then
			table.clear(e)
		end
	end
	stage:init()	
	for _,e in ipairs(entities("input")) do
		e.input.timer = -1
	end
end

unload = function(stage)
	for _,e in ipairs(entities("actor")) do
		if e.actor.stage == stage then
			table.clear(e)
		end
	end
end

return main