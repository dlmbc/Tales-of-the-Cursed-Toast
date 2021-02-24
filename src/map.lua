local Map = {}

function Map:load()
   self.currentLevel = 1

   if loaded == true then
      self:loadGame()
   end

   World = love.physics.newWorld(0,2000)
   World:setCallbacks(beginContact, endContact)

   self:init()
end

function Map:init()
   self.level = STI("src/map/levels/"..self.currentLevel..".lua", {"box2d"})

   self.level:box2d_init(World)
   self.entityLayer = self.level.layers.entity
   self.objectLayer = self.level.layers.object
   self.powerupLayer = self.level.layers.powerup

   MapWidth = self.level.width * self.level.tilewidth
   MapHeight = self.level.height * self.level.tileheight

   if playing == true then
      self:spawnEntities()
      self:spawnFallingPlatform()
      self:spawnObjects()
      self:spawnSpikes()
      self:spawnKeyLock()
      self:spawnPowerups()
      self:levelKeyLockSpawn()
   end
end

function Map:backGround()
   if self.currentLevel >= 1 and self.currentLevel <= 4 then
      _platform = 1
      return gTextures.forest

   elseif self.currentLevel >= 5 and self.currentLevel <= 8 then
      _platform = 2
      return gTextures.mountain

   elseif self.currentLevel >= 9 and self.currentLevel <= 12 then
      _platform = 3
      return gTextures.cave

   else
      _platform = 4
      return gTextures.kitchen
   end
end

function Map:levelKeyLockSpawn()
   if self.currentLevel >= 1 and self.currentLevel <= 3 or
      self.currentLevel >= 5 and self.currentLevel <= 7 or
      self.currentLevel >= 9 and self.currentLevel <= 11 then
         self:spawnFinish()
   end  

   if self.currentLevel == 4 and self.currentLevel == 8 and self.currentLevel == 12 then
      self:spawnKeyLock()
   end
end

function Map:positionCamera(player, camera)
   local halfScreen =  VIRTUAL_WIDTH / 2
   local halfHeight = VIRTUAL_HEIGHT / 2

   if (self.currentLevel >= 1 and self.currentLevel <= 4) or 
      (self.currentLevel == 6 or self.currentLevel == 7) or
      (self.currentLevel >= 9 and self.currentLevel <= 12) or 
      (self.currentLevel == 13) then
      
         if Player.x < (MapWidth - halfScreen) then
         boundX = math.max(0, Player.x - halfScreen)
      else
         boundX = math.min(Player.x - halfScreen, MapWidth - VIRTUAL_WIDTH)
      end
   
      Camera:setPosition(boundX, 0)
      BACKGROUND_SCROLL = (boundX / 3) % 384

   elseif self.currentLevel == 5 or self.currentLevel == 8 then
      if Player.y < (MapHeight - halfHeight) then
         boundY = math.max(0, Player.y - halfHeight)
      else
         boundY = math.min(Player.y - halfHeight, MapHeight - VIRTUAL_HEIGHT)
      end
   
      Camera:setPosition(0, boundY)
   end
end

function Map:next()
   self:clean()
   self.currentLevel = self.currentLevel + 1
   self:init()

   GUI.isDisplay = false
   GUI.keyNum = 0
   GUI.lockNum = 0
   GUI.flagNum = 0

   Player:resetPosition()
end

function Map:clean()
   self.level:box2d_removeLayer("solid")
   Slime.removeAll()
   Mushroom.removeAll()
   IceGoblin.removeAll()
   Rock.removeAll()

   FallingPlatform.removeAll()
   Mail.removeAll()
   Key.removeAll()
   Lock.removeAll()
   Checkpoint.removeAll()
   Finish.removeAll()
   Spike.removeAll()
   Chocolate.removeAll()
   StrawBerry.removeAll()
   Collider.removeAll()
end

function Map:update(dt)
   if playing == true then
      if Player.y > MapHeight then
         Player:die()

         self:spawnKeyLock()
         self:spawnObjects()
      end

      if GUI.flagNum == 1 then
         self:next()
      end

      if GUI.lockNum == 1 then
         self:spawnFinish()
      end
   end
end

function Map:spawnEntities()
	for i,v in ipairs(self.entityLayer.objects) do
		if v.type == "slime" then
         Slime:load(v.x + v.width / 2, v.y + v.height / 2)
      elseif v.type =='mushroom' then
         Mushroom:load(v.x + v.width / 2, v.y + v.height/2)
      elseif v.type =='iceGoblin' then
         IceGoblin:load(v.x + v.width / 2, v.y + v.height/2)
      elseif v.type =='rock' then
         Rock:load(v.x + v.width / 2, v.y + v.height/2)
      elseif v.type == 'player' then
         Player:load(v.x + v.width/2, v.y + v.height/2)
		end
	end
end

function Map:spawnObjects()
   for i,v in ipairs(self.objectLayer.objects) do
      if v.type == 'checkpoint' then
         Checkpoint:load(v.x + v.width/2, v.y)
      elseif v.type == 'collider' then
         Collider:load(v.x + v.width/2, v.y)
      elseif self.currentLevel == 13 then
         if v.type == 'mail' then
            Mail:load(v.x + v.width/2, v.y + v.height/2)
         end
      end
	end
end

function Map:spawnFinish()
   for i,v in ipairs(self.objectLayer.objects) do
      if v.type == "flag" then
         Finish:load(v.x + v.width/2, v.y)
		end
	end
end

function Map:spawnKeyLock()
   for i,v in ipairs(self.objectLayer.objects) do
      if v.type == 'lock' then
         Lock:load(v.x, v.y)
      elseif v.type == "key" then
         Key:load(v.x + v.width/2, v.y + v.height/2)
		end
	end
end

function Map:spawnSpikes()
   for i,v in ipairs(self.objectLayer.objects) do
		if v.type == "spike" then
         Spike:load(v.x + v.width/2 , v.y + v.height/1.5)
		end
	end
end

function Map:spawnFallingPlatform()
   for i,v in ipairs(self.objectLayer.objects) do
		if v.type == "breakable" then
         FallingPlatform:load(v.x + v.width/2 , v.y)
		end
	end
end

function Map:spawnPowerups()
   for i,v in ipairs(self.powerupLayer.objects) do
		if v.type == "chocolate" then
         Chocolate:load(v.x + v.width/2 , v.y)
      elseif v.type == 'strawberry' then
         StrawBerry:load(v.x + v.width/2 , v.y)
		end
	end
end

function Map:saveGame()
   self.data = {}
   self.data.lvl = {
      levels = self.currentLevel
   }

   -- serialize the current level
   self.savedGame = Serialize(self.data)
   love.filesystem.write('level.txt', self.savedGame)
end

function Map:loadGame()
   -- load the serialize level
   if love.filesystem.getInfo('level.txt') then
      file = love.filesystem.read('level.txt')
      data = setfenv(loadstring(file), {})()

      self.currentLevel = data.lvl.levels
   end
end

return Map
