local Class = require "hump.class"
local vector = require "hump.vector"
--local anim8 = require "anim8"

--just incase we use anim8

--in load function
--local spritesheet = love.graphics.newImage('path here')
--local g = anim8.newGrid(x, y, spritesheet:getWidth(), spritesheet.getHeight())
--local frames = g(frame numbers here (numbers can be in strings like "1-3"))
--local animation = anim8.newAnimation(frames, durations, onLoop - optional)

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
  --animation:draw(spritesheet, x, y)
end

function Test:update(dt)
  self.delta.x = -10;
  self.delta.y = -5;
  self.pos = self.pos + self.delta * dt
  --animation:update(dt)
end

return Test
