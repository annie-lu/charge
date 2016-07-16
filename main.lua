local Knife = require 'knife'
local Player = require 'player'
local Fork = require 'fork'
local HC = require 'hc'
Gamestate = require 'hump.gamestate'

local Kitchen = require 'kitchen'

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(Kitchen)
end
