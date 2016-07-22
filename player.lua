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
		self.isDead = false
	self.original = vector(self.x, self.y)

	self.bb = HC.rectangle(self.x + 30, self.y, 10, self.img:getHeight()-50)
	self.obb = vector(self.bb:center())

	--h = {self.health, {0, 255, 0}}
	--Ttimer.tween(10, h, {self.health, {255, 0, 0}}, 'in-out-quad')

end

function Player:draw()

	love.graphics.draw(self.img, self.pos.x, self.pos.y)
	--love.graphics.setColor(h[2])

	--love.graphics.setColor(0, 255, 0:
	--self.bb:draw()
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

	self.bb:moveTo(self.pos.x + self.img:getWidth()/2, self.pos.y + self.img:getHeight() / 2 + 15)--self.img:getWidth() / 2, self.pos.y + self.img:getHeight() /2)



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
	if(self.health <= 0) then
		return 0
	end
	return self.health
end

function Player:setHealth(k)
	self.health = k
end

function Player:dead()
	if self.health <= 0 then
		self.isDead = true
	end
	return self.isDead
end

return Player
