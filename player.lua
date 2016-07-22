local Class = require "hump.class"
local vector = require "hump.vector"
local Ttimer = require 'hump.timer'
--local HC = require 'hc'
local Player = Class{}

function Player:init(x,y,xdirection,ydirection)

		self.speed = 100
    self.health = 30
		self.x = x
		self.y = y
    self.img = love.graphics.newImage("player.png")
		self.pos = vector(self.x, self.y)
    self.delta = vector(0, 0)
		self.xdirection = xdirection
		self.ydirection = ydirection

	self.original = vector(self.x, self.y)

	self.bb = HC.rectangle(self.x, self.x, self.img:getWidth(), self.img:getHeight())
	self.obb = vector(self.bb:center())

	h = {self.health, {0, 255, 0}}
	Ttimer.tween(10, h, {20, {255, 0, 0}}, 'in-out-quad')

end

function Player:draw()
	love.graphics.draw(self.img, self.pos.x, self.pos.y)
	love.graphics.setColor(h[2])
	love.graphics.rectangle("fill", 50, 50, h[1] * 10, 10)
	--love.graphics.setColor(0, 255, 0)
	self.bb:draw()
end


function Player:update(dt)


	Ttimer.update(dt)

  if love.keyboard.isDown('w') and self.ydirection==true then
    self.delta.y = - self.speed
  elseif love.keyboard.isDown("a") and self.xdirection==true then -- no control during kitchen challenge
    self.delta.x = - self.speed
  elseif love.keyboard.isDown("s") and self.ydirection==true then
    self.delta.y = self.speed
  elseif love.keyboard.isDown("d") and self.xdirection==true then -- no control during kitchen challenge
    self.delta.x =  self.speed
  end

	self.pos = self.pos + self.delta * dt

	self.re = self.original - self.pos

	self.bb:moveTo(self.pos.x + self.img:getWidth() / 2, self.pos.y + self.img:getHeight() /2)



end

function Player:getBB()
	return self.bb
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
