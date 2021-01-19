StartState = Class{__includes = BaseState}

local frame = 1
local numFrame = 38
local timer = 0
local interval = 1/10

function StartState:init()
    self.transitionAlpha = 0
end

function StartState:update(dt)
    timer = timer + dt
    if timer > interval then
        timer = timer % interval
        frame = frame + 1
        if frame == numFrame then
            Timer.tween(1, {
                [self] = {transitionAlpha = 1}
            }):finish(function()
                gStateMachine:change('title') end)
        end
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
    love.graphics.draw(gTextures.logo, gFrames.logo[frame])

    love.graphics.setColor(1, 1, 1, self.transitionAlpha)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
end