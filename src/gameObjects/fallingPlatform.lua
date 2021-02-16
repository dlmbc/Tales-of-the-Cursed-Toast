local FallingPlatform = {}
FallingPlatform.__index = FallingPlatform

local ActiveFallingPlatforms = {}
local InactiveFallingPlatform = {}

function FallingPlatform:load(x, y)
   local self = setmetatable({}, self)
   self.x = x
   self.y = y
   
   self.startX = self.x
   self.startY = self.y

   self.img = gTextures.platform
   self.width = 16
   self.height = 8

   self.dy = 0

   self.toBeRemoved = false

   self.physics = {}
   self.physics.body = love.physics.newBody(World, self.x, self.y, "kinematic")
   self.physics.shape = love.physics.newRectangleShape(self.width, self.height)
   self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)

   table.insert(ActiveFallingPlatforms, self)
end

function FallingPlatform:remove()
   for i, instance in ipairs(ActiveFallingPlatforms) do
      if instance == self then
         self.physics.body:setActive(false)
         table.remove(ActiveFallingPlatforms, i)
      end
   end
end

function FallingPlatform.removeAll()
   for i,v in ipairs(ActiveFallingPlatforms) do
      v.physics.body:setActive(false)
   end

   ActiveFallingPlatforms = {}
end

function FallingPlatform:update(dt)
   self:syncPhysics()
end

function FallingPlatform:syncPhysics()
   self.x, self.y = self.physics.body:getPosition()
   if self.toBeRemoved then
      if self.y > MapHeight or Player.y > MapHeight then
         self:respawnFallingPlatform() -- reset postion and set y velocity to 0
         self.dy = 0
      end
   end
   self.physics.body:setLinearVelocity(0, self.dy)
end

function FallingPlatform:respawnFallingPlatform()
   self.physics.body:setPosition(self.startX, self.startY)
   self.physics.body:setActive(true)
end

function FallingPlatform:draw()
   love.graphics.draw(self.img, gFrames.platform[_platform], self.x - self.width/2, self.y - self.height/2)
end

function FallingPlatform.updateAll(dt)
   for i, instance in ipairs(ActiveFallingPlatforms) do
      instance:update(dt)
   end
end

function FallingPlatform.drawAll()
   for i, instance in ipairs(ActiveFallingPlatforms) do
      instance:draw()
   end
end

function FallingPlatform.beginContact(a, b, collision)
   for i, instance in ipairs(ActiveFallingPlatforms) do
      if a == instance.physics.fixture or b == instance.physics.fixture then
         if a == Player.character.fixture or b == Player.character.fixture then
            instance.toBeRemoved = true
            instance.dy = 25 -- if player hits falling platform set dy to 25
            return true
         end
      end
   end
end

return FallingPlatform
