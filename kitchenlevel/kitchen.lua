Gamestate = require 'hump.gamestate'

local Kitchen = {}

local Knife = require 'kitchenlevel.knife'
local Player = require 'player'
local Fork = require 'kitchenlevel.fork'
local HC = require 'hc'
local vector = require 'hump.vector'
local Timer = require 'hump.timer'
local fruits = {}
local timer = Timer.new()

local name, name2, lol, name3

		color = {0, 0, 0}
	Timer.tween(5, color, {0, 0, 255}, 'in-out-quad')

	math.randomseed(os.time())
	--name = Knife(math.random(700, 1000), math.random(300, 600))

	math.randomseed(os.time())
	fruits[1] = Knife(math.random(700, 1000), math.random(400, 600))
    math.randomseed(os.time())
    fruits[2] = Knife(math.random(300, 1000), math.random(400, 600))
    math.randomseed(os.time())
    fruits[3] = Knife(math.random(300, 1000), math.random(400, 600))
    lol = Player(100,350)
	original = vector(lol:getX(), lol:getY())

	math.randomseed(os.time())
	--name3 = Fork(math.random(700, 1000), math.random(200, 600))

	--triangle = HC.polygon(100, 100, 200, 300, 300, 400, 500, 600)

	-- add a rectangle to the scene
    --rect = HC.rectangle(200,400,400,20)
		--rect2 = HC.rectangle(600, 600, 40, 40)
    -- add a circle to the scene
    mouse = HC.circle(400,300,20)
		bb = HC.rectangle(lol:getX(), lol:getY(), lol:getImg():getWidth(), lol:getImg():getHeight())
		obb = vector(bb:center())
	mouse:moveTo(love.mouse.getPosition())


	--while lol:getHealth() == 30 do

	Timer.every(1,
    function()
		math.randomseed(os.time())
		local pp = math.random(2)
        math.randomseed(os.time())
		if pp == 1 then
			fruits[#fruits + 1] = Fork(math.random(1000, 1100), math.random(400, 600))
		else
        	fruits[#fruits + 1] = Knife(math.random(1000, 1100), math.random(400, 600))
		end
    end)


function Kitchen:update(dt)

	--name:update(dt)
	--name2:update(dt)
	lol:update(dt)
	--name3:update(dt)

    Timer.update(dt)

	--fruits[2]:update(dt)
    for i = 1, #fruits do
		if fruits[i]:getX() < -10 then
			table.remove(fruits, fruits[i])
		end
        fruits[i]:update(dt)
    end

	-- move circle to mouse position
    --mouse:moveTo(love.mouse.getPosition())
	-- 			100			300
	v = vector(lol:getX(), lol:getY())
	re = original - v
	--			150			490
	--c = vector(bb:center()) + vector(bb:center()) / 2


	bb:moveTo(obb.x - re.x, obb.y - re.y)--VERY INTERESTING
    -- rotate rectangle
    --rect:rotate(dt)

    -- check for collisions
    -- for shape, delta in pairs(HC.collisions(mouse)) do
	-- 			if(shape == rect2) then
	-- 				rect2:rotate(dt)
	-- 			end
    --     text[#text+1] = string.format("Colliding. Separating vector = (%s,%s)",
    --                                   delta.x, delta.y)
    -- end
    --
    -- while #text > 40 do
    --     table.remove(text, 1)
    -- end

end

function Kitchen:draw(dt)



	for i = 1, #fruits do
        fruits[i]:draw(dt)
    end
	--fruits[2]:draw(dt)
	love.graphics.setBackgroundColor(color)



	-- name:draw()
	-- --name2:draw()
    lol:draw()
	-- name3:draw()
	-- bb:draw()
	-- triangle:draw()
	--IF YOU DON'T PUT A DRAW METHOD THE BOX STAYS INVISIBLE
	--ITS REVOLUTIONARY I SHOULD HAVE KNOWN THIS
	-- width = love.graphics.getWidth()
	-- height = love.graphics.getHeight()
	-- love.graphics.print("Player: X " .. lol:getX() .. "  Y " .. lol:getY(), 100, 100)
	-- local cx, cy = bb:center()
	love.graphics.print(#fruits, 100, 300)
    -- love.graphics.print("Mouse Position: " .. love.mouse.getX() .. " Y: " .. love.mouse.getY())

	--print messages
    -- for i = 1,#text do
    --    love.graphics.setColor(255,255,255, 255 - (i-1) * 6)
    --    --love.graphics.print(text[#text - (i-1)], 10, i * 15)
    -- end

    -- shapes can be drawn to the screen
    love.graphics.setColor(255,255,255)
    -- rect:draw('line')
	-- 	rect2:draw('fill')
    -- mouse:draw('fill')

end

return Kitchen
