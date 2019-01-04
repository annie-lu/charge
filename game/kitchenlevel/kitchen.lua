


Gamestate = require 'hump.gamestate'

local Kitchen = {}

local Knife = require 'kitchenlevel.knife'
local Player = require 'player'
local Fork = require 'kitchenlevel.fork'
HC = require 'hc'
local vector = require 'hump.vector'
local Timer = require 'hump.timer'
local fruits = {}
local bullets = {}
local timer = Timer.new()
local text = {}
local name, name2, lol, name3
local hit = 0

--collider = HC.new(850)

	local color = {0, 0, 0}
	--Timer.tween(5, color, {0, 0, 255}, 'in-out-quad')

	--math.randomseed(os.time())
	--name = Knife(math.random(700, 1000), math.random(300, 600))

	--math.randomseed(os.time())
	fruits[1] = Knife(1000, math.random(400, 600))
    -- math.randomseed(os.time())
    -- fruits[2] = Knife(math.random(300, 1000), math.random(400, 600))
    -- math.randomseed(os.time())
    -- fruits[3] = Knife(math.random(300, 1000), math.random(400, 600))
    local lol = Player(100,350,false,true)
	--original = vector(lol:getX(), lol:getY())

	--math.randomseed(os.time())
	--name3 = Fork(math.random(700, 1000), math.random(200, 600))

	--triangle = HC.polygon(100, 100, 200, 300, 300, 400, 500, 600)

	-- add a rectangle to the scene
    --rect = HC.rectangle(200,200,400,20)
		--rect2 = HC.rectangle(600, 600, 40, 40)
    -- add a circle to the scene
    --mouse = HC.circle(400,300,20)

	--mouse:moveTo(love.mouse.getPosition())


	--while lol:getHealth() == 30 do
function tick()

    	math.randomseed(os.time())
		local pp = math.random(2)
        --math.randomseed(os.time())
		--local x = math.random(1000, 1100)
		--math.randomseed(os.time())
		local y = math.random(400, 600)
		if pp == 1 then

			fruits[#fruits + 1] = Fork(1000, y)
		else
        	fruits[#fruits + 1] = Knife(1000, y)
		end

end

local handle = Timer.every(3, tick)

--bullets[1] = HC.point(love.mouse.getX(), love.mouse.getY())


-- player box, knife box, fork box
--
-- function on_collide(dt, shape_a, shape_b)
-- 	if shape_a == Knife and shape_b == Player then
-- 		hit = hit + 1
-- 	elseif shape_a == Player and shape_b == Knife then
-- 		hit = hit + 1
-- 	elseif shape_a == Fork and shape_b == Player then
-- 		hit = hit + 1
-- 	elseif shape_a == Player and shape_b == Fork then
-- 		hit = hit + 1
-- 	end
-- end


function Kitchen:update(dt)

	if lol:dead() then
		Timer.cancel(handle)
		for k in pairs(fruits) do
			fruits[k] = nil
		end
	end

	--bullets[1]:moveTo(love.mouse.getPosition())

	-- if fruits[1]:getBB():collidesWith(lol:getBB()) or
	-- bullets[1]:collidesWith(lol:getBB()) then
	-- 	hit = hit + 1
	-- end

	--name:update(dt)
	--name2:update(dt)
	lol:update(dt)
	--name3:update(dt)

    Timer.update(dt)

	--fruits[2]:update(dt)
    for i = #fruits, 1, -1 do

		fruits[i]:update(dt)
		--local u = fruits[i]:getY() this as well what even
		--local help = HC.point(fruits[i]:getX() + 10, u + 28) wtf is this
		if fruits[i]:getBB():collidesWith(lol:getBB()) then
        		hit = hit + fruits[i]:getDamage()
				lol:setHealth(lol:getHealth() - fruits[i]:getDamage())
				table.remove(fruits,i)
				i = i-1
		elseif fruits[i]:getX() < -220 then -- just a little more than the width of the knife
			table.remove(fruits, i)
			i = i -1

		end
    end






	-- for shape, delta  in pairs(HC.collisions(lol:getBB())) do
	-- 	shape:move(delta.x, delta.y)
	-- end
	--if(lol:getBB():collidesWith(Knife:getBB())) then
		--table.remove(fruits, i)
	--	hit = hit + 1

	--end
	-- move circle to mouse position


	-- 			100			300
	--v = vector(lol:getX(), lol:getY())
	--re = original - v
	--			150			490
	--c = vector(bb:center()) + vector(bb:center()) / 2


	--bb:moveTo(obb.x - re.x, obb.y - re.y)--VERY INTERESTING
    -- rotate rectangle
    --rect:rotate(dt)

    -- check for collisions
    -- for shape, delta in pairs(HC.collisions(mouse)) do
	-- 			if(shape == rect2) then
	-- 				rect2:rotate(dt)
	-- 			end

    -- end
    --
    -- while #text > 40 do
    --     table.remove(text, 1)
    -- end

	-- local collisions = HC.collisions(rect)
	-- for other, separating_vector in pairs(collisions) do
    -- 	--rect:move(-separating_vector.x, -separating_vector.y)
	-- 	text[#text+1] = string.format("Colliding. Separating vector = (%s,%s)",
	-- 								  other.x, other.y)
	-- end

	--if(love.keyboard.isDown('y')) then
		--mouse:moveTo(love.mouse.getPosition())
	-- else
	-- if love.keyboard.isDown('e') then
	--   mouse:move(-10, 0)
 --  	elseif love.keyboard.isDown("r") then -- no control during kitchen challenge
	--   mouse:move(10, 0)
 --  	end

--end
end
function Kitchen:draw(dt)

	lol:draw()

	--bullets[1]:draw(dt)

	for i = 1, #fruits do
        fruits[i]:draw(dt)
    end
	--fruits[2]:draw(dt)
	--love.graphics.setBackgroundColor(color)

	--mouse:draw('fill')
	--rect:draw('fill')
	-- name:draw()
	-- --name2:draw()

	-- name3:draw()
	-- bb:draw()
	-- triangle:draw()
	--IF YOU DON'T PUT A DRAW METHOD THE BOX STAYS INVISIBLE
	--ITS REVOLUTIONARY I SHOULD HAVE KNOWN THIS
	-- width = love.graphics.getWidth()
	-- height = love.graphics.getHeight()
	-- love.graphics.print("Player: X " .. lol:getX() .. "  Y " .. lol:getY(), 100, 100)
	-- local cx, cy = bb:center()
	--love.graphics.print(#fruits, 100, 300)
	if(lol:getHealth() > 0) then
		love.graphics.rectangle("fill", 50, 50, lol:getHealth() * 10, 10)
	end
	love.graphics.print("Health: "..lol:getHealth(), 100, 80)

	--love.graphics.print(fruits[1]:getImg():getWidth(), 100, 200)

	--love.graphics.print(hit, 800, 50)
	--print messages
    --for i = 1,#text do
       --love.graphics.setColor(255,255,255, 255 - (i-1) * 6)
      -- love.graphics.print(text[#text - (i-1)], 10, i * 15)
--    end

    -- shapes can be drawn to the screen
    --love.graphics.setColor(255,255,255)
    -- rect:draw('line')
	-- 	rect2:draw('fill')
    --mouse:draw('fill')

end

return Kitchen
