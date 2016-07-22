local Class = require "hump.class"
local vector = require "hump.vector"
--local HC = require "hc"
local Fork = Class{}

function Fork:init(x, y)
		self.damage = 6
		self.speed = 2
    self.acceleration = 50
		self.x = x
		self.y = y
    self.img = love.graphics.newImage("kitchenlevel/fork.png")
		self.pos = vector(self.x, self.y) --vector(400, 300)
		self.delta = vector(0, 0)
		self.bb = HC.point(self.x + 10, self.y + 20) --HC.rectangle(self.x, self.y, 30, 20)
		self.original = vector(self.pos.x, self.pos.y)
		self.test = vector(self.bb:center())
end

function Fork:draw()
	love.graphics.draw(self.img, self.pos.x, self.pos.y)
	--self.bb:draw()
end

function Fork:update(dt)
	self.delta.x = -10;
	self.pos = self.pos + self.delta * self.acceleration * dt
	self.re = self.original - self.pos

	self.bb:moveTo(self.test.x - self.re.x, self.test.y - self.re.y)
end

function Fork:getX()
	return self.pos.x
end

function Fork:getImg()
	return self.img
end

function Fork:getImg()
	return self.bb
end

function Fork:getY()
	return self.pos.y
end

function Fork:getDamage()
	return self.damage
end

return Fork
