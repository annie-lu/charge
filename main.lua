Gamestate = require 'hump.gamestate'

local Introduction = require 'start'

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(Introduction)
end
