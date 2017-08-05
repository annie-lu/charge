

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
	self.speed = vector(200,400)
	self.health = 30
	self.x = x
	self.y = y
	self.img = love.graphics.newImage("player.png")
	self.pos = vector(self.x, self.y)
	self.acceleration = vector(0, 0)
	self.velocity = vector(0,0)
	self.xdirection = xdirection
	self.ydirection = ydirection
	self.isDead = false
self.original = vector(self.x, self.y)


	self.bb = HC.rectangle(self.x + 30, self.y, 10, self.img:getHeight()-15)
	self.bottomBB = HC.rectangle(self.x - 10, self.y, self.img:getWidth()-40, 10)

	self.obb = vector(self.bb:center())

	self.test = 0
	self.ground = 400

	self.jump = false
	--h = {self.health, {0, 255, 0}}
	--Ttimer.tween(10, h, {self.health, {255, 0, 0}}, 'in-out-quad')

end

function Player:draw()

	love.graphics.draw(self.img, self.pos.x, self.pos.y)
	--love.graphics.setColor(h[2])
	love.graphics.print("VelocityY: " .. self.velocity.y, 500, 100)
	love.graphics.print("Self.pos.y: " .. self.pos.y, 500, 115)
	love.graphics.print("Self.ground: " .. self.ground, 650, 115)
	love.graphics.print("Self.ground == self.pos.y: " .. tostring(math.floor(self.pos.y) == math.floor(self.ground)), 700, 150)
	love.graphics.print("AccelerationY: ".. self.acceleration.y, 700, 200)
	love.graphics.print(self.test, 900, 100)
	self.bb:draw()
	self.bottomBB:draw()
end

function Player:update(dt)


	Ttimer.update(dt)
--[[
maybe delete
	if self.ground == nil then
		self.ground = 500
	end

]]--
	if self.pos.y == self.ground then
		self.jump = true
	else
		self.jump = false
	end


	if love.keyboard.isDown("w") and self.ydirection and self.jump and self.velocity.y== 100 then -- or self.velocity.y == 50) then
		self.acceleration.y = 500
		self.velocity.y=-self.speed.y
	elseif love.keyboard.isDown("s") and self.ydirection and self.jump and self.velocity.y== 100 then
		--there's a ground so cant move down through the ground
		--s is just to squat
		--thus, squating is just changing the hitbox
	elseif love.keyboard.isDown("a") and self.xdirection then -- no control during kitchen challenge
		self.acceleration.x =  50
		self.velocity.x=-self.speed.x
	elseif love.keyboard.isDown("d") and self.xdirection then -- no control during kitchen challenge
		self.acceleration.x =  -50
		self.velocity.x=self.speed.x
	end

	if(math.abs(self.velocity.x) < 10) then
		self.velocity.x = 0
		self.acceleration.x = 0
	end

	if(self.jump and self.velocity.y>0) then
		self.velocity.y = 100
		self.acceleration.y = 0
	end

	if not self.jump and self.acceleration.y == 0 then
		self.velocity.y = self.speed.y
	end

	self.pos = self.pos + self.velocity * dt
	self.velocity = self.velocity + self.acceleration*dt



	self.re = self.original - self.pos

	self.bb:moveTo(self.pos.x + self.img:getWidth()/2, self.pos.y + self.img:getHeight() / 2 + 5)--self.img:getWidth() / 2, self.pos.y + self.img:getHeight() /2)
	self.bottomBB:moveTo(self.pos.x + 50, self.pos.y + self.img:getHeight() - 10)

	if self.pos.y < 0 then
		self.pos.y = 0
	elseif self.pos.y > self.ground then
		self.pos.y = self.ground
		self.bb:moveTo(self.pos.x + self.img:getWidth()/2, self.pos.y + self.img:getHeight()/2 + 5)
		self.bottomBB:moveTo(self.pos.x + 50, self.pos.y + self.img:getHeight() - 10)

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

function Player:getBotBB()
	return self.bottomBB
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

function Player:setGround(gr)
	self.ground = gr
end

function Player:canJump()
	self.jump = true
end

function Player:cannotJump()
	self.jump = false
end


return Player
