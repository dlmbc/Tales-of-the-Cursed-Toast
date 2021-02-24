PlayState = Class{__includes = BaseState}

local highlighted = 1
local sfxNext = 1
local bgmNext = 1

function PlayState:init()
    titleState = false
    playing = true

    loaded = false -- not in the load state
    Snow:load()
    Map:load()
    GUI:load()

    intro:load()
    outro:load()
end

-- function 
function PlayState:update(dt)
    if not playing then
        if love.keyboard.wasPressed('w') then
            highlighted = highlighted - 1
            if highlighted < 1 then
                highlighted = 5
            end
        elseif love.keyboard.wasPressed('s') then
            highlighted = highlighted + 1
            if highlighted > 5 then
                highlighted = 1
            end
        end

        if (love.keyboard.wasPressed('d') or love.keyboard.wasPressed('a')) and highlighted == 1 then
            sfxNext = sfxNext == 1 and 2 or 1
            if sfxNext == 1 then
                SFX_play = true
            else
                SFX_play = false
            end
        end

        if (love.keyboard.wasPressed('d') or love.keyboard.wasPressed('a')) and highlighted == 2 then
            bgmNext = bgmNext == 1 and 2 or 1
            if bgmNext == 1 then
                if Map.currentLevel >= 1 and Map.currentLevel <= 4 then
                    gSounds.morningDew:play()
                    gSounds.morningDew:setLooping(true)
                    
                elseif Map.currentLevel >= 5 and Map.currentLevel <= 8 then
                    gSounds.morningDew:pause()
                    gSounds.freezeOut:play()
                    gSounds.freezeOut:setLooping(true)

                elseif Map.currentLevel >= 9 and Map.currentLevel <= 12 then
                    gSounds.freezeOut:pause()
                    gSounds.illuminate:play()
                    gSounds.illuminate:setLooping(true)

                elseif Map.currentLevel == 13 then
                    gSounds.illuminate:pause()
                    gSounds.hex:play()
                end

            elseif bgmNext == 2 then
                gSounds.morningDew:pause()
                gSounds.freezeOut:pause()
                gSounds.illuminate:pause()
                gSounds.hex:pause()
            end
        end

        if love.keyboard.wasPressed('return') then
            if highlighted == 3 then
                gSounds.select:play()
                Map:saveGame()

            elseif highlighted == 4 then
                if bgmNext == 1 then
                    if Map.currentLevel >= 1 and Map.currentLevel <= 4 then
                        gSounds.morningDew:play()
                        gSounds.morningDew:setLooping(true)

                    elseif Map.currentLevel >= 5 and Map.currentLevel <= 8 then
                        gSounds.freezeOut:play()
                        gSounds.freezeOut:setLooping(true)

                    elseif Map.currentLevel >= 9 and Map.currentLevel <= 12 then
                        gSounds.illuminate:play()
                        gSounds.illuminate:setLooping(true)

                    elseif Map.currentLevel == 13 then
                        gSounds.hex:play()
                        gSounds.hex:setLooping(true)
                    end

                elseif bgmNext == 2 then
                    gSounds.morningDew:stop()
                    gSounds.freezeOut:stop()
                    gSounds.illuminate:stop()
                    gSounds.hex:stop()
                end

                playing = true
                highlighted = 1

            elseif highlighted == 5 then
                gStateMachine:change('title')
                Snow.howl:stop()
                highlighted = 1
                gSounds.aspire:play()
            end
        end
    else
        if love.keyboard.wasPressed('escape') then
            if playing == true then
                playing = false
            else
                playing = true
            end
        end
        
        if dialog_finished == false then
            intro:update(dt)

        else
            if bgmNext == 1 then
                if Map.currentLevel >= 1 and Map.currentLevel <= 4 then
                    gSounds.morningDew:play()
                    gSounds.morningDew:setLooping(true)
                    
                elseif Map.currentLevel >= 5 and Map.currentLevel <= 8 then
                    gSounds.morningDew:pause()
                    gSounds.freezeOut:play()
                    gSounds.freezeOut:setLooping(true)

                elseif Map.currentLevel >= 9 and Map.currentLevel <= 12 then
                    gSounds.freezeOut:pause()
                    gSounds.illuminate:play()
                    gSounds.illuminate:setLooping(true)

                elseif Map.currentLevel == 13 then
                    gSounds.illuminate:pause()
                    gSounds.hex:play()
                end

            elseif bgmNext == 2 then
                gSounds.morningDew:stop()
                gSounds.freezeOut:stop()
                gSounds.illuminate:stop()
                gSounds.hex:stop()
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
            StrawBerry.updateAll(dt)
            
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

