local Snow = {}

function Snow:load()
    self.speedX = 100 
    self.speedY = 100
    self.snowDrop = gTextures.snow
    self.snow = love.graphics.newParticleSystem(self.snowDrop, 300)
    self.snow:setEmitterLifetime(-1)
	self.snow:setParticleLifetime(3, 3)
	self.snow:setSizes(0.7)
	self.snow:setEmissionArea("uniform", VIRTUAL_WIDTH, 0.5)
	self.snow:setRotation(1, 1)
	self.snow:setEmissionRate(100)
	self.snow:setDirection(math.pi/2)
	self.snow:setSpeed(self.speedX, self.speedY)
    self.snow:stop()
    
    self.snowing = true
    self.wind = 0

    self.howl = gSounds.wind
    self.howl:setLooping(true)
    self.howl:setVolume(0)
end

function Snow:update(dt)
    if Map.currentLevel == 5 then
        self.speedX = 100
        self.speedY = 100
        self.wind = 0
    elseif Map.currentLevel == 6 then 
        self.speedX = 300
        self.speedY = 500
        self.wind = -5
    elseif Map.currentLevel == 7 then
        self.speedX = 500
        self.speedY = 900
        self.wind = -7
    end

    if SFX_play == true then
        if self.wind < 0 then
            self.howl:play()
            self.howl:setVolume(0.05)
            self.howl:setPitch(2)
        else
            self.howl:pause()
        end
    else
        self.howl:stop()
    end

    self.snow:setDirection(math.pi/2 - self.wind/10)
    self.snow:setRotation(-self.wind/10, -self.wind/10)
    self.snow:setSpeed(self.speedX, self.speedY)

    if Map.currentLevel >= 5 and Map.currentLevel <= 8 then
        if self.snowing then
            self.snow:start()
        else
            self.snow:stop()
            self.snow:reset()
        end
    else
        self.snow:stop()
    end

    self.snow:update(dt)
end

function Snow:draw()
    love.graphics.draw(self.snow, VIRTUAL_WIDTH/2 - self.wind)
end

return Snow