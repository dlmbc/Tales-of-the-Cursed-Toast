function love.conf(t)
    t.console =  true
    t.window.title = 'Tales of the Cursed Toast' -- ste title sscreen
    t.window.icon = 'graphics/icon.png' -- set the icon

    t.setIdentity = 'Tales-of-the-Cursed-Toast' -- set our saving file as this name, since the folder name is this

    t.modules.joystick = false
end