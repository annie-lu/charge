local PianoThree = {}
local Piano = require 'stairslevel.stairs'
--local IDK = require 'hump.game'

startTime = 0;

local screen= love.graphics.newImage("Pianolevel/transistion4.png")
function PianoThree:draw()
	love.graphics.draw(screen, 0, 0)
end


function PianoThree:keyreleased(key, code)
    if key == 'return' then
        Gamestate.switch(Piano)
    end
end

return PianoThree
