local Slime = {}
Slime.__index = Slime

local ActiveSlime = {}

function Slime:load(x, y)
   local self = setmetatable({}, Slime)
   self.x = x
   self.y = y
   self.offsetY = -2

   self.speed = 100
   self.speedMod = 1
   self.xVel = self.speed

   self.speedCounter = 0
   self.speedTrigger = 3

   self.damage = 1
    
   self.color = {
      blue = 1,
      red = 1,
      green = 1,
      speed = 3
   }

   self.state = "walk"

   self:loadAssets()

   self.physics = {}
   self.physics.body = love.physics.newBody(World, self.x, self.y, "dynamic")
   self.physics.body:setFixedRotation(true)
   self.physics.body:setMass(25)
   self.physics.shape = love.physics.newRectangleShape(self.width * 0.4, self.height * 0.75)
   self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)
    
   table.insert(ActiveSlime, self)
end

function Slime:loadAssets()
   self.animation = {timer = 0, rate = 0.1}
  
   self.animation.run = {total = 3, current = 1, img = {}}
   self.animation.walk = {total = 3, current = 1, img = {}}

   for i = 1, self.animation.run.total do
      self.animation.run.img[i] = love.graphics.newImage("graphics/slime/"..i..".png")
   end

   for i = 1, self.animation.walk.total do
      self.animation.walk.img[i] = love.graphics.newImage("graphics/slime/"..i..".png")
   end
        
   self.animation.draw = self.animation.walk.img[1]
   self.width = self.animation.draw:getWidth()
   self.height = self.animation.draw:getHeight()
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
      self.state = "run"
      self.speedMod = 3
      self.speedCounter = 0
   else
      self.state = "walk"
      self.speedMod = 1
   end
end

function Slime:normalColor(dt)
   self.color.red = math.min(self.color.red + self.color.speed * dt, 1)
   self.color.green = math.min(self.color.green + self.color.speed * dt, 1)
   self.color.blue = math.min(self.color.blue + self.color.speed * dt, 1)
end

function Slime:update(dt)
    self:syncPhysics()
    self:animate(dt)
    self:normalColor(dt)
 end

function Slime:flipDirection()
   self.xVel = -self.xVel
end

function Slime:animate(dt)
   self.animation.timer = self.animation.timer + dt
   if self.animation.timer > self.animation.rate then
      self.animation.timer = 0
      self:setNewFrame()
   end
end

function Slime:setNewFrame()
   local anim = self.animation[self.state]
   if anim.current < anim.total then
      anim.current = anim.current + 1
   else
      anim.current = 1
   end
   self.animation.draw = anim.img[anim.current]
end

function Slime:syncPhysics()
   self.x, self.y = self.physics.body:getPosition()
   self.physics.body:setLinearVelocity(self.xVel * self.speedMod, 100)
end

function Slime:draw()
   local scaleX = 1
   if self.xVel < 0 then
      scaleX = -1
   end
   love.graphics.setColor(self.color.blue, self.color.red, self.color.green)
   love.graphics.draw(self.animation.draw, self.x, self.y, 0, scaleX, 1, self.width / 2, self.height / 2)
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
         if a == Player.physics.fixture or b == Player.physics.fixture then
            Player:takeDamage(instance.damage)
         end
         if a == instance.physics.fixture or b == instance.physics.fixture then
            instance:increaseSpeed()
         end
         instance:increaseSpeed()
         instance:flipDirection()
      end
   end
end

return Slime