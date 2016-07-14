local Class = require "hump.class"
local vector = require "hump.vector"

local Knife = Class{}

function Knife:init(x, y)
		self.damage = 9
		self.speed = 5
    self.acceleration = 100
		self.x = x
		self.y = y
    self.img = love.graphics.newImage("resources/knife.png")
		self.pos = vector(self.x, self.y) --vector(400, 300)
		self.delta = vector(0, 0)
end

function Knife:draw()
	love.graphics.draw(self.img, self.pos.x, self.pos.y)
end

function Knife:update(dt)
	self.delta.x = -10;
	self.pos = self.pos + self.delta * self.acceleration * dt
end

return Knife
