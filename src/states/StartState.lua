StartState = Class{__includes = BaseState}

function StartState:init()
    self.transitionAlpha = 0
    
    self.frame = 1

    self.animation = Animation {
        frames = {}, -- initialize table then update later
        interval = 0.1 -- how fast the animation
    }
    
    self.currentAnimation = self.animation
end

function StartState:update(dt)
    -- for every iteration add self.frame by 1 then insert it in the frames initialize in StartState:init()
    for i = 1, 38 do
        self.frame = self.frame + 1
        table.insert(self.animation.frames, self.frame)
    end
    
    -- update the animation
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