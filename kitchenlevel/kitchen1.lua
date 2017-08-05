local KitchenOne = {}
local Kitchen = require 'kitchenlevel.kitchen2'
--local IDK = require 'hump.game'

startTime = 0;

local screen= love.graphics.newImage("kitchenlevel/kitchentransition1.png")
function KitchenOne:draw()
	love.graphics.draw(screen, 0, 0)
end


function KitchenOne:keyreleased(key, code)
    if key == 'return' then
        Gamestate.switch(Kitchen)
    end
end

return KitchenOne
