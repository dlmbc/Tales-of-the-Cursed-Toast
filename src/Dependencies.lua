-- library
-- https://github.com/Ulydev/push
push = require 'lib/push'

-- https://github.com/vrld/hump/blob/master/class.lua
Class = require 'lib/class'

-- https://github.com/karai17/Simple-Tiled-Implementation
STI  = require 'lib/sti'

-- https://github.com/airstruck/knife
Timer = require 'lib/knife.timer'
Serialize = require 'lib/knife.serialize'

Camera = require 'lib/camera'

-- World
Map = require 'src/map'

-- game entities
Player = require 'src/entities/player'
Slime = require 'src/entities/slime'
Mushroom = require 'src/entities/mushroom'
IceGoblin = require 'src/entities/iceGoblin'
Rock = require 'src/entities/rock'

-- game objects
FallingPlatform = require'src/gameObjects/fallingPlatform'
Spike = require 'src/gameObjects/spike'
Key = require 'src/gameObjects/key'
Lock = require 'src/gameObjects/lock'
Checkpoint = require 'src/gameObjects/checkpoint'
Finish = require 'src/gameObjects/finish'
Collider = require 'src/gameObjects/collider'
Mail = require 'src/gameObjects/mail'

-- falling platform 
_platform = 1

-- power ups
Chocolate = require 'src/powerups/chocolate'

-- Particle Effect
Snow = require 'src/snow'

-- Shader
require 'src/shader'

-- GUI
GUI = require 'src/gui/gui'

-- game states
require 'src/StateMachine'
require 'src/states/BaseState'
require 'src/states/TitleScreenState'
require 'src/states/SettingState'
require 'src/states/PlayState'
require 'src/states/CreditState'
require 'src/states/HowToPlayState'
require 'src/states/StartState'
require 'src/states/LoadState'
require 'src/states/EndingState'

require 'src/Animation'
require 'src/constants'
require 'src/Util'

require 'src/gui/text/intro'
require 'src/gui/text/outro'

-- fonts
small = love.graphics.newFont('font/font.ttf', 8)
medium = love.graphics.newFont('font/font.ttf', 16)
large = love.graphics.newFont('font/font.ttf', 32)

-- sounds
gSounds = {
    aspire = love.audio.newSource('sounds/music/Aspire.mp3', 'stream'),
    morningDew = love.audio.newSource('sounds/music/Morning Dew.mp3', 'stream'),
    freezeOut = love.audio.newSource('sounds/music/Freeze Out.mp3', 'stream'),
    illuminate = love.audio.newSource('sounds/music/Illuminate.mp3', 'stream'),
    hex = love.audio.newSource('sounds/music/Hex.mp3', 'stream'),

    jump = love.audio.newSource('sounds/SFX/jump.wav', 'static'),
    wind = love.audio.newSource('sounds/SFX/wind.wav', 'static'),
    select = love.audio.newSource('sounds/SFX/Select.wav', 'static'),
    hit = love.audio.newSource('sounds/SFX/hit.wav', 'static'),
    nextLevel = love.audio.newSource('sounds/SFX/levelup.wav', 'static')
}

-- source images
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
    firstScene = love.graphics.newImage('graphics/firstScene.png'),

    toast = love.graphics.newImage('graphics/toastSprite.png'),
    slime = love.graphics.newImage('graphics/slime.png'),
    mushroom = love.graphics.newImage('graphics/mushroom.png'),
    iceGoblin = love.graphics.newImage('graphics/iceGoblin.png'),
    rock = love.graphics.newImage('graphics/rocks.png'),

    keyLock = love.graphics.newImage('graphics/key_lock.png'),
    flag = love.graphics.newImage('graphics/flag.png'),
    checkpoint = love.graphics.newImage('graphics/checkpoint.png'),
    spike = love.graphics.newImage('graphics/spike.png'),
    chocolate = love.graphics.newImage('graphics/chocolate.png'),
    platform = love.graphics.newImage('graphics/breakable.png'),
    mail = love.graphics.newImage('graphics/mail.png'),

    snow = love.graphics.newImage('graphics/snow.png')
}

-- quads
gFrames = {
    arrow = GenerateQuads(gTextures.arrow, 4, 5),
    logo = GenerateQuads(gTextures.logo, 384, 224),
    firstScene = GenerateQuads(gTextures.firstScene, 384, 224),
    
    toast = GenerateQuads(gTextures.toast, 16, 16),
    slime = GenerateQuads(gTextures.slime, 16, 13),
    mushroom = GenerateQuads(gTextures.mushroom, 16, 16),
    iceGoblin = GenerateQuads(gTextures.iceGoblin, 16, 16),
    rock = GenerateQuads(gTextures.rock, 16, 16),

    keyLock = GenerateQuads(gTextures.keyLock, 16, 16),
    platform = GenerateQuads(gTextures.platform, 16, 8),

    chocolate = GenerateQuads(gTextures.chocolate, 16, 16)
}