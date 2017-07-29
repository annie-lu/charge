local Bedroom3 = {}

function Bedroom3:update(dt)


end

function Bedroom3:draw()
  love.graphics.setNewFont(14)
  love.graphics.setColor(255, 255, 255)
  love.graphics.print("You got ur charger! But both your outlets are being used by your lamp and your computer!", 200, 100)
  love.graphics.print("You need to unplug one!", 400, 150)
  love.graphics.setNewFont("bedroomlevel/CHILLER.TTF", 100)
  love.graphics.setColor(204, 0, 0)
  love.graphics.print("WHICH ONE DO YOU KILL?", 50, 300)
end

return Bedroom3
