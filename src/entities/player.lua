local Player = {}

function Player:load(x, y)
   -- starting position
   self.x = x
   self.y = y

   -- starting position when player falls/died
   self.startX = self.x
   self.startY = self.y

   -- dimensions
   self.width = 16
   self.height = 16

   -- physics
   self.dx = 0
   self.dy = 0
   self.maxSpeed = 120
   self.acceleration = 1000
   self.friction = 1000
   self.gravity = 900
   self.jumpAmount = -300

   -- health bar
   self.health = {
      current = 3, 
      max = 3
   }

   -- normal color
   self.color = {
      red = 1,
      green = 1,
      blue = 1,
      speed = 10
   }

   self.graceTime = 0
   self.graceDuration = 0.1

   self.isVulnerable = true
   self.alive = true
   self.grounded = false
   self.hasDoubleJump = true

   self.direction = 'right'
   self.state = 'idle'

   -- load the animations
   self:loadAssets()

   self.character = {}
   self.character.body = love.physics.newBody(World, self.x, self.y, 'dynamic')
   self.character.body:setFixedRotation(true)
   self.character.shape = love.physics.newRectangleShape(self.width * 0.5, self.height * 0.85)
   self.character.fixture = love.physics.newFixture(self.character.body, self.character.shape)
   self.character.body:setGravityScale(1)
end

--[[
   this is for the animation 
--]]
function Player:loadAssets()
   self.animation = {state}

   self.animation.idle = Animation {
      frames = {1, 2}, 
      interval = 0.1
   }
   
   self.animation.jump = Animation {
      frames = {3, 4}, 
      interval = 0.1
   }

   self.animation.run = Animation {
      frames = {5, 6}, 
      interval = 0.1
   }

   self.currentAnimation = self.animation[self.state]
end

function Player:takeDamage(amount)
   if self.isVulnerable == true then
      self:tintRed()
      if self.health.current - amount > 0 then
         if SFX_play == true then
            gSounds.hit:play()
         else
            gSounds.hit:stop()
         end

         self.health.current = self.health.current - amount
      else
         self.health.current = 0
         self:die()
      end
   end
end

function Player:die()
   self.alive = false
   self.isVulnerable = true
   GUI.isDisplay = false
   GUI.keyNum = 0
   GUI.lockNum = 0
end

function Player:respawn()
   if not self.alive then
      self:resetPosition()
      self.health.current = self.health.max
      self.alive = true
      Map:spawnKeyLock()
   end
end

function Player:resetPosition()
   self.character.body:setPosition(self.startX, self.startY)
   print(GUI.keyNum, GUI.lockNum)
end

function Player:tintRed()
   self.color.green = 0
   self.color.blue = 0
end

function Player:update(dt)
   if playing == true then
      self:unTint(dt)
      self:respawn()
      self:setState()
      self:move(dt)
      self:setDirection()
      self.currentAnimation:update(dt)
      self:decreaseGraceTime(dt)
      self:syncPhysics()
      self:applyGravity(dt)
      self:jump()
      self:selectPowerUp()
      Timer.update(dt)
   end
end

function Player:selectPowerUp()
   if love.keyboard.wasPressed('l') then
      GUI.highlighted = GUI.highlighted == 1 and 2 or 1
   end

   if love.keyboard.wasPressed('k') then
      if GUI.highlighted == 1 and GUI.isDisplayChocolate == true then
         if SFX_play == true then
            gSounds.power_up:play()
         else
            gSounds.power_up:stop()
         end

         GUI.isDisplayChocolate = false
         GUI.chocoNum = 0
         self.isVulnerable = false
         if self.isVulnerable == false then
            Timer.after(3, function() self.isVulnerable = true end)
         end
         
         if GUI.chocoNum == 0 then
            Map:spawnPowerups()
         end

      elseif GUI.highlighted == 2 and GUI.isDisplayStrawBerry == true then
         if SFX_play == true then
            gSounds.power_up:play()
         else
            gSounds.power_up:stop()
         end

         GUI.isDisplayStrawBerry = false
         GUI.strawBerryNum = 0
         if self.health.current ~= self.health.max then
            self.health.current = self.health.current + 1
         end

         if GUI.strawBerryNum == 0 then
            Map:spawnPowerups()
         end
      end
   end
