HowToPlayState = Class{__includes = BaseState}

local highlighted = 1

function HowToPlayState:update(dt)
    if love.keyboard.wasPressed('d') or love.keyboard.wasPressed('a') then
        highlighted = highlighted == 1 and 2 or 1
    end

    if love.keyboard.wasPressed('return') then
        if highlighted == 1 then
            gStateMachine:change('title')
        end
    end

    if love.keyboard.wasPressed('escape') then
        gStateMachine:change('title')
    end
end

function HowToPlayState:render()
    love.graphics.draw(gTextures.background)
    
    love.graphics.setColor(1,1,1,0.5)
        love.graphics.draw(gTextures.panel)
    love.graphics.setColor(1,1,1,1)
    
    love.graphics.setFont(medium)
    love.graphics.printf('A - move left', 125, 75, VIRTUAL_WIDTH, 'left')
    love.graphics.printf('D - move right', 125, 95, VIRTUAL_WIDTH, 'left')
    love.graphics.printf('J - jump', 125, 115, VIRTUAL_WIDTH, 'left')

    if highlighted == 1 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
        love.graphics.printf('Back', 125, 145, VIRTUAL_WIDTH, 'left')
        love.graphics.setColor(1, 1, 1, 1)

    if highlighted == 2 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
        love.graphics.printf('Next', 125, 145, 101, 'right')
        love.graphics.setColor(1, 1, 1, 1)
end