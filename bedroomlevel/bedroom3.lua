local Bedroom3 = {}

local Timer = require 'timer'

local testTimer = require 'hump.timer'

--local timeLimit = 10
--timer.every(1, function() timeLimit = timeLimit - 1 end, 10)

--elaspedTime = 0

function Bedroom3:update(dt)

  --elapsedTime = love.timer.getTime() - startTime
  Timer:update(dt)

end

function Bedroom3:draw()
  Timer:draw()
  love.graphics.setNewFont(14)
  love.graphics.setColor(255, 255, 255)
  love.graphics.print("You got ur charger! But both your outlets are being used by your lamp and your computer!", 200, 100)
  --love.graphics.print("wtf "..love.timer.getTime(), 400, 135)
  love.graphics.print("You need to unplug one!", 400, 150)
  --love.graphics.print("wtfffff "..(love.timer.getTime() - startTime), 400, 170)
  love.graphics.setNewFont("bedroomlevel/CHILLER.TTF", 100)
  love.graphics.setColor(204, 0, 0)
  love.graphics.print("WHICH ONE DO YOU KILL?", 50, 300)
end

return Bedroom3