end

function Player:unTint(dt)
   self.color.red = math.min(self.color.red + self.color.speed * dt, 1)
   self.color.green = math.min(self.color.green + self.color.speed * dt, 1)
   self.color.blue = math.min(self.color.blue + self.color.speed * dt, 1)
end

function Player:setState()
   if not self.grounded then
      self.state = 'jump'
      self.currentAnimation = self.animation[self.state]
   elseif self.dx == 0 then
      self.state = 'idle'
      self.currentAnimation = self.animation[self.state]
   else
      self.state = 'run'
      self.currentAnimation = self.animation[self.state]
   end
end

function Player:setDirection()
   if self.dx < 0 then
      self.direction = 'left'
   elseif self.dx > 0 then
      self.direction = 'right'
   end
end

function Player:decreaseGraceTime(dt)
   if not self.grounded then
      self.graceTime = self.graceTime - dt
   end
end

function Player:applyGravity(dt)
   if not self.grounded then
      self.dy = self.dy + self.gravity * dt
   end
end

function Player:move(dt)
   local windFriction = 0
   if Map.currentLevel == 6 or Map.currentLevel == 7 then
      windFriction = Snow.wind * 8
   end

   if love.keyboard.isDown('d') then
      self.dx = math.min(self.dx + self.acceleration * dt, self.maxSpeed + windFriction)
   elseif love.keyboard.isDown('a') then
      self.dx = math.max(self.dx - self.acceleration * dt, -self.maxSpeed + windFriction)
   else
      self:applyFriction(dt)
   end
end

function Player:applyFriction(dt)
   if self.dx > 0 then
      self.dx = math.max(self.dx - self.friction * dt, 0)
   elseif self.dx < 0 then
      self.dx = math.min(self.dx + self.friction * dt, 0)
   end
end

function Player:syncPhysics()
   self.x, self.y = self.character.body:getPosition()
   self.character.body:setLinearVelocity(self.dx, self.dy)
end

function Player:beginContact(a, b, collision)
   if self.grounded == true then return end
   local nx, ny = collision:getNormal()
   if a == self.character.fixture then
      if ny > 0 then
         self:land(collision)
      elseif ny < 0 then
         self.dy = 0
      end
   elseif b == self.character.fixture then
      if ny < 0 then
         self:land(collision)
      elseif ny > 0 then
         self.dy = 0
      end
   end
end

function Player:land(collision)
   self.currentGroundCollision = collision
   self.dy = 0
   self.grounded = true
   self.hasDoubleJump = true
   self.graceTime = self.graceDuration
end

function Player:jump()
   if love.keyboard.wasPressed('j') then
      if self.grounded or self.graceTime > 0 then
         self.dy = self.jumpAmount
         self.graceTime = 0
         if SFX_play == true then
            gSounds.jump:play()
         else
            gSounds.jump:stop()
         end

      elseif self.hasDoubleJump then
         self.hasDoubleJump = false
         self.dy = self.jumpAmount * 0.8
         if SFX_play == true then
            gSounds.jump:play()
         else
            gSounds.jump:stop()
         end
      end
   end
end

function Player:endContact(a, b, collision)
   if a == self.character.fixture or b == self.character.fixture then
      if self.currentGroundCollision == collision then
         self.grounded = false
      end
   end
end

function Player:draw()
   local scaleX = 1
   
   if self.direction == 'left' then
      scaleX = -1
   end

   if self.isVulnerable == true then
      love.graphics.setColor(self.color.red, self.color.green, self.color.blue)
         love.graphics.draw(
            gTextures.toast, gFrames.toast[self.currentAnimation:getCurrentFrame()],
            self.x, self.y, 0, scaleX, 1, self.width/2, self.height/2
         )
      love.graphics.setColor(1,1,1,1)
   elseif self.isVulnerable == false then
      love.graphics.setColor(0.17, 0.54, 0.71)
         love.graphics.circle('line', self.x, self.y, 10)
      love.graphics.setColor(1,1,1,1)
      love.graphics.draw(
         gTextures.toast, gFrames.toast[self.currentAnimation:getCurrentFrame()],
         self.x, self.y, 0, scaleX, 1, self.width/2, self.height/2
      )
   end

   love.graphics.setShader()
end

return Player