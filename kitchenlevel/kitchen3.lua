local KitchenThree = {}
local Piano = require 'pianolevel.piano1'
--local IDK = require 'hump.game'

startTime = 0;

local screen= love.graphics.newImage("kitchenlevel/kitchenbgtransition.png")
function KitchenThree:draw()
	love.graphics.draw(screen, 0, 0)
end


function KitchenThree:keyreleased(key, code)
    if key == 'return' then
        Gamestate.switch(Piano)
    end
end

return KitchenThree
