local Class = require "hump.class"

local Timer = Class{}

local timeLimit = 5
local text = ""

local remainingTime = timeLimit

function Timer:draw()

  love.graphics.print(text, 800, 50)

end

function Timer:update(dt)

  remainingTime = remainingTime - dt
  if remainingTime <= 0 then
    text = "OUT OF TIME"
  else
    text = remainingTime--math.floor(self.remainingTime + 0.5)
  end

end

return Timer
