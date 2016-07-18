Gamestate = require 'hump.gamestate'

local Introduction = require 'intro'

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(Introduction)
end
