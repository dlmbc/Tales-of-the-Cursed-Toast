LoadState = Class{__includes = BaseState}

function LoadState:init()

end

function LoadState:update(dt)
    if love.keyboard.wasPressed('escape') then
        gStateMachine:change('title')
    end
end

function LoadState:render()
    love.graphics.print('no save game', VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2)
end