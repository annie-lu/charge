local Begin = {}
local Begin2 = require 'beginning2'
--local IDK = require 'hump.game'

local screen= love.graphics.newImage("intro1.png")
function Begin:draw()
	love.graphics.draw(screen, 0, 0)
end


function Begin:keyreleased(key, code)
    if key == 'return' then
        Gamestate.switch(Begin2)
    end
end

return Begin
