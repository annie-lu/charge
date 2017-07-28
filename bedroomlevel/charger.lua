-- charger icon thing

local Class = require "hump.class"
local vector = require "hump.vector"

local Charger = Class{}

function Charger:init(x, y)
  self.img = love.graphics.newImage("bedroomlevel/charger.png")
  self.x = x
  self.y = y
  self.pos = vector(self.x, self.y)
  self.bounding = HC.rectangle(self.pos.x, self.pos.y, self.img:getWidth(), self.img:getHeight())
  self.offsetX = self.img:getWidth() / 2
  self.offsetY = self.img:getHeight() / 2
end

function Charger:draw()
  --hopefully this is on the same y level as the player 400 350
  love.graphics.draw(self.img, self.pos.x, self.pos.y)
  self.bounding:draw()
end

function Charger:getBB()
  return self.bounding
end

function Charger:move(x, y)
  self.pos.x = x
  self.pos.y = y
  self.bounding:moveTo(x + self.offsetX, y + self.offsetY)
end

return Charger
