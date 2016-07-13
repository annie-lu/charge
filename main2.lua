Test = require "Test"

local name;

function love.load(arg)
	name = Test(3, 0)
end

function love.update(dt)

	name:update(dt)

end

function love.draw(dt)
	love.graphics.setColor(255, 255, 255)
	love.graphics.print("Score:jk " .. name:stuff(), 400, 10)
	name:draw()
end
