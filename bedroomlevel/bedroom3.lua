local Bedroom3 = {}

elaspedTime = 0

function Bedroom3:update(dt)

  elapsedTime = love.timer.getTime() - startTime

end

function Bedroom3:draw()
  love.graphics.setNewFont(14)
  love.graphics.setColor(255, 255, 255)
  love.graphics.print("You got ur charger! But both your outlets are being used by your lamp and your computer! "..startTime, 200, 100)
  love.graphics.print("wtf "..love.timer.getTime(), 400, 135)
  love.graphics.print("You need to unplug one! "..elaspedTime, 400, 150)
  love.graphics.print("wtfffff "..(love.timer.getTime() - startTime), 400, 170)
  love.graphics.setNewFont("bedroomlevel/CHILLER.TTF", 100)
  love.graphics.setColor(204, 0, 0)
  love.graphics.print("WHICH ONE DO YOU KILL?", 50, 300)
end

return Bedroom3
