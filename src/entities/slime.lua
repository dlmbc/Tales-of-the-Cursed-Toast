local Slime = {}
Slime.__index = Slime

local ActiveSlime = {}

function Slime:load(x, y)
   local self = setmetatable({}, Slime)
   self.x = x
   self.y = y

   self.width = 16
   self.height = 13

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
    
   table.insert(ActiveSlime, self)
end

function Slime:loadAssets()
   self.animation = {state}

   self.animation.walk = Animation {
      frames = {1,2,3},
      interval = 0.1,
      width = self.width,
      height = self.width
   }

   self.animation.run = Animation {
      frames = {1,2,3},
      interval = 0.1,
      width = self.width,
      height = self.width
   }

   self.currentAnimation = self.animation[self.state]
end

function Slime.removeAll()
   for i,v in ipairs(ActiveSlime) do
      v.physics.body:destroy()
   end

   ActiveSlime = {}
end

function Slime:changeColor()
    self.color.blue = 0
    self.color.green = 0
end

function Slime:increaseSpeed()
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

function Slime:normalColor(dt)
   self.color.red = math.min(self.color.red + self.color.speed * dt, 1)
   self.color.green = math.min(self.color.green + self.color.speed * dt, 1)
   self.color.blue = math.min(self.color.blue + self.color.speed * dt, 1)
end

function Slime:update(dt)
   if playing == true then
      self:syncPhysics()
      self.currentAnimation:update(dt)
      self:normalColor(dt)
   end
end

function Slime:flipDirection()
   self.dx = -self.dx
end

function Slime:syncPhysics()
   self.x, self.y = self.physics.body:getPosition()
   self.physics.body:setLinearVelocity(self.dx * self.speedMod, 100)
end

function Slime:draw()
   local scaleX = 1
   if self.dx < 0 then
      scaleX = -1
   end
   love.graphics.setColor(self.color.blue, self.color.red, self.color.green)
   love.graphics.draw(
      gTextures.slime, gFrames.slime[self.currentAnimation:getCurrentFrame()],
      self.x, self.y, 0, scaleX, 1, self.currentAnimation.width/2, self.currentAnimation.height/2
   )
   love.graphics.setColor(1,1,1,1)
end

function Slime.updateAll(dt)
   for i,instance in ipairs(ActiveSlime) do
      instance:update(dt)
   end
end

function Slime.drawAll()
   for i,instance in ipairs(ActiveSlime) do
      instance:draw()
   end
end

function Slime.beginContact(a, b, collision)
   for i,instance in ipairs(ActiveSlime) do
      if a == instance.physics.fixture or b == instance.physics.fixture then
         if a == Player.character.fixture or b == Player.character.fixture then
            Player:takeDamage(instance.damage)
         end
         instance:increaseSpeed()
         instance:flipDirection()
      end
   end
end

return Slime