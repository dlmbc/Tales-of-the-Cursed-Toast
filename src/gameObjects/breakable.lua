local Breakable = {}
Breakable.__index = Breakable

local ActiveBreakables = {}

function Breakable.new(x, y)
   local instance = setmetatable({}, Breakable)
   instance.x = x
   instance.y = y
   instance.startX = instance.x
   instance.startY = instance.y
   instance.img = love.graphics.newImage("graphics/brokenDirt.png")
   instance.width = instance.img:getWidth()
   instance.height = instance.img:getHeight()
   instance.scaleX = 1
   instance.toBeRemoved = false
   instance.destroyed = false

   instance.timerRemove = 0
   instance.countRemove = 1
   instance.countdowntimeRemove = 0.75

   instance.physics = {}
   instance.physics.body = love.physics.newBody(World, instance.x, instance.y, "static")
   instance.physics.shape = love.physics.newRectangleShape(instance.width, instance.height)
   instance.physics.fixture = love.physics.newFixture(instance.physics.body, instance.physics.shape)
   
   table.insert(ActiveBreakables, instance)
end

function Breakable:remove()
   for i, instance in ipairs(ActiveBreakables) do
      if instance == self then
         self.physics.body:setActive(false)
         self.destroyed = true
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

function Breakable:countDownRemove(dt)
    self.timerRemove = self.timerRemove + dt
    if self.timerRemove > self.countdowntimeRemove then
        self.timerRemove = self.timerRemove % self.countdowntimeRemove
        self.countRemove = self.countRemove - 1

        if self.countRemove == 0 then
            self:remove()
        end
    end
end

function Breakable:update(dt)
   self:checkRemove(dt)
end

function Breakable:checkRemove(dt)
   if self.toBeRemoved then
      self:countDownRemove(dt)
   end
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
   for i,instance in ipairs(ActiveBreakables) do
      instance:draw()
   end
end

function Breakable.beginContact(a, b, collision)
   for i,instance in ipairs(ActiveBreakables) do
      if a == instance.physics.fixture or b == instance.physics.fixture then
         if a == Player.physics.fixture or b == Player.physics.fixture then
            instance.toBeRemoved = true
            return true
         end
      end
   end
end

return Breakable
