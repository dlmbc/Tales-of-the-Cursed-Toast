PlayState = Class{__includes = BaseState}

local highlighted = 1

function PlayState:init()
    titleState = false
    playing = true

    loaded = false -- not in the load state
    Map:load()
    GUI:load()
end

-- function 
function PlayState:update(dt)
    if not playing then
        if love.keyboard.wasPressed('w') then
            highlighted = highlighted - 1
            if highlighted < 1 then
                highlighted = 4
            end
        elseif love.keyboard.wasPressed('s') then
            highlighted = highlighted + 1
            if highlighted > 4 then
                highlighted = 1
            end
        end

        if love.keyboard.wasPressed('return') then
            if highlighted == 1 then
                playing = true
                highlighted = 1
            elseif highlighted == 2 then
                Map:saveGame()
            elseif highlighted == 3 then
                gStateMachine:change('settings')
                highlighted = 1
            elseif highlighted == 4 then
                gStateMachine:change('title')
                highlighted = 1
                gSounds.tbgm:play()
            end
        end
    else
        World:update(dt)
        Player:update(dt)
        Slime.updateAll(dt)
        Breakable.updateAll(dt)
        Spike.updateAll(dt)
        Key.updateAll(dt)
        Lock.updateAll(dt)
        Checkpoint.updateAll(dt)
        Finish.updateAll(dt)
        Chocolate.updateAll(dt)
        GUI:update(dt)
        Map:positionCamera(self, Player, Camera)
        Map:update(dt)
        if love.keyboard.wasPressed('escape') then
            if playing then
                playing = false
            else
                playing = true
            end
        end
    end
end

function PlayState:render()
    if not playing then
        if not titleState then
            love.graphics.draw(Map:backGround())
            love.graphics.setColor(1,1,1,0.5)
                love.graphics.draw(gTextures.panel)
            love.graphics.setColor(1,1,1,1)

            love.graphics.setFont(medium)
            if highlighted == 1 then
                love.graphics.setColor(103/255, 1, 1, 1)
            end
                love.graphics.printf('Resume', 125, 75, VIRTUAL_WIDTH, 'left')
                love.graphics.setColor(1, 1, 1, 1)

            if highlighted == 2 then
                love.graphics.setColor(103/255, 1, 1, 1)
            end
                love.graphics.printf('Save', 125, 95, VIRTUAL_WIDTH, 'left')
                love.graphics.setColor(1, 1, 1, 1)

            if highlighted == 3 then
                love.graphics.setColor(103/255, 1, 1, 1)
            end
                love.graphics.printf('Settings', 125, 115, VIRTUAL_WIDTH, 'left')
                love.graphics.setColor(1, 1, 1, 1)

            if highlighted == 4 then
                love.graphics.setColor(103/255, 1, 1, 1)
            end
                love.graphics.printf('Exit', 125, 135, VIRTUAL_WIDTH, 'left')
                love.graphics.setColor(1, 1, 1, 1)
        end
    else
        love.graphics.draw(Map:backGround(), -BACKGROUND_SCROLL)

        gSounds.tbgm:pause()
        Map.level:draw(-Camera.x)
        Camera:set()
            Player:draw()
            Slime.drawAll()
            Breakable.drawAll()
            Spike.drawAll()
            Key.drawAll()
            Lock.drawAll()
            Checkpoint.drawAll()
            Finish.drawAll()
            Chocolate.drawAll()
        Camera:unset()
        GUI:draw()
    end
end

function PlayState:beginContact(a, b, collision)
    Breakable.beginContact(a, b, collision)
    Spike.beginContact(a, b, collision)
    Key.beginContact(a, b, collision)
    Lock.beginContact(a, b, collision)
    Slime.beginContact(a, b, collision)
    Checkpoint.beginContact(a, b, collision)
    Finish.beginContact(a, b, collision)
    Chocolate.beginContact(a, b, collision)
    Player:beginContact(a, b, collision)
end

function PlayState:endContact(a, b, collision)
    Player:endContact(a, b, collision)
end