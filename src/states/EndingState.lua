EndingState = Class{__includes = BaseState}

local group = "GROUP 1: KAJE FRAMES\n\n"
    .."BSCOE 2 - 6"

local members = "John Loyd Adobas\n"
    .."Alejandro Babilonia\n"
    .."Erica Delambaca\n"
    .."Kris Anne Del Prado\n"

local library_title = "LIBRARY (not ours)\n\n\n"
    .."Push\n"
    .."Class\n"
    .."Knife\n"
    .."STI\n"

local music_title = "MUSIC (own composition)\n\n\n"
    .."Aspire.mp3\n"
    .."Morning Dew.mp3\n"
    .."Freeze Out.mp3\n"
    .."Illuminate.mp3\n"
    .."Hex.mp3\n"
           
function EndingState:init()
    _credits = true
    
    credit_seconds = 8

    Timer.every(1, function()
        credit_seconds = credit_seconds - 1
    end)

    if titleState == false then
        Map:clean()
    end

    titleState = true
    playing = false
    
    self.transitionAlpha = 0
end

function EndingState:update(dt)
    if credit_seconds == 0 then
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
            GUI.mailNum = 0
            gSounds.aspire:play()
            gStateMachine:change('title')
        end)
    end

    Timer.update(dt)
end

function EndingState:render()
    love.graphics.setFont(small)
    local msg_skip = "Press Enter to skip"
    love.graphics.print(msg_skip, 13, VIRTUAL_HEIGHT - 15)

    if credit_seconds >= 7 and credit_seconds <= 8 then
        love.graphics.setFont(medium)
        love.graphics.printf(group, 0, 50, VIRTUAL_WIDTH, 'center')

    elseif credit_seconds >= 5 and credit_seconds <= 6 then
        love.graphics.setFont(medium)
        love.graphics.printf(members, 0, 50, VIRTUAL_WIDTH, 'center')

    elseif credit_seconds >= 3 and credit_seconds <= 4 then
        love.graphics.setFont(medium)
        love.graphics.printf(library_title, 0, 50, VIRTUAL_WIDTH, 'center')

    elseif credit_seconds >= 1 and credit_seconds <= 2 then
        love.graphics.setFont(medium)
        love.graphics.printf(music_title, 0, 50, VIRTUAL_WIDTH, 'center')

    else
        love.graphics.setColor(1, 1, 1, self.transitionAlpha)
        love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
    end
        love.graphics.setColor(1, 1, 1, self.transitionAlpha)
        love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
end