function PlayState:render()
    if not playing then
        if not titleState then
            love.graphics.setShader()
            love.graphics.draw(Map:backGround())
            love.graphics.setColor(1,1,1,0.5)
                love.graphics.draw(gTextures.panel)
            love.graphics.setColor(1,1,1,1)

            love.graphics.setFont(medium)
            if highlighted == 1 then
                love.graphics.setColor(103/255, 1, 1, 1)
                love.graphics.draw(gTextures.arrow, gFrames.arrow[1], 175, 80)
                love.graphics.draw(gTextures.arrow, gFrames.arrow[2], 215, 80)
            end
                if SFX_play == true then
                    love.graphics.printf('ON', 125, 75, 145, 'center')
                else
                    love.graphics.printf('OFF', 125, 75, 145, 'center')
                end
                love.graphics.printf('SFX', 125, 75, 101, 'left')
                love.graphics.setColor(1, 1, 1, 1)
        
            if highlighted == 2 then
                love.graphics.setColor(103/255, 1, 1, 1) 
                love.graphics.draw(gTextures.arrow, gFrames.arrow[1], 175, 100)
                love.graphics.draw(gTextures.arrow, gFrames.arrow[2], 215, 100)
            end
                if bgmNext == 1 then
                    love.graphics.printf('ON', 125, 95, 145, 'center')
                else
                    love.graphics.printf('OFF', 125, 95, 145, 'center')
                end
                love.graphics.printf('BGM', 125, 95, 101, 'left')
                love.graphics.setColor(1, 1, 1, 1)

            if highlighted == 3 then
                love.graphics.setColor(103/255, 1, 1, 1)
            end
                love.graphics.printf('Save', 125, 115, VIRTUAL_WIDTH, 'left')
                love.graphics.setColor(1, 1, 1, 1)

            if highlighted == 4 then
                love.graphics.setColor(103/255, 1, 1, 1)
            end
                love.graphics.printf('Resume', 125, 135, VIRTUAL_WIDTH, 'left')
                love.graphics.setColor(1, 1, 1, 1)

            if highlighted == 5 then
                love.graphics.setColor(103/255, 1, 1, 1)
            end
                love.graphics.printf('Exit', 200, 135, VIRTUAL_WIDTH, 'left')
                love.graphics.setColor(1, 1, 1, 1)
        end
    else    
        if dialog_finished == false then
            intro:draw()

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
                StrawBerry.drawAll()

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

function PlayState:beginContact(a, b, collision)
    if Key.beginContact(a, b, collision) then return end
    if Lock.beginContact(a, b, collision) then return end
    if Checkpoint.beginContact(a, b, collision) then return end
    if Collider.beginContact(a, b, collision) then return end
    if Finish.beginContact(a, b, collision) then return end
    if Mail.beginContact(a, b, collision) then return end

    if Chocolate.beginContact(a, b, collision) then return end
    if StrawBerry.beginContact(a, b, collision) then return end

    FallingPlatform.beginContact(a, b, collision)
    Spike.beginContact(a, b, collision)
    
    Rock.beginContact(a, b, collision)
    IceGoblin.beginContact(a, b, collision)
    Mushroom.beginContact(a, b, collision)
    Slime.beginContact(a, b, collision)
    Player:beginContact(a, b, collision)
end

function PlayState:endContact(a, b, collision)
    Player:endContact(a, b, collision)
end