local Knife = require("knife")
local Player = require("player")

local name, name2, lol

function love.load()

	math.randomseed(os.time())
	name = Knife(math.random(400, 600), math.random(300, 600))
	math.randomseed(os.time())
	name2 = Knife(math.random(400, 600), math.random(400, 600))
	lol = Player(100,350)

end

function love.update(dt)
	name:update(dt)
	name2:update(dt)
	lol:update(dt)
end

function love.draw(dt)
	name:draw()
	name2:draw()
	lol:draw()

end
