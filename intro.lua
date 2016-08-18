local Introduction = {}
local Beginning = require 'beginning1'

local screen= love.graphics.newImage("title.png")
function Introduction:draw()
	love.graphics.draw(screen, 0, 0)
        love.graphics.print("press enter to continue")
end


function Introduction:keyreleased(key, code)
    if key == 'return' then
        Gamestate.switch(Beginning)
    end
end

return Introduction
