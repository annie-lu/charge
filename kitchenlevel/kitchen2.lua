local KitchenTwo = {}
local Kitchen = require 'kitchenlevel.kitchen'
--local IDK = require 'hump.game'

startTime = 0;

local screen= love.graphics.newImage("kitchenlevel/kitchentransition2.png")
function KitchenTwo:draw()
	love.graphics.draw(screen, 0, 0)
end


function KitchenTwo:keyreleased(key, code)
    if key == 'return' then
        Gamestate.switch(Kitchen)
    end
end

return KitchenTwo
