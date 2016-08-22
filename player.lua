--[[
i understand kinematics??
v = instantaneous velocity
a = acceleration (either 9.8 or 0)
d = distance traveled
x = x position
y = y position
when no keys are pressed + floor "collision"
player has v = 0, a = 0
when w released
player has some set starting velocity (where velocity > 0), a = 9.8
when a or d pressed
player has some set starting velocity (where velocity > 0) and assume no air resistance (no acceleration in x direction)
when s pressed or released
nothing happens lol
how to determine position
x = x + d , y = y + d
]]--

local Class = require "hump.class"
local vector = require "hump.vector"
local Ttimer = require 'hump.timer'
--local HC = require 'hc'
local Player = Class{}

function Player:init(x,y,xdirection,ydirection)
		self.speed = vector(300,400)
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

	self.test = 0
	--h = {self.health, {0, 255, 0}}
	--Ttimer.tween(10, h, {self.health, {255, 0, 0}}, 'in-out-quad')

end

function Player:draw()

	love.graphics.draw(self.img, self.pos.x, self.pos.y)
	--love.graphics.setColor(h[2])
	love.graphics.print(self.pos.x .. ", " .. self.pos.y, 500, 100)
	love.graphics.print(self.test, 900, 100)
	--self.bb:draw()
end

function Player:update(dt)


	Ttimer.update(dt)



  if love.keyboard.isDown('w') and self.ydirection==true and self.pos.y == 400 then
	   	self.delta.y = -self.speed.y
  elseif love.keyboard.isDown("a") and self.xdirection==true then -- no control during kitchen challenge
    self.delta.x = - self.speed.x
  elseif love.keyboard.isDown("d") and self.xdirection==true then -- no control during kitchen challenge
    self.delta.x =  self.speed.x
  end

	self.delta.y = self.delta.y + self.speed.y * 1.2 * dt

	if(self.delta.x > 0) then
		self.delta.x = self.delta.x - self.speed.x * 1 * dt
	elseif(self.delta.x < 0) then
		self.delta.x = self.delta.x + self.speed.x * 1 * dt
	end

	self.pos = self.pos + self.delta * dt


	self.re = self.original - self.pos

	self.bb:moveTo(self.pos.x + self.img:getWidth()/2, self.pos.y + self.img:getHeight() / 2 + 15)--self.img:getWidth() / 2, self.pos.y + self.img:getHeight() /2)

	if self.pos.y < 0 then
		self.pos.y = 0
	elseif self.pos.y > 400 then
		self.pos.y = 400
	end

	if self.pos.x < -30 then
		self.pos.x = -30
	elseif self.pos.x > 830 then
		self.pos.x = 830
	end

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
