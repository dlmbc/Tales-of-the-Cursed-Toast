love.graphics.setDefaultFilter('nearest', 'nearest')

require 'src/Dependencies'

playing = false -- not playing
titleState = true -- title sscreen first before playing
loaded = false -- no load game

function love.load()

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = true
	})

	gStateMachine = StateMachine {
		['title'] = function() return TitleScreenState() end,
		['settings'] = function() return SettingState() end,
		['how-to-play'] = function() return HowToPlayState() end,
		['play'] = function() return PlayState() end,
		['credits'] = function() return CreditState() end,
		['logo-play'] = function() return StartState() end,
		['load'] = function() return LoadState() end
	}
	gStateMachine:change('logo-play')

	gSounds.tbgm:play()
	gSounds.tbgm:setLooping(true)
	
	love.keyboard.keysPressed = {}
end

function love.resize(w, h)
	push:resize(w, h)
	print(w, h)
end

function love.keypressed(key)
	love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
	return love.keyboard.keysPressed[key]
end

function love.update(dt)
	gStateMachine:update(dt)

	love.keyboard.keysPressed = {}
end

function love.draw()
	push:start()
		gStateMachine:render()
	push:finish()
end

function beginContact(a, b, collision)
	gStateMachine:beginContact(a, b, collision)
end

function endContact(a, b, collision)
	gStateMachine:endContact(a, b, collision)
end