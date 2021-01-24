
local Map = {}

function Map:load()
   self.currentLevel = 1
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
      self:spawnBreakables()
      self:spawnObjects()
      self:spawnSpikes()
      self:spawnKeyLock()
      self:spawnPowerups()
      self:levelKeyLockSpawn()
   end
end

function Map:backGround()
   if self.currentLevel >= 1 and self.currentLevel <= 4 then
      return gTextures.forest
   end
end

function Map:levelKeyLockSpawn()
   if self.currentLevel >= 1 and self.currentLevel <= 3 then
      self:spawnFinish()
   end  
   if self.currentLevel == 4 then
      self:spawnKeyLock()
   end
end

function Map:positionCamera(player, camera)
   local halfScreen =  VIRTUAL_WIDTH / 2
   
   if Player.x < (MapWidth - halfScreen) then
      boundX = math.max(0, Player.x - halfScreen)
   else
      boundX = math.min(Player.x - halfScreen, MapWidth - VIRTUAL_WIDTH)
   end
   
   Camera:setPosition(boundX, 0)
   
   BACKGROUND_SCROLL = (boundX/3) % 384
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
   -- self.level:box2d_removeLayer('entity')
   -- self.level:box2d_removeLayer('object')
   Breakable.removeAll()
   Slime.removeAll()
   Key.removeAll()
   Lock.removeAll()
   Checkpoint.removeAll()
   Finish.removeAll()
   Spike.removeAll()
   Chocolate.removeAll()
end

function Map:update(dt)
   if playing == true then
      if Player.x > MapWidth - 16 then
         self:next()
      end

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
      elseif v.type == 'player' then
         Player:load(v.x + v.width/2, v.y + v.height/2)
		end
	end
end

function Map:spawnObjects()
   for i,v in ipairs(self.objectLayer.objects) do
      if v.type == 'checkpoint' then
         Checkpoint:load(v.x + v.width/2, v.y)
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

function Map:spawnBreakables()
   for i,v in ipairs(self.objectLayer.objects) do
		if v.type == "breakable" then
         Breakable:load(v.x + v.width/2 , v.y)
		end
	end
end

function Map:spawnPowerups()
   for i,v in ipairs(self.powerupLayer.objects) do
		if v.type == "chocolate" then
         Chocolate:load(v.x + v.width/2 , v.y)
		end
	end
end

return Map
