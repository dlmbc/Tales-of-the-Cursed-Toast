outro = {}

local msg = "Catch me if you can, only if you're up for the challenge.\n"
            .. "If not, just stay as you are now, you are cute as a bread anyway.\n"
            .. "\n\n\n\n\n"
            .. "\t\t\t\t\t\t\t\t\t\t Best Wishes,\n"
            .. "\t\t\t\t\t\t\t\t\t\t The witch :)\n"
            .. "            "

function outro:load()
    ending_message = msg
    ending_message_length = 0
    ending_message_speed = 15
    ending_message_finished = false

    self.transitionAlpha = 0
end
  
function outro:update(dt)
    ending_message_length = ending_message_length + ending_message_speed * dt 
    
    if ending_message_length > #ending_message then
        ending_message_finished = true
        if ending_message_finished == true then
            Timer.tween(2, {
                [self] = {transitionAlpha = 1}
            }):finish(function()
                gStateMachine:change('ending')
            end)
        end
    end
   
    if love.keyboard.wasPressed('return') then
        ending_message_finished = true
        if ending_message_finished == true then
            Timer.tween(2, {
                [self] = {transitionAlpha = 1}
            }):finish(function()
                gStateMachine:change('ending')
            end)
        end
    end

    Timer.update(dt)
end
  
function outro:draw()
    local msg_skip = 'Press Enter to Skip'
    if ending_message_finished == false then
        local msg = string.sub(ending_message, 1, math.floor(ending_message_length))
        love.graphics.setColor(1,1,1,1)
        love.graphics.printf(msg, 0 , 50, VIRTUAL_WIDTH,'center')
        love.graphics.print(msg_skip, 13, VIRTUAL_HEIGHT - 15)
    end
        love.graphics.setColor(1, 1, 1, self.transitionAlpha)
        love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
end