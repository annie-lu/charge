local Knife = require 'knife'
local Player = require 'player'
local Fork = require 'fork'
local HC = require 'hc'
Gamestate = require 'hump.gamestate'
local Kitchen = {}
local text = {}


local name, name2, lol, name3


	math.randomseed(os.time())
	name = Knife(math.random(700, 1000), math.random(300, 600))

	math.randomseed(os.time())
	name2 = Knife(math.random(700, 1000), math.random(400, 600))
	lol = Player(100,350)

	math.randomseed(os.time())
	name3 = Fork(math.random(700, 1000), math.random(200, 600))


	-- add a rectangle to the scene
    rect = HC.rectangle(200,400,400,20)
		rect2 = HC.rectangle(600, 600, 40, 40)
    -- add a circle to the scene
    mouse = HC.circle(400,300,20)
		bb = HC.rectangle(lol:getX(), lol:getY(), lol:getImg():getWidth(), lol:getImg():getHeight())
    mouse:moveTo(love.mouse.getPosition())


function love.update(dt)
	name:update(dt)
	name2:update(dt)
	lol:update(dt)
	name3:update(dt)


	-- move circle to mouse position
    mouse:moveTo(love.mouse.getPosition())
		bb:moveTo(lol:getX(), lol:getY())
    -- rotate rectangle
    rect:rotate(dt)

    -- check for collisions
    for shape, delta in pairs(HC.collisions(mouse)) do
				if(shape == rect2) then
					rect2:rotate(dt)
				end
        text[#text+1] = string.format("Colliding. Separating vector = (%s,%s)",
                                      delta.x, delta.y)
    end

    while #text > 40 do
        table.remove(text, 1)
    end

end

function love.draw(dt)
	name:draw()
	name2:draw()
	lol:draw()
	name3:draw()
	bb:draw()
	--IF YOU DON'T PUT A DRAW METHOD THE BOX STAYS INVISIBLE
	--ITS REVOLUTIONARY I SHOULD HAVE KNOWN THIS
	width = love.graphics.getWidth()
	height = love.graphics.getHeight()
	love.graphics.print("Player: Width " .. lol:getX() .. "  Height " .. lol:getY(), 100, 100)
	local cx, cy = bb:center()
	love.graphics.print("BB: Width " .. cx .. "  Height " .. cy, 100, 300)


	-- print messages
    for i = 1,#text do
        love.graphics.setColor(255,255,255, 255 - (i-1) * 6)
        love.graphics.print(text[#text - (i-1)], 10, i * 15)
    end

    -- shapes can be drawn to the screen
    love.graphics.setColor(255,255,255)
    rect:draw('line')
		rect2:draw('fill')
    mouse:draw('fill')

end

return Kitchen
