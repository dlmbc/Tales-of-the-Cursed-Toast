StartState = Class{__includes = BaseState}

function StartState:init()
    self.transitionAlpha = 0
    
    self.frame = 1

    self.animation = Animation {
        frames = {},
        interval = 0.1
    }
    
    self.currentAnimation = self.animation
end

function StartState:update(dt)
    for i = 1, 38 do
        self.frame = self.frame + 1
        table.insert(self.animation.frames, self.frame)
    end
    self.currentAnimation:update(dt)
    
    if self.currentAnimation.currentFrame == 38 then
        Timer.tween(1, {
            [self] = {transitionAlpha = 1}
        }):finish(function()
            gStateMachine:change('title') end)
    end

    if love.keyboard.wasPressed('return') then
        Timer.tween(1, {
            [self] = {transitionAlpha = 1}
        }):finish(function()
            gStateMachine:change('title') end)
    end
    Timer.update(dt)
end

function StartState:render()
    if self.currentAnimation.currentFrame < 38 then
        love.graphics.draw(gTextures.logo, gFrames.logo[self.currentAnimation:getCurrentFrame()])
    else
        love.graphics.draw(gTextures.logo, gFrames.logo[38])
    end
    love.graphics.setColor(1, 1, 1, self.transitionAlpha)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
end