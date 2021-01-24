local Chocolate = {}
Chocolate.__index = Chocolate

local ActiveChocolates = {}

function Chocolate:load(x, y)
   local self = setmetatable({}, Chocolate)
   self.x = x
   self.y = y
   
   self.startX = self.x
   self.startY = self.y 
   
   self.width = 16
   self.height = 16
   
   self.toBeRemoved = false

   self.physics = {}
   self.physics.body = love.physics.newBody(World, self.x, self.y, "static")
   self.physics.shape = love.physics.newRectangleShape(self.width, self.height)
   self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)
   self.physics.fixture:setSensor(true)

   table.insert(ActiveChocolates, self)
end

function Chocolate:remove()
   for i,instance in ipairs(ActiveChocolates) do
      if instance == self then
         self.physics.body:setActive(false)
         table.remove(ActiveChocolates, i)
      end
   end
end

function Chocolate.removeAll()
   for i,v in ipairs(ActiveChocolates) do
      v.physics.body:setActive(false)
   end

   ActiveChocolates = {}
end

function Chocolate:resetPosition()
   self.physics.body:setPosition(self.startX, self.startY)
end

function Chocolate:update(dt)
   self:checkRemove()
   self:checkNumber()
end

function Chocolate:checkNumber()
   if #ActiveChocolates > 1 then
      self:remove()
   end
end

function Chocolate:checkRemove()
   if self.toBeRemoved then
      self:remove()
   end
end

function Chocolate:draw()
   love.graphics.draw(gTextures.chocolate, gFrames.chocolate[1], self.x, self.y, 0, 1, 1, self.width / 2, self.height/2)
end

function Chocolate.updateAll(dt)
   for i,instance in ipairs(ActiveChocolates) do
      instance:update(dt)
   end
end

function Chocolate.drawAll()
   for i,instance in ipairs(ActiveChocolates) do
      instance:draw()
   end
end

function Chocolate.beginContact(a, b, collision)
   for i,instance in ipairs(ActiveChocolates) do
      if a == instance.physics.fixture or b == instance.physics.fixture then
         if a == Player.character.fixture or b == Player.character.fixture then
            if GUI.chocoNum == 0 then
            instance.toBeRemoved = true
            GUI.isDisplayChocolate = true
            GUI.chocoNum = 1
            return true
            else
               instance.toBeRemoved = false
               instance.physics.fixture:setMask(1)
               return false
            end
         end
      end
   end
end

return Chocolate