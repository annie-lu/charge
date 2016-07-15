local Class = require "hump.class"
local vector = require "hump.vector"

local Fork = Class{}

function Fork:init(x, y)
		self.damage = 6
		self.speed = 2
    self.acceleration = 100
		self.x = x
		self.y = y
    self.img = love.graphics.newImage("resources/fork.png")
		self.pos = vector(self.x, self.y) --vector(400, 300)
		self.delta = vector(0, 0)
end

function Fork:draw()
	love.graphics.draw(self.img, self.pos.x, self.pos.y)
end

function Fork:update(dt)
	self.delta.x = -10;
	self.pos = self.pos + self.delta * self.acceleration * dt
end

return Fork
