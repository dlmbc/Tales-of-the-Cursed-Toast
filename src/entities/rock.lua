local Rock = {}
Rock.__index = Rock

local ActiveRocks = {}

function Rock:load(x, y)
   local self = setmetatable({}, Rock)
   self.x = x
   self.y = y

   self.startX = self.x
   self.startY = self.y

   self.width = 16
   self.height = 16

   self.speed = 100
   self.speedMod = 1
   self.dx = self.speed

   self.speedCounter = 0
   self.speedTrigger = 2

   self.damage = 1
    
   self.color = {
      blue = 1,
      red = 1,
      green = 1,
      speed = 3
   }

   self.state = 'walk'

   self:loadAssets()

   self.physics = {}
   self.physics.body = love.physics.newBody(World, self.x, self.y, 'dynamic')
   self.physics.body:setFixedRotation(true)
   self.physics.body:setMass(25)
   self.physics.shape = love.physics.newRectangleShape(self.width * 0.4, self.height * 0.75)
   self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)
    
   table.insert(ActiveRocks, self)
end

-- Animtaion for enemy
function Rock:loadAssets()
   self.animation = {state}

   self.animation.walk = Animation {
      frames = {1,2,3,4},
      interval = 0.1,
   }

   self.animation.run = Animation {
      frames = {1,2,3,4},
      interval = 0.1,
   }

   self.currentAnimation = self.animation[self.state]
end

function Rock.removeAll()
   for i,v in ipairs(ActiveRocks) do
      v.physics.body:destroy()
   end

   ActiveRocks = {}
end

-- change color when in rage mode
function Rock:changeColor()
    self.color.blue = 1
    self.color.blue = 0
    self.color.green = 1
end

function Rock:increaseSpeed()
   self.speedCounter = self.speedCounter + 1
   if self.speedCounter > self.speedTrigger then
      self:changeColor()
      self.state = 'run'
      self.currentAnimation = self.animation[self.state]
      self.speedMod = 3
      self.speedCounter = 0
   else
      self.state = 'walk'
      self.currentAnimation = self.animation[self.state]
      self.speedMod = 1
   end
end

function Rock:normalColor(dt)
   self.color.red = math.min(self.color.red + self.color.speed * dt, 1)
   self.color.green = math.min(self.color.green + self.color.speed * dt, 1)
   self.color.blue = math.min(self.color.blue + self.color.speed * dt, 1)
end

function Rock:resetPosition()
   self.physics.body:setPosition(self.startX, self.startY)
end

function Rock:update(dt)
   if playing == true then
      if self.height > MapHeight then
         self:resetPosition()
      end

      self:syncPhysics()
      self.currentAnimation:update(dt)
      self:normalColor(dt)
   end
end

function Rock:flipDirection()
   self.dx = -self.dx
end

function Rock:syncPhysics()
   self.x, self.y = self.physics.body:getPosition()
   self.physics.body:setLinearVelocity(self.dx * self.speedMod, 100)
end

function Rock:draw()
   local scaleX = 1
   if self.dx < 0 then
      scaleX = -1
   end
   love.graphics.setColor(self.color.blue, self.color.red, self.color.green)
   love.graphics.draw(
      gTextures.rock, gFrames.rock[self.currentAnimation:getCurrentFrame()],
      self.x, self.y, 0, scaleX, 1, self.width/2, self.height/2
   )
   love.graphics.setColor(1,1,1,1)
end

function Rock.updateAll(dt)
   for i,instance in ipairs(ActiveRocks) do
      instance:update(dt)
   end
end

function Rock.drawAll()
   for i,instance in ipairs(ActiveRocks) do
      instance:draw()
   end
end

function Rock.beginContact(a, b, collision)
   for i,instance in ipairs(ActiveRocks) do
      if a == instance.physics.fixture or b == instance.physics.fixture then
         if a == Player.character.fixture or b == Player.character.fixture then
            Player:takeDamage(instance.damage)
         end
         instance:increaseSpeed()
         instance:flipDirection()
      end
   end
end

return Rock