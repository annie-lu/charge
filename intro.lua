local Introduction = {}
local Kitchen = require 'kitchenlevel.kitchen'
local Stairs = require 'stairslevel.stairs'
local IDK = require 'testhump.game'

function Introduction:draw()
    love.graphics.print("placeholder press enter")
end


function Introduction:keyreleased(key, code)
    if key == 'return' then
        Gamestate.switch(Stairs)
    else
        Gamestate.switch(IDK)
      end
end

return Introduction
