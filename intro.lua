local Introduction = {}
local Kitchen = require 'kitchenlevel.kitchen'
local Stairs = require 'beginning1'
local IDK = require 'testhump.game'

local screen= love.graphics.newImage("title.png")
function Introduction:draw()
	love.graphics.draw(screen, 0, 0)
        love.graphics.print("press enter to continue")
end


function Introduction:keyreleased(key, code)
    if key == 'return' then
        Gamestate.switch(Stairs)
    end
end

return Introduction
