local Mail = {}
Mail.__index = Mail

local ActiveMails = {}

function Mail:load(x, y)
   local self = setmetatable({}, Mail)
   self.x = x
   self.y = y
   
   self.startX = self.x
   self.startY = self.y 
   
   self.width = 16
   self.height = 11
   
   self.toBeRemoved = false

   self.physics = {}
   self.physics.body = love.physics.newBody(World, self.x, self.y, "static")
   self.physics.shape = love.physics.newRectangleShape(self.width, self.height)
   self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)

   table.insert(ActiveMails, self)
end

function Mail:remove()
   for i,instance in ipairs(ActiveMails) do
      if instance == self then
         self.physics.body:setActive(false)
         table.remove(ActiveMails, i)
      end
   end
end

function Mail.removeAll()
   for i,v in ipairs(ActiveMails) do
      v.physics.body:setActive(false)
   end

   ActiveMails = {}
end

function Mail:update(dt)
   self:checkRemove()
   self:checkNumber()
end

function Mail:checkNumber()
   if #ActiveMails > 1 then
      self:remove()
   end
end

function Mail:checkRemove()
   if self.toBeRemoved then
      self:remove()
   end
end

function Mail:draw()
   love.graphics.draw(gTextures.mail, self.x, self.y, 0, 1, 1, self.width / 2, self.height/2)
end

function Mail.updateAll(dt)
   for i,instance in ipairs(ActiveMails) do
      instance:update(dt)
   end
end

function Mail.drawAll()
   for i,instance in ipairs(ActiveMails) do
      instance:draw()
   end
end

function Mail.beginContact(a, b, collision)
   for i,instance in ipairs(ActiveMails) do
      if a == instance.physics.fixture or b == instance.physics.fixture then
         if a == Player.character.fixture or b == Player.character.fixture then
            instance.toBeRemoved = true
            GUI.mailNum = 1
            return true
         end
      end
   end
end

return Mail