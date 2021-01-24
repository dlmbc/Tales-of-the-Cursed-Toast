local Spike = {}
Spike.__index = Spike

local ActiveSpike = {}

function Spike:load(x, y)
   local self = setmetatable({}, Spike)
   self.x = x
   self.y = y

   self.width = 16
   self.height = 8

   self.damage = 1

   self.physics = {}
   self.physics.body = love.physics.newBody(World, self.x, self.y, 'static')
   self.physics.shape = love.physics.newRectangleShape(self.width, self.height)
   self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)
    
   table.insert(ActiveSpike, self)
end

function Spike.removeAll()
   for i,v in ipairs(ActiveSpike) do
      v.physics.body:destroy()
   end

   ActiveSpike = {}
end

function Spike:update(dt)
  
end

function Spike:draw()
   love.graphics.draw(gTextures.spike,self.x, self.y, 0, 1, 1, self.width/2, self.height/2)
end

function Spike.updateAll(dt)
   for i,instance in ipairs(ActiveSpike) do
      instance:update(dt)
   end
end

function Spike.drawAll()
   for i,instance in ipairs(ActiveSpike) do
      instance:draw()
   end
end

function Spike.beginContact(a, b, collision)
   for i,instance in ipairs(ActiveSpike) do
      if a == instance.physics.fixture or b == instance.physics.fixture then
         if a == Player.character.fixture or b == Player.character.fixture then
            Player:takeDamage(instance.damage)
         end
      end
   end
end

return Spike