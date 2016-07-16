local Class = require "hump.class"
local vector = require "hump.vector"
local HC = require 'hc'

local Knife = Class{}

function Knife:init(x, y)
		self.damage = 9
		self.speed = 5
    self.acceleration = 10 -- just to test
		self.x = x
		self.y = y
    self.img = love.graphics.newImage("resources/knife.png")
		self.pos = vector(self.x, self.y) --vector(400, 300)
		self.delta = vector(0, 0)
		self.bb = HC.polygon(self.x, self.y, self.x + self.img:getWidth(), self.y,
		 self.x + self.img:getWidth(),  self.y + self.img:getHeight())
end

function Knife:draw()
	love.graphics.draw(self.img, self.pos.x, self.pos.y)
	self.bb:draw()
end

function Knife:update(dt)
	self.delta.x = -10;
	self.pos = self.pos + self.delta * self.acceleration * dt
	self.bb:move(-0.5, 0)
end

return Knife
