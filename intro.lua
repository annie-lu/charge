local Introduction = {}
local Kitchen = require 'kitchenlevel.kitchen'
local IDK = require 'testhump.game'

function Introduction:draw()
    love.graphics.print("placeholder press enter")
end


function Introduction:keyreleased(key, code)
    if key == 'return' then
        Gamestate.switch(Kitchen)
    else
        Gamestate.switch(IDK)
      end
end

return Introduction
