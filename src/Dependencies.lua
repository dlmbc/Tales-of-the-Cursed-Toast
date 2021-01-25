-- https://github.com/Ulydev/push
push = require 'lib/push'

-- https://github.com/vrld/hump/blob/master/class.lua
Class = require 'lib/class'

-- https://github.com/karai17/Simple-Tiled-Implementation
STI  = require 'lib/sti'

-- https://github.com/airstruck/knife
Timer = require 'lib/knife.timer'
Serialize = require 'lib/knife.serialize'

-- game entities
Player = require 'src/entities/player'
Slime = require 'src/entities/slime'

Map = require 'src/map'
Camera = require 'lib/camera'
GUI = require 'src/gui/gui'

-- game objects
Breakable = require'src/gameObjects/breakable'
Spike = require 'src/gameObjects/spike'
Key = require 'src/gameObjects/key'
Lock = require 'src/gameObjects/lock'
Checkpoint = require 'src/gameObjects/checkpoint'
Finish = require 'src/gameObjects/finish'

-- power ups
Chocolate = require 'src/powerups/chocolate'

require 'src/StateMachine'
require 'src/states/BaseState'
require 'src/states/TitleScreenState'
require 'src/states/SettingState'
require 'src/states/PlayState'
require 'src/states/CreditState'
require 'src/states/HowToPlayState'
require 'src/states/StartState'
require 'src/states/LoadState'

require 'src/Animation'
require 'src/constants'
require 'src/Util'

small = love.graphics.newFont('font/font.ttf', 8)
medium = love.graphics.newFont('font/font.ttf', 16)
large = love.graphics.newFont('font/font.ttf', 32)

gSounds = {
    tbgm = love.audio.newSource('sounds/music/Aspire.mp3', 'static'),
    forest = love.audio.newSource('sounds/music/fork.mp3', 'static'),
    jump = love.audio.newSource('sounds/SFX/jump.wav', 'static')
}

gTextures = {
    background = love.graphics.newImage('graphics/background/Title.png'),
    forest = love.graphics.newImage('graphics/background/Forest.png'),
    mountain = love.graphics.newImage('graphics/background/Mountain.png'),
    cave = love.graphics.newImage('graphics/background/Cave.png'),
    kitchen = love.graphics.newImage('graphics/background/Kitchen.png'),
    
    arrow = love.graphics.newImage('graphics/arrow.png'),
    panel = love.graphics.newImage('graphics/holder.png'),
    
    logo = love.graphics.newImage('graphics/logo.png'),
    kaje = love.graphics.newImage('graphics/KAJElogo.png'),

    toast = love.graphics.newImage('graphics/toastSprite.png'),
    slime = love.graphics.newImage('graphics/slime.png'),
    keyLock = love.graphics.newImage('graphics/key_lock.png'),
    flag = love.graphics.newImage('graphics/flag.png'),
    checkpoint = love.graphics.newImage('graphics/checkpoint.png'),
    spike = love.graphics.newImage('graphics/spike.png'),
    chocolate = love.graphics.newImage('graphics/chocolate.png')
}

gFrames = {
    arrow = GenerateQuads(gTextures.arrow, 4, 5),
    logo = GenerateQuads(gTextures.logo, 384, 224),
    toast = GenerateQuads(gTextures.toast, 16, 16),
    slime = GenerateQuads(gTextures.slime, 16, 13),
    keyLock = GenerateQuads(gTextures.keyLock, 16, 16),
    chocolate = GenerateQuads(gTextures.chocolate, 16, 16)
}