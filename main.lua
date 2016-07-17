local Knife = require 'knife'
local Player = require 'player'
local Fork = require 'fork'
local HC = require 'hc'
local vector = require 'hump.vector'
local Timer = require 'hump.timer'
local fruits = {}



local name, name2, lol, name3

function love.load()

	math.randomseed(os.time())
	--name = Knife(math.random(700, 1000), math.random(300, 600))

	math.randomseed(os.time())
	fruits[1] = Knife(math.random(700, 1000), math.random(400, 600))
	lol = Player(100,350)
	original = vector(lol:getX(), lol:getY())

	math.randomseed(os.time())
	--name3 = Fork(math.random(700, 1000), math.random(200, 600))

	--triangle = HC.polygon(100, 100, 200, 300, 300, 400, 500, 600)
    Timer.after(1,
    function()
        love.graphics.print("text[#text - (i-1)], 10, i * 15", 100, 100)
        -- math.random(os.time())
        -- fruits[#fruits] = Knife(math.random(700, 1000), math.random(400, 600))
    end)
	-- add a rectangle to the scene
    --rect = HC.rectangle(200,400,400,20)
		--rect2 = HC.rectangle(600, 600, 40, 40)
    -- add a circle to the scene
    mouse = HC.circle(400,300,20)
		bb = HC.rectangle(lol:getX(), lol:getY(), lol:getImg():getWidth(), lol:getImg():getHeight())
		obb = vector(bb:center())
	mouse:moveTo(love.mouse.getPosition())


end

function love.update(dt)
	--name:update(dt)
	--name2:update(dt)
	lol:update(dt)
	--name3:update(dt)

    Timer.update(dt)


    for i = 1, #fruits do
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

function love.draw(dt)
    for i = 1, #fruits do
        fruits[i]:draw(dt)
    end



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
	-- love.graphics.print("BB: X " .. cx .. "  Y " .. cy, 100, 300)
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
