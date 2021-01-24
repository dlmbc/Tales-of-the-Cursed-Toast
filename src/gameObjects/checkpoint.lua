local Checkpoint = {}
Checkpoint.__index = Checkpoint

local ActiveCheckpoints = {}

function Checkpoint:load(x, y)
   local self = setmetatable({}, Checkpoint)
   self.x = x
   self.y = y

   self.startX = self.x
   self.startY = self.y

   self.img = gTextures.checkpoint
   self.width = self.img:getWidth()
   self.height = self.img:getHeight()

   self.touched = false

   self.physics = {}
   self.physics.body = love.physics.newBody(World, self.x, self.y, "static")
   self.physics.shape = love.physics.newRectangleShape(self.width, self.height)
   self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)

   self.physics.fixture:setSensor(true)

   table.insert(ActiveCheckpoints, self)
end

function Checkpoint:remove()
    for i,instance in ipairs(ActiveCheckpoints) do
       if instance == self then
          self.physics.body:setActive(false)
          table.remove(ActiveCheckpoints, i)
       end
    end
 end

function Checkpoint.removeAll()
   for i,v in ipairs(ActiveCheckpoints) do
      v.physics.body:setActive(false)
   end

   ActiveCheckpoints = {}
end

function Checkpoint:update(dt)
    self:checkNumber()
end

function Checkpoint:checkNumber()
    if #ActiveCheckpoints > 1 then
        self:remove()
    end
end

function Checkpoint:draw()
   love.graphics.draw(self.img, self.x - self.width/2, self.y - self.height/2)
end

function Checkpoint.updateAll(dt)
   for i, instance in ipairs(ActiveCheckpoints) do
      instance:update(dt)
   end
end

function Checkpoint.drawAll()
   for i, instance in ipairs(ActiveCheckpoints) do
      instance:draw()
   end
end

function Checkpoint.beginContact(a, b, collision)
   for i, instance in ipairs(ActiveCheckpoints) do
      if a == instance.physics.fixture or b == instance.physics.fixture then
         if a == Player.character.fixture or b == Player.character.fixture then
            instance.physics.fixture:setMask(1)
            Player.startX = instance.x + 20
            Player.startY = instance.y
            instance.touched = true
            return true
         end
      end
   end
end

return Checkpoint
