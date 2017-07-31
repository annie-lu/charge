local BeginTwo = {}
local Stairs = require 'stairslevel.stairs'
local Piano = require 'pianolevel.piano'
local Kitchen = require 'kitchenlevel.kitchen'
local Bedroom = require 'bedroomlevel.bedroom'
--local IDK = require 'hump.game'

startTime = 0;

local screen= love.graphics.newImage("intro2.png")
function BeginTwo:draw()
	love.graphics.draw(screen, 0, 0)
        love.graphics.print("press enter to continue")
end


function BeginTwo:keyreleased(key, code)
    if key == 'return' then
				startTime = love.timer.getTime();
        Gamestate.switch(Bedroom)
    end
end

return BeginTwo
