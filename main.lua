Gamestate = require 'hump.gamestate'

local Introduction = require 'pianolevel.piano'

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(Introduction)
end
