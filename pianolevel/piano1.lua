local PianoOne = {}
local Piano = require 'Pianolevel.piano2'
--local IDK = require 'hump.game'

startTime = 0;

local screen= love.graphics.newImage("Pianolevel/Pianotransition1.png")
function PianoOne:draw()
	love.graphics.draw(screen, 0, 0)
end


function PianoOne:keyreleased(key, code)
    if key == 'return' then
        Gamestate.switch(Piano)
    end
end

return PianoOne
