PlayState = Class{__includes = BaseState}

local highlighted = 1

function PlayState:init()
    -- self.playing = true
    titleState = false
    playing = true

    -- Slime.loadAssets()
    Map:load()
    -- Player:load()
    GUI:load()
end

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
            elseif highlighted == 2 then
                -- do nothing for now
            elseif highlighted == 3 then
                gStateMachine:change('settings')
            elseif highlighted == 4 then
                gStateMachine:change('title')
            end
        end
    else
        World:update(dt)
        Player:update(dt)
        Slime.updateAll(dt)
        Breakable.updateAll(dt)
        Key.updateAll(dt)
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
            -- love.graphics.setColor(1,1,1,0.5)
                love.graphics.draw(gTextures.panel)
            -- love.graphics.setColor(1,1,1,1)

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
            Key.drawAll()
        Camera:unset()
        GUI:draw()
    end
end

function PlayState:beginContact(a, b, collision)
    Breakable.beginContact(a, b, collision)
    Key.beginContact(a, b, collision)
    Slime.beginContact(a, b, collision)
    Player:beginContact(a, b, collision)
end

function PlayState:endContact(a, b, collision)
    Player:endContact(a, b, collision)
end