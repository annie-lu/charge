local Class = require "hump.class"
local vector = require "hump.vector"

local Platform = Class{}

function Platform:init(x, y)

    self.speed = 5
    self.x = x
    self.y = y
    self.img = love.graphics.newImage("stairslevel/platform_placeholder.png")

    self.pos = vector(self.x, self.y)
    self.original_pos = self.pos

    self.velocity = vector(0, 10) --can be changed if the platforms r like horizontal and stuff

    self.bb = HC.rectangle(self.x, self.y, 250, 26)
    self.bb_center = vector(self.bb:center())

end

function Platform:draw()
    love.graphics.draw(self.img, self.pos.x, self.pos.y)
    self.bb:draw()
end

function Platform:update(dt)

    self.pos = self.pos + self.velocity * self.speed * dt
    self.delta_pos = self.original_pos - self.pos

    self.bb:moveTo(self.bb_center.x - self.delta_pos.x, self.bb_center.y - self.delta_pos.y)

end

function Platform:getX()
    return self.pos.x
end

function Platform:getY()
    return self.pos.y
end

function Platform:getImg()
    return self.img
end

function Platform:getBB()
    return self.bb
end

return Platform
