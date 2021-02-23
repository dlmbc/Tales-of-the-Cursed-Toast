LoadState = Class{__includes = BaseState}

local highlighted = 1

function LoadState:init()
    titleState = false
    playing = true

    loaded = true -- we will  load the game
    Snow:load()
    Map:load()
    GUI:load()

    outro:load()
end

-- function 
function LoadState:update(dt)
    if not love.filesystem.getInfo('level.txt') then
        if love.keyboard.wasPressed('escape') then
            gStateMachine:change('title')
        end
    else
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
                    gSounds.aspire:play()
                end
            end
        else
            if love.keyboard.wasPressed('escape') then
                if playing then
                    playing = false
                else
                    playing = true
                end
            end

            World:update(dt)

            Player:update(dt)
            Slime.updateAll(dt)
            Mushroom.updateAll(dt)
            IceGoblin.updateAll(dt)
            Rock.updateAll(dt)
    
            FallingPlatform.updateAll(dt)
            Spike.updateAll(dt)
            Key.updateAll(dt)
            Lock.updateAll(dt)
            Checkpoint.updateAll(dt)
            Finish.updateAll(dt)
            Mail.updateAll(dt)
            Chocolate.updateAll(dt)
    
            Snow:update(dt)
            GUI:update(dt)
    
            Map:positionCamera(self, Player, Camera)
            Map:update(dt)
            if GUI.mailNum == 1 then
                outro:update(dt)
            end
        end
    end
end

function LoadState:render()
    if not love.filesystem.getInfo('level.txt') then
        love.graphics.printf('no save', 125, 75, VIRTUAL_WIDTH, 'left')
    else
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

            gSounds.aspire:stop()

            Map.level:draw(-Camera.x, -Camera.y)
            Camera:set()
                FallingPlatform.drawAll()
                Spike.drawAll()
                Key.drawAll()
                Lock.drawAll()
                Checkpoint.drawAll()
                Finish.drawAll()
                Mail.drawAll()
                Chocolate.drawAll()

                Slime.drawAll()
                Mushroom.drawAll()
                IceGoblin.drawAll()
                Rock.drawAll()
                Player:draw()
            Camera:unset()
            
            Snow:draw()
            GUI:draw()

            if GUI.mailNum == 1 then
                outro:draw()
            end
        end
    end
end

function LoadState:beginContact(a, b, collision)
    if Key.beginContact(a, b, collision) then return end
    if Lock.beginContact(a, b, collision) then return end
    if Checkpoint.beginContact(a, b, collision) then return end
    if Chocolate.beginContact(a, b, collision) then return end
    if Collider.beginContact(a, b, collision) then return end
    if Finish.beginContact(a, b, collision) then return end
    if Mail.beginContact(a, b, collision) then return end

    FallingPlatform.beginContact(a, b, collision)
    Spike.beginContact(a, b, collision)
    
    Rock.beginContact(a, b, collision)
    IceGoblin.beginContact(a, b, collision)
    Mushroom.beginContact(a, b, collision)
    Slime.beginContact(a, b, collision)
    Player:beginContact(a, b, collision)
end

function LoadState:endContact(a, b, collision)
    Player:endContact(a, b, collision)
end