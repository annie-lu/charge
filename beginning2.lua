local BeginTwo = {}
local Kitchen = require 'kitchenlevel.kitchen1'
--local IDK = require 'hump.game'

startTime = 0;

local screen= love.graphics.newImage("intro2.png")
function BeginTwo:draw()
	love.graphics.draw(screen, 0, 0)
end


function BeginTwo:keyreleased(key, code)
    if key == 'return' then
				startTime = love.timer.getTime();
        Gamestate.switch(Kitchen)
    end
end

return BeginTwo
