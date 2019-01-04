local Class = require "hump.class"

local humpT = require 'hump.timer'

local Timer = Class{}

local timeLimit = 15
local text = ""

local Time = humpT.new()

local remainingTime = timeLimit

function tick2()
  timeLimit = timeLimit - 1
  --remainingTime = timeLimit
  text = timeLimit
end

handle2 = Time:every(1, function() timeLimit = timeLimit - 1 end)

function Timer:draw()

  love.graphics.print(text, 800, 50)

end

function Timer:update(dt)

  Time:update(dt)
  --remainingTime = remainingTime - dt
  if timeLimit <= 0 then
    --Time:cancel(handle2)
    text = "OUT OF TIME"
  --else
    --Time:update(dt)
    --text = timeLimit--math.floor(self.remainingTime + 0.5)
  end



end

return Timer
