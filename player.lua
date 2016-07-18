local Class = require "hump.class"
local vector = require "hump.vector"

local Player = Class{}

function Player:init(x,y)

		self.speed = 100
    self.health = 30
		self.x = x
		self.y = y
    self.img = love.graphics.newImage("placeholder_player.png")
		self.pos = vector(self.x, self.y)
    self.delta = vector(0, 0)
end

function Player:draw()
	love.graphics.draw(self.img, self.pos.x, self.pos.y)
end

function Player:update(dt)

  if love.keyboard.isDown('w') then
    self.delta.y = - self.speed
  elseif love.keyboard.isDown("a") then -- no control during kitchen challenge
    self.delta.x = - self.speed
  elseif love.keyboard.isDown("s") then
    self.delta.y = self.speed
  elseif love.keyboard.isDown("d") then -- no control during kitchen challenge
    self.delta.x =  self.speed
  end

	self.pos = self.pos + self.delta * dt

end

function Player:getX()
	return self.pos.x
end

function Player:getY()
	return self.pos.y
end

function Player:getImg()
	return self.img
end

function Player:getHealth()
	return self.health
end

return Player
