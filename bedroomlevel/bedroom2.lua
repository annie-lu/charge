--Gamestate = require 'hump.gamestate'

local Bedroom3 = require 'bedroomlevel.bedroom3'

local Bedroom2 = {}


local Charger = require 'bedroomlevel.charger'

local char = Charger(400, 500)

local text = "Oh no, ur charger is revolting against you! Click on it to grab it!"

local mouse = HC.circle(100, 100, 10)


function Bedroom2:update(dt)

  mouse:moveTo(love.mouse:getX() + 5, love.mouse:getY() + 9)

  if char:getBB():collidesWith(mouse) then
    if love.mouse.isDown(1) then
      startTime = love.timer.getTime()
      Gamestate.switch(Bedroom3)
    else
      local x = math.random(0, 900)
      local y = math.random(0, 600)
      char:move(x, y)
    end
  end
end

function Bedroom2:draw()
  char:draw()
  mouse:draw()
  love.graphics.print(text, 100, 100)
end

return Bedroom2
