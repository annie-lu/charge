local Class = require "hump.class"
local vector = require "hump.vector"
--local HC = require 'hc'

local Knife = Class{}

function Knife:init(x, y)
		self.damage = 9
		self.speed = 5
    self.acceleration = 10 -- just to test
		self.x = x
		self.y = y
    self.img = love.graphics.newImage("kitchenlevel/knife.png")
		self.pos = vector(self.x, self.y) --vector(400, 300)
		self.original = self.pos
		self.delta = vector(0, 0)
		-- self.bb = HC.polygon(self.x + 10, self.y + 28,
		-- 	self.x + 40, self.y + 15,
		--  	self.x + self.img:getWidth() - 15,  self.y + 15,
		--  	self.x + self.img:getWidth() - 15, self.y + 38,
		--  	self.x + 57, self.y + 38)
		self.bb = HC.point(self.x + 10, self.y + 28)
		 --self.bb:scale(0.4, self.bb:center())

		 self.test = vector(self.bb:center())
end

function Knife:draw()
	love.graphics.draw(self.img, self.pos.x, self.pos.y)
	self.bb:draw()
	love.graphics.print("Knife X: " .. self.pos.x .. " Y: " .. self.pos.y, 400, 100)
	local cx, cy = self.bb:center()
	love.graphics.print("BB X: " .. cx .. " Y: " .. cy, 400, 200)
end

function Knife:update(dt)
	self.delta.x = -10;
	self.pos = self.pos + self.delta * self.acceleration * dt
	self.re = self.original - self.pos

	self.bb:moveTo(self.test.x - self.re.x, self.test.y - self.re.y)
end

function Knife:getX()
	return self.pos.x;
end

function Knife:getImg()
	return self.img
end

function Knife:getBB()
	return self.bb
end

return Knife
