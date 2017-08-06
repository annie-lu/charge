local PianoTwo = {}
local Piano = require 'Pianolevel.piano'
--local IDK = require 'hump.game'

startTime = 0;

local screen= love.graphics.newImage("Pianolevel/Pianotransition2.png")
function PianoTwo:draw()
	love.graphics.draw(screen, 0, 0)
end


function PianoTwo:keyreleased(key, code)
    if key == 'return' then
        Gamestate.switch(Piano)
    end
end

return PianoTwo
