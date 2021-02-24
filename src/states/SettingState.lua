SettingState = Class{__includes = BaseState}

SFX_play = true
BGM_play = true

local highlighted = 1
local sfxNext = 1
local bgmNext = 1

function SettingState:init()
    if titleState == false then
        Map:clean()
    end
end

function SettingState:update(dt)
    if love.keyboard.wasPressed('s') then
        if SFX_play == true then
            gSounds.select:play()
         else
            gSounds.select:stop()
         end

        highlighted = highlighted + 1
        if highlighted > 3 then
            highlighted = 1
        end

    elseif love.keyboard.wasPressed('w') then
        if SFX_play == true then
            gSounds.select:play()
        else
            gSounds.select:stop()
        end
        highlighted = highlighted - 1
        if highlighted < 1 then
            highlighted = 3
        end
    end

    if (love.keyboard.wasPressed('d') or love.keyboard.wasPressed('a')) and highlighted == 1 then
        sfxNext = sfxNext == 1 and 2 or 1
        if sfxNext == 1 then
            SFX_play = true
        elseif sfxNext == 2 then
            SFX_play = false
        end
    end

    if (love.keyboard.wasPressed('d') or love.keyboard.wasPressed('a')) and highlighted == 2 then
        bgmNext = bgmNext == 1 and 2 or 1
        if bgmNext == 1 then
            BGM_play = true

        elseif bgmNext == 2 then
            gSounds.aspire:stop()
        end
    end

    if titleState then
        if love.keyboard.wasPressed('return') then
            if highlighted == 3 then
                gStateMachine:change('title')
                highlighted = 1
            end
        elseif love.keyboard.wasPressed('escape') then
            gStateMachine:change('title')
        end
    else
        if love.keyboard.wasPressed('return') then
            if highlighted == 3 then
                gStateMachine:change('play')
                highlighted = 1
            end
        elseif love.keyboard.wasPressed('escape') then
            gStateMachine:change('play')
        end
    end
end

function SettingState:render()
    love.graphics.draw(gTextures.background)
    
    love.graphics.setColor(1,1,1,0.5)
        love.graphics.draw(gTextures.panel)
    love.graphics.setColor(1,1,1,1)

    love.graphics.setFont(medium)
    if highlighted == 1 then
        love.graphics.setColor(103/255, 1, 1, 1)
        love.graphics.draw(gTextures.arrow, gFrames.arrow[1], 175, 80)
        love.graphics.draw(gTextures.arrow, gFrames.arrow[2], 215, 80)
    end
        if sfxNext == 1 then
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
        love.graphics.printf('TBGM', 125, 95, 101, 'left')
        love.graphics.setColor(1, 1, 1, 1)

    if highlighted == 3 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
        love.graphics.printf('Back', 125, 125, 101, 'left')
        love.graphics.setColor(1, 1, 1, 1)
end