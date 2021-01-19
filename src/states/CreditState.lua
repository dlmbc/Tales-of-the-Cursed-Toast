CreditState = Class{__includes = BaseState}

local highlighted = 1

function CreditState:update(dt)
    if love.keyboard.wasPressed('return') then
        if highlighted == 1 then
            gStateMachine:change('title')
        end
    end

    if love.keyboard.wasPressed('escape') then
        gStateMachine:change('title')
    end
end

function CreditState:render()
    love.graphics.draw(gTextures.background)
    
    love.graphics.setColor(1,1,1,0.5)
        love.graphics.draw(gTextures.panel)
    love.graphics.setColor(1,1,1,1)
    
    love.graphics.setFont(small)
    love.graphics.printf('Adobas, John Loyd', 125, 75, VIRTUAL_WIDTH, 'left')
    love.graphics.printf('Babilonia, Alejandro', 125, 95, VIRTUAL_WIDTH, 'left')
    love.graphics.printf('Delambaca, Erica', 125, 115, VIRTUAL_WIDTH, 'left')
    love.graphics.printf('Del Prado, Kris', 125, 135, VIRTUAL_WIDTH, 'left')

    if highlighted == 1 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
        love.graphics.printf('Back', 125, 155, VIRTUAL_WIDTH, 'left')
        love.graphics.setColor(1,1,1,1)
end