local Class = require "hump.class"
local vector = require "hump.vector"

local Test = Class{}

function Test:init(damage, speed)
    self.damage = damage
    self.speed = speed
    self.pos = vector(400, 300)
    self.delta = vector(0, 0)
end

function Test:stuff()
  return self.damage .. " " .. self.speed
end

function Test:draw()
  love.graphics.circle("fill", self.pos.x, self.pos.y, 10, 3)
end

function Test:update(dt)
  self.delta.x = -10;
  self.delta.y = -5;
  self.pos = self.pos + self.delta * dt
end

return Test
