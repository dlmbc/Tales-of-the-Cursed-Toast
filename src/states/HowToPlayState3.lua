HowToPlayState3 = Class{__includes = BaseState}

local highlighted = 1

function HowToPlayState3:update(dt)
    if love.keyboard.wasPressed('d') or love.keyboard.wasPressed('a') then
        highlighted = highlighted == 1 and 2 or 1
        if SFX_play == true then
            gSounds.select:play()
        else
            gSounds.select:stop()
        end
    end

    if love.keyboard.wasPressed('return') then
        if highlighted == 1 then
            gStateMachine:change('how-to-play-2')
        elseif highlighted == 2 then
            gStateMachine:change('title')
        end
    end

    if love.keyboard.wasPressed('escape') then
        gStateMachine:change('title')
    end
end

function HowToPlayState3:render()
    love.graphics.draw(gTextures.background)
    
    love.graphics.setColor(1,1,1,0.5)
        love.graphics.draw(gTextures.panel)
    love.graphics.setColor(1,1,1,1)
    
    love.graphics.setFont(small)
    love.graphics.printf('Chocolate - protection', 125, 75, VIRTUAL_WIDTH, 'left')
    love.graphics.printf('Strawberry - plus 1 life', 125, 95, VIRTUAL_WIDTH, 'left')

    if highlighted == 1 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
        love.graphics.printf('Prev', 125, 145, VIRTUAL_WIDTH, 'left')
        love.graphics.setColor(1, 1, 1, 1)

    if highlighted == 2 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
        love.graphics.printf('Back to title', 125, 145, 101, 'right')
        love.graphics.setColor(1, 1, 1, 1)
end