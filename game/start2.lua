local Introduction = {}
local Beginning = require 'beginning1'

local screen= love.graphics.newImage("start_two.png")
function Introduction:draw()
	love.graphics.draw(screen, 0, 0)
end


function Introduction:keyreleased(key, code)
    if key == 'return' then
        Gamestate.switch(Beginning)
    end
end

return Introduction
