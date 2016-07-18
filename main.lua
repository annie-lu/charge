Gamestate = require 'hump.gamestate'

local Kitchen = require 'kitchen'

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(Kitchen)
end
