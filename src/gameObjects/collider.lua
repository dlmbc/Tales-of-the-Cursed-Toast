local Collider = {}
Collider.__index = Collider

local ActiveColliders = {}

function Collider:load(x, y)
   local self = setmetatable({}, self)
   self.x = x
   self.y = y
   
   self.startX = self.x
   self.startY = self.y

   self.width = 16
   self.height = 16

   self.physics = {}
   self.physics.body = love.physics.newBody(World, self.x, self.y, "static")
   self.physics.shape = love.physics.newRectangleShape(self.width, self.height)
   self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)
   self.physics.fixture:setSensor(true)

   table.insert(ActiveColliders, self)
end

function Collider:remove()
   for i, instance in ipairs(ActiveColliders) do
      if instance == self then
         self.physics.body:setActive(false)
         table.remove(ActiveColliders, i)
      end
   end
end

function Collider.removeAll()
   for i,v in ipairs(ActiveColliders) do
      v.physics.body:setActive(false)
   end

   ActiveColliders = {}
end

function Collider.beginContact(a, b, collision)
   for i, instance in ipairs(ActiveColliders) do
      if a == instance.physics.fixture or b == instance.physics.fixture then
         if a == Player.character.fixture or b == Player.character.fixture then
            return true
         end
      end
   end
end

return Collider