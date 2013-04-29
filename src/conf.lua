function love.conf(t)
    t.title = "Touch Blocks, Avoid Spikes"
	t.author = "ecbambrick"
	t.url = ""
	t.version = "0.8.0"
    t.release = false
    t.screen.width = 50*13
    t.screen.height = 35*13+15
    t.screen.fullscreen = false
	t.screen.vsync = true
	t.screen.fsaa = 0
    t.modules.joystick = false
    t.modules.audio = true
    t.modules.keyboard = true
    t.modules.event = true
    t.modules.image = true
    t.modules.graphics = true
    t.modules.timer = true
    t.modules.mouse = false
    t.modules.sound = true
    t.modules.physics = false
end
