local StrawBerry = {}
StrawBerry.__index = StrawBerry

local ActiveStrawBerrys = {}

function StrawBerry:load(x, y)
   local self = setmetatable({}, StrawBerry)
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

   table.insert(ActiveStrawBerrys, self)
end

function StrawBerry:remove()
   for i,instance in ipairs(ActiveStrawBerrys) do
      if instance == self then
         self.physics.body:setActive(false)
         table.remove(ActiveStrawBerrys, i)
      end
   end
end

function StrawBerry.removeAll()
   for i,v in ipairs(ActiveStrawBerrys) do
      v.physics.body:setActive(false)
   end

   ActiveStrawBerrys = {}
end

function StrawBerry:resetPosition()
   self.physics.body:setPosition(self.startX, self.startY)
end

function StrawBerry:update(dt)
   self:checkRemove()
   self:checkNumber()
end

function StrawBerry:checkNumber()
   if #ActiveStrawBerrys > 1 then
      self:remove()
   end
end

function StrawBerry:checkRemove()
   if self.toBeRemoved then
      self:remove()
   end
end

function StrawBerry:draw()
   love.graphics.draw(gTextures.strawBerry, self.x, self.y, 0, 1, 1, self.width / 2, self.height/2)
end

function StrawBerry.updateAll(dt)
   for i,instance in ipairs(ActiveStrawBerrys) do
      instance:update(dt)
   end
end

function StrawBerry.drawAll()
   for i,instance in ipairs(ActiveStrawBerrys) do
      instance:draw()
   end
end

function StrawBerry.beginContact(a, b, collision)
   for i,instance in ipairs(ActiveStrawBerrys) do
      if a == instance.physics.fixture or b == instance.physics.fixture then
         if a == Player.character.fixture or b == Player.character.fixture then
            if GUI.strawBerryNum == 0 then
               instance.toBeRemoved = true
               GUI.isDisplayStrawBerry = true
               GUI.strawBerryNum = 1
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

return StrawBerry