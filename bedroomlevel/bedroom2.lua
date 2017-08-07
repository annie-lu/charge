--Gamestate = require 'hump.gamestate'

local Bedroom3 = require 'won'

local Bedroom2 = {}


local Charger = require 'bedroomlevel.charger'

local char = Charger(400, 500)


local mouse = HC.circle(100, 100, 10)

local screen= love.graphics.newImage("bedroomlevel/bedroomgame2.png")

function Bedroom2:update(dt)

  mouse:moveTo(love.mouse:getX() + 5, love.mouse:getY() + 9)

  if char:getBB():collidesWith(mouse) then
    if love.mouse.isDown(1) then
      startTime = love.timer.getTime()
      Gamestate.switch(Bedroom3)
    else
      local x = math.random(0, 900)
      local y = math.random(0, 400)
      char:move(x, y)
    end
  end
end

function Bedroom2:draw()
  love.graphics.draw(screen, 0, 0)
  char:draw()
  --mouse:draw()
end

return Bedroom2
