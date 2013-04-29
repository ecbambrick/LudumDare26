function love.load()

	-- load global data and utility functions
	require "data"
	require "utility"

	-- load graphics and graphical settings
	love.graphics.setBackgroundColor(colors.beige)
	fontL = love.graphics.newFont("font/GOTHIC.TTF", 72)
	fontM = love.graphics.newFont("font/GOTHIC.TTF", 42)
	fontS = love.graphics.newFont("font/GOTHIC.TTF", 24)
	particle = love.graphics.newImage("image/particle.png")
	
	-- load sounds
	piano = {
		prev = 1,
		current = 1,
		pattern = { 1, 4, 7, 10, 9, 5, 7, 12, 10, 9, 5, 7, 3, 1 },
		love.audio.newSource("audio/3A.ogg"),
		love.audio.newSource("audio/4As.ogg"),
		love.audio.newSource("audio/3B.ogg"),
		love.audio.newSource("audio/4C.ogg"),
		love.audio.newSource("audio/4D.ogg"),
		love.audio.newSource("audio/4Ds.ogg"),
		love.audio.newSource("audio/4E.ogg"),
		love.audio.newSource("audio/4F.ogg"),
		love.audio.newSource("audio/4Fs.ogg"),
		love.audio.newSource("audio/4G.ogg"),
		love.audio.newSource("audio/4Gs.ogg"),
		love.audio.newSource("audio/4A.ogg"),
	}
	pianoHigh = {
		love.audio.newSource("audio/4A.ogg"),
		love.audio.newSource("audio/5As.ogg"),
		love.audio.newSource("audio/4B.ogg"),
		love.audio.newSource("audio/5C.ogg"),
		love.audio.newSource("audio/5D.ogg"),
		love.audio.newSource("audio/5Ds.ogg"),
		love.audio.newSource("audio/5E.ogg"),
		love.audio.newSource("audio/5F.ogg"),
		love.audio.newSource("audio/5Fs.ogg"),
		love.audio.newSource("audio/5G.ogg"),
		love.audio.newSource("audio/5Gs.ogg"),
		love.audio.newSource("audio/5A.ogg"),
	}
	pianoLow = {
		love.audio.newSource("audio/00A.ogg"),
		love.audio.newSource("audio/00B.ogg"),
		love.audio.newSource("audio/00C.ogg"),
	}
	
	-- load entity component system
	require "systems"
	require "components"
	require "entities"
	
	-- load game data
	require "stages"
	stats = entities:newStats().stats
	
end

function love.update(dt)
	for i,v in ipairs(updateSystems) do v(dt) end
end

function love.draw()
	for i,v in ipairs(renderSystems) do v() end
end
