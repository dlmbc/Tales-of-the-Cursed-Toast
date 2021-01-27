local Lock = {}
Lock.__index = Lock

local ActiveLocks = {}

function Lock:load(x, y)
   local self = setmetatable({}, Lock)
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

   table.insert(ActiveLocks, self)
end

function Lock:remove()
   for i,instance in ipairs(ActiveLocks) do
      if instance == self then
         self.physics.body:setActive(false)
         table.remove(ActiveLocks, i)
      end
   end
end

function Lock.removeAll()
   for i,v in ipairs(ActiveLocks) do
      v.physics.body:setActive(false)
   end

   ActiveLocks = {}
end

function Lock:update(dt)
   self:checkRemove()
   self:checkNumber()
end

function Lock:checkNumber()
   if #ActiveLocks > 1 then
      self:remove()
   end
end

function Lock:checkRemove()
   if self.toBeRemoved then
      self:remove()
   end
end

function Lock:draw()
   love.graphics.draw(gTextures.keyLock, gFrames.keyLock[2], self.x, self.y, 0, 1, 1, self.width / 2, self.height/2)
end

function Lock.updateAll(dt)
   for i,instance in ipairs(ActiveLocks) do
      instance:update(dt)
   end
end

function Lock.drawAll()
   for i,instance in ipairs(ActiveLocks) do
      instance:draw()
   end
end

function Lock.beginContact(a, b, collision)
   for i,instance in ipairs(ActiveLocks) do
      if a == instance.physics.fixture or b == instance.physics.fixture then
         if a == Player.character.fixture or b == Player.character.fixture then
            if GUI.keyNum == 1 then
                instance.toBeRemoved = true
                GUI.lockNum = 1
                return true
            else
                instance.toBeRemoved = false
                return false
            end
         end
      end
   end
end

return Lock