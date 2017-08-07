local Ending = {}
--local IDK = require 'hump.game'

startTime = 0;

local screen= love.graphics.newImage("win!.png")

function Ending:draw()
	love.graphics.draw(screen, 0, 0)
end


return Ending
