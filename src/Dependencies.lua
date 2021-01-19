-- https://github.com/Ulydev/push
push = require 'lib/push'

-- https://github.com/vrld/hump/blob/master/class.lua
Class = require 'lib/class'

STI  = require 'lib/sti'

Timer = require 'lib/knife.timer'

-- game entities
Player = require 'src/entities/player'
Slime = require 'src/entities/slime'

Map = require 'src/map'
Camera = require 'lib/camera'
GUI = require 'src/gui/gui'

-- game objects
Breakable = require'src/gameObjects/breakable'
Key = require 'src/gameObjects/key'

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
    forest = love.audio.newSource('sounds/music/forest.mp3', 'static'),
    jump = love.audio.newSource('sounds/SFX/jump.wav', 'static')
}

gTextures = {
    background = love.graphics.newImage('graphics/background/Title.png'),
    forest = love.graphics.newImage('graphics/background/Forest.png'),
    cave = love.graphics.newImage('graphics/background/Cave.png'),
    arrow = love.graphics.newImage('graphics/arrow.png'),
    panel = love.graphics.newImage('graphics/holder.png'),
    logo = love.graphics.newImage('graphics/logo.png'),
    toast = love.graphics.newImage('graphics/toastSprite.png'),
    keyLock = love.graphics.newImage('graphics/key_lock.png')
}

gFrames = {
    arrow = GenerateQuads(gTextures.arrow, 4, 5),
    logo = GenerateQuads(gTextures.logo, 272, 160),
    toast = GenerateQuads(gTextures.toast, 16, 16),
    key = GenerateQuadsKey(gTextures.keyLock),
    lock = GenerateQuadsLock(gTextures.keyLock)
}