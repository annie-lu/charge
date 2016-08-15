Gamestate = require 'hump.gamestate'

local Introduction = require 'intro'
local Kitchen = require 'kitchenlevel.kitchen'

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(Kitchen)
end
