intro = {}

-- local msg = "You were once a person but you have been curse.\n"
--             .. "You will live your life as a bread, but ...\n"
--             .. "You can walk, you can jump and you can use power ups with the help\n"
--             .. "of the fairy who knew that a witch cursed you . \n\n"
--             .. "You must journey through the lands to get to that witch \n"
--             .. "Either you become human again or live as a bread is all up to you."

local msg = 'hello world               '..'    '
function intro:load()
    dialog_message = msg
    dialog_length = 0
    dialog_speed = 15
    dialog_finished = false

    self.transitionAlpha = 0
    self.frame = 1

    self.animation = Animation {
        frames = {},
        interval = 0.1
    }

    self.currentAnimation = self.animation
end
  
function intro:update(dt)
    dialog_length = dialog_length + dialog_speed * dt 
    
    if dialog_length > #dialog_message then
        msg = 'Loading... please wait'
            for i = 1, 155 do
                self.frame = self.frame + 1
                table.insert(self.animation.frames, self.frame)
            end

            if self.currentAnimation.currentFrame == 155 then
                Timer.tween(2, {
                    [self] = {transitionAlpha = 1}
                }
                ):finish(function() 
                    dialog_finished = true
                end)
            end

        self.currentAnimation:update(dt)
        Timer.update(dt)
    end
   
    if love.keyboard.wasPressed('return') then
        dialog_finished = true
    end
end
  
function intro:draw()
    if dialog_finished == false then
        love.graphics.setFont(small)
        local msg_skip = 'Press Enter to Skip'

        if dialog_length < #dialog_message then
            local msg = string.sub(dialog_message, 1, math.floor(dialog_length))
            love.graphics.setColor(1,1,1,1)
            love.graphics.printf(msg, 0 , 50, VIRTUAL_WIDTH,'center')
            love.graphics.print(msg_skip, 13, VIRTUAL_HEIGHT - 15)
        end

        if dialog_length > #dialog_message then
            love.graphics.printf(msg, 0, 50, VIRTUAL_WIDTH, 'center')
            if self.currentAnimation.currentFrame < 155 then
                love.graphics.draw(gTextures.firstScene, gFrames.firstScene[self.currentAnimation:getCurrentFrame()])
                
                love.graphics.setColor(0,0,0,1)
                    love.graphics.rectangle('fill', 10, VIRTUAL_HEIGHT - 20, small:getWidth(msg_skip) + 6, 20, 4)
                love.graphics.setColor(1,1,1,1)
                
                love.graphics.print(msg_skip, 13, VIRTUAL_HEIGHT - 15)
            else
                love.graphics.setColor(1, 1, 1, self.transitionAlpha)
                love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
            end
        end 
    end
end