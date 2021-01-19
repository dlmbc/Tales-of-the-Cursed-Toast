local Player = {}

function Player:load(x, y)
   -- starting position
   self.x = x
   self.y = y

   -- starting position when player falls
   self.startX = self.x
   self.startY = self.y

   -- dimensions
   self.width = 16
   self.height = 16

   -- physics
   self.dx = 0
   self.dy = 0
   self.maxSpeed = 105
   self.acceleration = 1000
   self.friction = 400
   self.gravity = 900
   self.jumpAmount = -250

   self.health = {current = 3, max = 3}

   self.color = {
      red = 1,
      green = 1,
      blue = 1,
      speed = 3,
   }

   self.graceTime = 0
   self.graceDuration = 0.1

   self.alive = true
   self.grounded = false
   self.hasDoubleJump = true

   self.direction = 'right'
   self.state = 'idle'

   self:loadAssets()

   self.character = {}
   self.character.body = love.physics.newBody(World, self.x, self.y, "dynamic")
   self.character.body:setFixedRotation(true)
   self.character.shape = love.physics.newRectangleShape(self.width * 0.5, self.height * 0.85)
   self.character.fixture = love.physics.newFixture(self.character.body, self.character.shape)
   self.character.body:setGravityScale(0)
end

function Player:loadAssets()
   self.animation = {state}

   self.animation.idle = Animation {
      frames = {1, 2}, 
      interval = 0.1,
      width = self.width,
      height = self.height
   }
   
   self.animation.run = Animation {
      frames = {7, 8}, 
      interval = 0.1,
      width = self.width,
      height = self.height
   }
   
   self.animation.jump = Animation {
      frames = {4, 5, 6}, 
      interval = 0.1,
      width = self.width,
      height = self.height
   }

   self.currentAnimation = self.animation[self.state]
end

function Player:takeDamage(amount)
   self:tintRed()
   if self.health.current - amount > 0 then
      self.health.current = self.health.current - amount
   else
      self.health.current = 0
      self:die()
   end
end

function Player:die()
   self.alive = false
   GUI.isDisplay = false
end

function Player:respawn()
   if not self.alive then
      self:resetPosition()
      self.health.current = self.health.max
      self.alive = true
      Map:spawObjects()
   end
end

function Player:resetPosition()
   self.character.body:setPosition(self.startX, self.startY)
end

function Player:tintRed()
   self.color.green = 0
   self.color.blue = 0
end

function Player:update(dt)
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
end

function Player:unTint(dt)
   self.color.red = math.min(self.color.red + self.color.speed * dt, 1)
   self.color.green = math.min(self.color.green + self.color.speed * dt, 1)
   self.color.blue = math.min(self.color.blue + self.color.speed * dt, 1)
end

function Player:setState()
   if not self.grounded then
      self.state = "jump"
      self.currentAnimation = self.animation[self.state]
   elseif self.dx == 0 then
      self.state = "idle"
      self.currentAnimation = self.animation[self.state]
   else
      self.state = "run"
      self.currentAnimation = self.animation[self.state]
   end
end

function Player:setDirection()
   if self.dx < 0 then
      self.direction = "left"
   elseif self.dx > 0 then
      self.direction = "right"
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
   if love.keyboard.isDown("d") then
      self.dx = math.min(self.dx + self.acceleration * dt, self.maxSpeed)
   elseif love.keyboard.isDown("a") then
      self.dx = math.max(self.dx - self.acceleration * dt, -self.maxSpeed)
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
         gSounds.jump:play()
      elseif self.hasDoubleJump then
         self.hasDoubleJump = false
         self.dy = self.jumpAmount * 0.8
         gSounds.jump:play()
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
   if self.direction == "left" then
      scaleX = -1
   end
   
   love.graphics.setColor(self.color.red, self.color.green, self.color.blue)
      love.graphics.draw(
         gTextures.toast, gFrames.toast[self.currentAnimation:getCurrentFrame()],
         self.x, self.y, 0, scaleX, 1, self.currentAnimation.width/2, self.currentAnimation.height/2
      )
   love.graphics.setColor(1,1,1,1)
end

return Player