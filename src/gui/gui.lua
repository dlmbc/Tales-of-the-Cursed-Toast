local GUI = {}

function GUI:load()
   self.key = {}
   self.hearts = {}
   self.powerup = {}

   self.isDisplay = false
   self.isDisplayChocolate = false
   self.keyNum = 0
   self.lockNum = 0
   self.flagNum = 0
   self.chocoNum = 0
   self.cheeseNum = 0

   self.powerup.x = 150
   self.powerup.y = 5

   self.key.x = 100
   self.key.y = 5

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
   self:displayPowerUps()
   self:displayLevel()
   self:displayFPS()
end

function GUI:displayHearts()
   for i = 1,Player.health.current do
      local x = self.hearts.x + self.hearts.spacing * i
      love.graphics.draw(self.hearts.img, x, self.hearts.y)
   end
end

function GUI:displayKey()
   if self.isDisplay == true then
      love.graphics.draw(gTextures.keyLock, gFrames.keyLock[1], self.key.x, self.key.y)
   end
end

function GUI:displayPowerUps()
   if self.isDisplayChocolate == true then
      love.graphics.draw(gTextures.chocolate, gFrames.chocolate[1], self.powerup.x, self.powerup.y)
   end

   if Player.highlighted == 1 then
      love.graphics.setColor(0.95, 0, 0, 1)
   end
      love.graphics.rectangle('line', 150, 5, 16, 16)
      love.graphics.setColor(1, 1, 1, 1)

   if Player.highlighted == 2 then
      love.graphics.setColor(0.78, 0, 0, 1)
   end
      love.graphics.rectangle('line', 175, 5, 16, 16)
      love.graphics.setColor(1, 1, 1, 1)
end

function GUI:displayLevel()
   love.graphics.setFont(small)
   if Map.currentLevel >= 5 and Map.currentLevel <= 8 then
      love.graphics.setColor(0, 0, 0, 1)
   elseif (Map.currentLevel >= 1 and Map.currentLevel <= 4) or 
         Map.currentLevel >= 9 and Map.currentLevel <= 12 then
      love.graphics.setColor(1, 1, 1, 1)
   end
   love.graphics.print("Level: " .. Map.currentLevel, VIRTUAL_WIDTH - 150, 10)
end

function GUI:displayFPS()
   love.graphics.setFont(small)
   if Map.currentLevel >= 5 and Map.currentLevel <= 8 then
      love.graphics.setColor(0, 0, 0, 1)
   elseif (Map.currentLevel >= 1 and Map.currentLevel <= 4) or 
         Map.currentLevel >= 9 and Map.currentLevel <= 12 then
      love.graphics.setColor(1, 1, 1, 1)
   end
   love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), VIRTUAL_WIDTH - 90, 10)
end

return GUI