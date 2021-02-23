local IceGoblin = {}
IceGoblin.__index = IceGoblin

local ActiveIceGoblins = {}

function IceGoblin:load(x, y)
   local self = setmetatable({}, IceGoblin)
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
   self.speedTrigger = 4

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
   self.physics.shape = love.physics.newRectangleShape(self.width, self.height * 0.75)
   self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)
    
   table.insert(ActiveIceGoblins, self)
end

--[[
   Animation for enemy
]]
function IceGoblin:loadAssets()
   self.animation = {state}

   self.animation.walk = Animation {
      frames = {1,2,3,4},
      interval = 0.1
   }

   self.animation.run = Animation {
      frames = {1,2,3,4},
      interval = 0.1
   }

   self.currentAnimation = self.animation[self.state]
end

-- remove all the body in the table
function IceGoblin.removeAll()
   for i,v in ipairs(ActiveIceGoblins) do
      v.physics.body:destroy()
   end

   ActiveIceGoblins = {}
end

-- change color when in rage mode
function IceGoblin:changeColor()
   self.color.blue = 1
   self.color.red = 0
   self.color.green = 0
end

-- every time enemy hits a wall or player increment speed counter to enter rage mode
function IceGoblin:increaseSpeed()
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

-- normalize color of the enemy
function IceGoblin:normalColor(dt)
   self.color.red = math.min(self.color.red + self.color.speed * dt, 1)
   self.color.green = math.min(self.color.green + self.color.speed * dt, 1)
   self.color.blue = math.min(self.color.blue + self.color.speed * dt, 1)
end

function IceGoblin:resetPosition()
   self.physics.body:setPosition(self.startX, self.startY)
end

function IceGoblin:update(dt)
   if playing == true then
      if self.height > MapHeight then
         self:resetPosition()
      end

      self:syncPhysics()
      self.currentAnimation:update(dt)
      self:normalColor(dt)
   end
end

function IceGoblin:flipDirection()
   self.dx = -self.dx
end

-- apply x velocity
function IceGoblin:syncPhysics()
   self.x, self.y = self.physics.body:getPosition()
   self.physics.body:setLinearVelocity(self.dx * self.speedMod, 100)
end

function IceGoblin:draw()
   local scaleX = 1

   if self.dx < 0 then
      scaleX = -1
   end

   love.graphics.setColor(self.color.blue, self.color.red, self.color.green)
   love.graphics.draw(
      gTextures.iceGoblin, gFrames.iceGoblin[self.currentAnimation:getCurrentFrame()],
      self.x, self.y, 0, scaleX, 1, self.width/2, self.height/2
   )
   love.graphics.setColor(1,1,1,1)
end

function IceGoblin.updateAll(dt)
   for i,instance in ipairs(ActiveIceGoblins) do
      instance:update(dt)
   end
end

function IceGoblin.drawAll()
   for i,instance in ipairs(ActiveIceGoblins) do
      instance:draw()
   end
end

function IceGoblin.beginContact(a, b, collision)
   for i,instance in ipairs(ActiveIceGoblins) do
      if a == instance.physics.fixture or b == instance.physics.fixture then
         if a == Player.character.fixture or b == Player.character.fixture then
            Player:takeDamage(instance.damage)
         end
         instance:increaseSpeed()
         instance:flipDirection()
      end
   end
end

return IceGoblin