local Breakable = {}
Breakable.__index = Breakable

local ActiveBreakables = {}
local InactiveBreakable = {}

function Breakable:load(x, y)
   local self = setmetatable({}, self)
   self.x = x
   self.y = y
   
   self.startX = self.x
   self.startY = self.y

   self.img = love.graphics.newImage("graphics/brokenDirt.png")
   self.width = self.img:getWidth()
   self.height = self.img:getHeight()

   self.dy = 0

   self.toBeRemoved = false

   self.physics = {}
   self.physics.body = love.physics.newBody(World, self.x, self.y, "kinematic")
   self.physics.shape = love.physics.newRectangleShape(self.width, self.height)
   self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)
   -- self.physics.body:setGravityScale(1)
   table.insert(ActiveBreakables, self)
end

function Breakable:remove()
   for i, instance in ipairs(ActiveBreakables) do
      if instance == self then
         self.physics.body:setActive(false)
         table.remove(ActiveBreakables, i)
      end
   end
end

function Breakable.removeAll()
   for i,v in ipairs(ActiveBreakables) do
      v.physics.body:setActive(false)
   end

   ActiveBreakables = {}
end

function Breakable:update(dt)
   self:syncPhysics()
end

function Breakable:syncPhysics()
   self.x, self.y = self.physics.body:getPosition()
   if self.toBeRemoved then
      if self.y > MapHeight or Player.y > MapHeight then
         self:respawnBreakable()
         self.dy = 0
      end
   end
   self.physics.body:setLinearVelocity(0, self.dy)
end

function Breakable:respawnBreakable()
   self.physics.body:setPosition(self.startX, self.startY)
   print(#ActiveBreakables)
   self.physics.body:setActive(true)
end

function Breakable:draw()
   love.graphics.draw(self.img, self.x - self.width/2, self.y - self.height/2)
end

function Breakable.updateAll(dt)
   for i, instance in ipairs(ActiveBreakables) do
      instance:update(dt)
   end
end

function Breakable.drawAll()
   for i, instance in ipairs(ActiveBreakables) do
      instance:draw()
   end
end

function Breakable.beginContact(a, b, collision)
   for i, instance in ipairs(ActiveBreakables) do
      if a == instance.physics.fixture or b == instance.physics.fixture then
         if a == Player.character.fixture or b == Player.character.fixture then
            instance.toBeRemoved = true
            instance.dy = 25
            return true
         end
      end
   end
end

return Breakable
