local Bedroom3 = {}

--local Timer = require 'timer'

local testTimer = require 'hump.timer'

local screen= love.graphics.newImage("bedroomlevel/bedroomgame3.png")
local timeLimit = 10

local tT = testTimer.new()

local text = ""..timeLimit

function tick()
  timeLimit = timeLimit - 1
  text = ""..timeLimit
end

handle = tT:every(1, tick)

--timer.every(1, function() timeLimit = timeLimit - 1 end, 10)

--elaspedTime = 0

function Bedroom3:update(dt)

  --elapsedTime = love.timer.getTime() - startTime


  if timeLimit <= 0 then
    tT:cancel(handle)
  end

  tT:update(dt)

end

function Bedroom3:draw()
  --Timer:draw()
love.graphics.draw(screen, 0, 0)


  love.graphics.setNewFont(14)
  love.graphics.setColor(255, 255, 255)
  --love.graphics.print("wtf "..love.timer.getTime(), 400, 135)
  love.graphics.print("laptop(A) or lamp(D) ", 400, 150)

end

return Bedroom3
