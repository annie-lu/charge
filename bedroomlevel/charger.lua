-- charger icon thing

local Class = require "hump.class"
local vector = require "hump.vector"

local Charger = Class{}

function Charger:init(x, y)
  self.img = love.graphics.newImage("bedroomlevel/charger.png")
  self.x = x
  self.y = y
  self.pos = vector(self.x, self.y)
  self.bounding = HC.rectangle(self.x, self.y, self.img:getWidth(), self.img:getHeight())
end

function Charger:draw()
  --hopefully this is on the same y level as the player 400 350
  love.graphics.draw(self.img, self.pos.x, self.pos.y)
  self.bounding:draw()
end

function Charger:getBB()
  return self.bounding
end

return Charger
