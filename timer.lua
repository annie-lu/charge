local Class = require "hump.class"

local humpT = require 'hump.timer'

local Timer = Class{}

local timeLimit = 5
local text = ""

local Time = humpT.new()

local remainingTime = timeLimit

function tick()
  timeLimit = timeLimit - 1
end

local handle = Time:every(1, tick)

function Timer:draw()

  love.graphics.print(text, 800, 50)

end

function Timer:update(dt)

  --remainingTime = remainingTime - dt
  if remainingTime <= 0 then
    Time:cancel(handle)
    text = "OUT OF TIME"
  else
    Time:update(dt)
    text = remainingTime--math.floor(self.remainingTime + 0.5)
  end

end

return Timer
