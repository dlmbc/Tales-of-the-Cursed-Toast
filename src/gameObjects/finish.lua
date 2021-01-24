local Finish = {}
Finish.__index = Finish

local ActiveFinish = {}

function Finish:load(x, y)
   local self = setmetatable({}, Finish)
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

   table.insert(ActiveFinish, self)
end

function Finish:remove()
   for i,instance in ipairs(ActiveFinish) do
      if instance == self then
         self.physics.body:setActive(false)
         table.remove(ActiveFinish, i)
      end
   end
end

function Finish.removeAll()
   for i,v in ipairs(ActiveFinish) do
      v.physics.body:setActive(false)
   end

   ActiveFinish = {}
end

function Finish:update(dt)
   self:checkRemove()
   self:checkNumber()
end

function Finish:checkNumber()
   if #ActiveFinish > 1 then
      self:remove()
   end
end

function Finish:checkRemove()
   if self.toBeRemoved then
      self:remove()
   end
end

function Finish:draw()
   love.graphics.draw(gTextures.flag, self.x, self.y, 0, 1, 1, self.width / 2, self.height/2)
end

function Finish.updateAll(dt)
   for i,instance in ipairs(ActiveFinish) do
      instance:update(dt)
   end
end

function Finish.drawAll()
   for i,instance in ipairs(ActiveFinish) do
      instance:draw()
   end
end

function Finish.beginContact(a, b, collision)
   for i,instance in ipairs(ActiveFinish) do
      if a == instance.physics.fixture or b == instance.physics.fixture then
         if a == Player.character.fixture or b == Player.character.fixture then
                instance.toBeRemoved = true
                GUI.flagNum = 1
               return true
         end
      end
   end
end

return Finish