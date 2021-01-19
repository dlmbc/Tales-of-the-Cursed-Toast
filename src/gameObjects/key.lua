local Key = {}
Key.__index = Key

local ActiveKeys = {}

function Key:load(x, y)
   local self = setmetatable({}, Key)
   self.x = x
   self.y = y
   self.image = love.graphics.newImage('graphics/key.png')
   self.startX = self.x
   self.startY = self.y
   self.width = self.image:getWidth()
   self.height = self.image:getHeight()
   
   self.toBeRemoved = false
   self.destroyed = false

   self.timer = 0
   self.count = 3
   self.countMod = 0.75

   self.physics = {}
   self.physics.body = love.physics.newBody(World, self.x, self.y, "static")
   self.physics.shape = love.physics.newRectangleShape(self.width, self.height)
   self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)
   self.physics.fixture:setSensor(true)

   table.insert(ActiveKeys, self)
end

function Key:remove()
   for i,instance in ipairs(ActiveKeys) do
      if instance == self then
         self.physics.body:setActive(false)
         self.destroyed = true
         table.remove(ActiveKeys, i)
      end
   end
end

function Key.removeAll()
   for i,v in ipairs(ActiveKeys) do
      v.physics.body:setActive(false)
      self.destroyed = true
   end

   ActiveKeys = {}
end

function Key:update(dt)
   self:checkRemove()
   self:checkNumber()
end

function Key:checkNumber()
   if #ActiveKeys > 1 then
      self:remove()
   end
end

function Key:checkRemove()
   if self.toBeRemoved then
      self:remove()
   end
end

function Key:draw()
   love.graphics.draw(self.image, self.x, self.y, 0, 1, 1, self.width / 2, self.height/2)
end

function Key.updateAll(dt)
   for i,instance in ipairs(ActiveKeys) do
      instance:update(dt)
   end
end

function Key.drawAll()
   for i,instance in ipairs(ActiveKeys) do
      instance:draw()
   end
end

function Key.beginContact(a, b, collision)
   for i,instance in ipairs(ActiveKeys) do
      if a == instance.physics.fixture or b == instance.physics.fixture then
         if a == Player.physics.fixture or b == Player.physics.fixture then
            instance.toBeRemoved = true
            GUI.isDisplay = true
            return true
         end
      end
   end
end

return Key