TitleScreenState = Class{__includes = BaseState}

local highlighted = 1

function TitleScreenState:init()
    if titleState == false then
        Map:clean()
    end

    gSounds.forest:stop()
    
    self.transitionAlpha = 0
    titleState = true
    playing = false
end

function TitleScreenState:update(dt)
    if love.keyboard.wasPressed('s') then
        highlighted = highlighted + 1
        if highlighted > 6 then
            highlighted = 1
        end

    elseif love.keyboard.wasPressed('w') then
        highlighted = highlighted - 1
        if highlighted < 1 then
            highlighted = 6
        end
    end

    if love.keyboard.wasPressed('o') then
        love.filesystem.remove('level.txt')
    end

    if love.keyboard.wasPressed('return') or love.keyboard.wasPressed('enter') then
        if highlighted == 1 then
            Timer.tween(1, {
                [self] = {transitionAlpha = 1}
            }):finish(function()
                gStateMachine:change('play') end)

        elseif highlighted == 2 then
            Timer.tween(1, {
                [self] = {transitionAlpha = 1}
            }):finish(function()
                gStateMachine:change('load') end)

        elseif highlighted == 3 then
            gStateMachine:change('how-to-play')

        elseif highlighted == 4 then
            gStateMachine:change('settings')

        elseif highlighted == 5 then
            gStateMachine:change('credits')

        elseif highlighted == 6 then
            love.event.quit()
            
        end
    elseif love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    Timer.update(dt)
end

function TitleScreenState:render()
    love.graphics.draw(gTextures.background)
    
    love.graphics.setFont(medium)
    
    if highlighted == 1 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
        love.graphics.printf('Start', VIRTUAL_WIDTH/3 - 15, 100, VIRTUAL_WIDTH, 'center')
        love.graphics.setColor(1, 1, 1, 1)

    if highlighted == 2 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
        love.graphics.printf('Load Game', VIRTUAL_WIDTH/3 - 15, 120, VIRTUAL_WIDTH, 'center')
        love.graphics.setColor(1, 1, 1, 1)

    if highlighted == 3 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
        love.graphics.printf('How To Play', VIRTUAL_WIDTH/3 - 15, 140, VIRTUAL_WIDTH, 'center')
        love.graphics.setColor(1, 1, 1, 1)
        
    if highlighted == 4 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
        love.graphics.printf('Settings', VIRTUAL_WIDTH/3 - 15, 160, VIRTUAL_WIDTH, 'center')
        love.graphics.setColor(1, 1, 1, 1)

    if highlighted == 5 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
        love.graphics.printf('Credits', VIRTUAL_WIDTH/3 - 15, 180, VIRTUAL_WIDTH, 'center')
        love.graphics.setColor(1, 1, 1, 1)
        
    if highlighted == 6 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
        love.graphics.printf('Exit', VIRTUAL_WIDTH/3 - 15, 200, VIRTUAL_WIDTH, 'center')
        love.graphics.setColor(1, 1, 1, 1)

    love.graphics.setColor(1, 1, 1, self.transitionAlpha)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
end