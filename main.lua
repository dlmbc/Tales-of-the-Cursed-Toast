love.graphics.setDefaultFilter('nearest', 'nearest')

require 'src/Dependencies'

playing = false -- not playing
titleState = true -- title sscreen first before playing
loaded = false -- no load game

shader = love.graphics.newShader(Shader)

function love.load()
	love.mouse.setVisible(false)

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = true
	})

	gStateMachine = StateMachine {
		['title'] = function() return TitleScreenState() end,
		['settings'] = function() return SettingState() end,
		['how-to-play'] = function() return HowToPlayState() end,
		['how-to-play-2'] = function() return HowToPlayState2() end,
		['how-to-play-3'] = function() return HowToPlayState3() end,
		['play'] = function() return PlayState() end,
		['credits'] = function() return CreditState() end,
		['logo-play'] = function() return StartState() end,
		['load'] = function() return LoadState() end,
		['ending'] = function() return EndingState() end
	}
	gStateMachine:change('logo-play')

	gSounds.aspire:play()
	gSounds.aspire:setLooping(true)
	
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
	if Map.currentLevel == nil then
		gStateMachine:render()

	else
		if (Map.currentLevel >= 1 and Map.currentLevel <= 8) or
			(Map.currentLevel == 13) then
			gStateMachine:render()
		end

		if Map.currentLevel >= 9 and Map.currentLevel <= 12 then
			love.graphics.setShader(shader)
			shader:send('screen', {
				VIRTUAL_WIDTH,
				VIRTUAL_HEIGHT
			})
			shader:send('lights[0].diffuse', {
				1.0, 1.0, 1.0
			})
			
			shader:send('lights[0].position', {
				Player.x - Camera.x,
				Player.y - Camera.y
			})
			shader:send('lights[0].power', 25)
		
			shader:send('lights[0].enabled', true)
				gStateMachine:render()
			love.graphics.setShader()
		end
	end
	push:finish()
end

function beginContact(a, b, collision)
	gStateMachine:beginContact(a, b, collision)
end

function endContact(a, b, collision)
	gStateMachine:endContact(a, b, collision)
end