local GUI = {}

function GUI:load()
   self.isDisplay = false

   self.key = {}
   self.key.img = love.graphics.newImage('graphics/key.png')
   self.key.width = self.key.img:getWidth()
   self.key.height = self.key.img:getHeight()
   self.key.x = VIRTUAL_WIDTH - 200
   self.key.y = 5

   self.hearts = {}
   self.hearts.img = love.graphics.newImage('graphics/heart.png')
   self.hearts.width = self.hearts.img:getWidth()
   self.hearts.height = self.hearts.img:getHeight()
   self.hearts.x = 0
   self.hearts.y = 5
   self.hearts.spacing = self.hearts.width + 5
end

function GUI:update(dt)

end

function GUI:draw()
   self:displayKey()
   self:displayHearts()
end

function GUI:displayHearts()
   for i = 1,Player.health.current do
      local x = self.hearts.x + self.hearts.spacing * i
      love.graphics.draw(self.hearts.img, x, self.hearts.y)
   end
end

function GUI:displayKey()
   if self.isDisplay == true then
      love.graphics.draw(self.key.img, self.key.x, self.key.y)
   end
end

-- function GUI:displayCoinText()
--    love.graphics.setFont(self.font)
--    local x = self.coins.x + self.coins.width * self.coins.scale
--    local y = self.coins.y + self.coins.height / 2 * self.coins.scale - self.font:getHeight() / 2
--    love.graphics.setColor(0,0,0,0.5)
--    love.graphics.print(" : "..Player.coins, x + 2, y + 2)
--    love.graphics.setColor(1,1,1,1)
--    love.graphics.print(" : "..Player.coins, x, y)
-- end

return GUI
