local Introduction = {}
local Description = require 'start2'

local screen= love.graphics.newImage("start_one.png")
function Introduction:draw()
	love.graphics.draw(screen, 0, 0)
end


function Introduction:keyreleased(key, code)
    if key == 'return' then
        Gamestate.switch(Description)
    end
end

return Introduction
