EndingState = Class{__includes = BaseState}

local credits = [[
    GROUP 1: KAJE FRAMES

    John Loyd Adobas
    Alejandro Babilonia
    Erica Delambaca
    Kris Anne Del Prado


    LIBRARY USED (not ours)

    Push
    Class
    Knife
    Sti


    MUSIC USED (own composition)

    Aspire.mp3
    Morning Dew.mp3
    Freeze Out.mp3
    Illuminate.mp3
    Hex.mp3
]]
                    
function EndingState:init()
    _credits = true

    self.transitionAlpha = 0
end

function EndingState:update(dt)
    Timer.after(2, function() _credits = false end)

    if _credits == false then
        Timer.tween(2, {
            [self] = {transitionAlpha = 1}
        }):finish(function()
            gStateMachine:change('title')
            GUI.mailNum = 0
            gSounds.aspire:play()
        end)
    end

    if love.keyboard.wasPressed('return') then
        Timer.tween(2, {
            [self] = {transitionAlpha = 1}
        }):finish(function()
            gStateMachine:change('title')
        end)
    end

    Timer.update(dt)
end

function EndingState:render()
    love.graphics.setFont(small)
    if _credits == true then
        love.graphics.printf(credits, 0, 15, VIRTUAL_WIDTH, 'center')
    end

    love.graphics.setColor(1, 1, 1, self.transitionAlpha)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
end