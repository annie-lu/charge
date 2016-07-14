local Class = require "hump.class"
local vector = require "hump.vector"

local Player = Class{}

function Player:init()

		self.speed = 20
    self.health = 30
		self.x = 100 --figure out starting variables for each room or something?
		self.y = 400 --same as above
    self.img = love.graphics.newImage("resources/placeholder_player.png")
		self.pos = vector(self.x, self.y)
    self.delta = vector(0, 0)
end

function Player:draw()
	love.graphics.draw(self.img, self.pos.x, self.pos.y)
end

function Player:update(dt)

  if love.keyboard.isDown('w') then
    self.delta.y = self.delta.y - self.speed
  elseif love.keyboard.isDown("a") then
    self.delta.x = self.delta.x - self.speed
  elseif love.keyboard.isDown("s") then
    self.delta.y = self.delta.y + self.speed
  elseif love.keyboard.isDown("d") then
    self.delta.x = self.delta.x + self.speed
  end

	self.pos = self.pos + self.delta * dt
  
end

return Player
