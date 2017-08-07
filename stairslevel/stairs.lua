Gamestate = require 'hump.gamestate'
Bedroom = require 'bedroomlevel.bedroom'
Lost=require 'lost'
local Stairs = {}

local Player = require 'stairslevel/playerTest2'
local Platform = require 'stairslevel/platform'
local Timer = require 'hump.timer'
local t = Timer.new()
local screen= love.graphics.newImage("stairslevel/stairsgame.png")


--local rect = Platform(100, 500)--HC.rectangle(100, 500, 200, 20)
local rect3 = Platform(600, 0)--HC.rectangle(600, 400, 200, 20)
local rect2 = Platform(400, 200)--HC.rectangle(500, 600, 200, 20)
local rect4 = Platform(200, 300)--HC.rectangle(200, 300, 200, 20)
--local rect2 = HC.rectangle(100, 700, love.graphics.getWidth(), 20)
local lol = Player(300, 100, true, true)
local text = ""
local platforms = {rect3, rect2, rect4} -- only the last one will be interactable why
-- lol:addPlatform(rect)
-- lol:addPlatform(rect2)
-- lol:addPlatform(rect) --the last platform in the table will only be the one that is interactable with
--                       --why
local xvar = 400

--local test = {}

function tick()

    math.randomseed(os.time())
    local x1 = math.random(0, 600)
    local x2 = math.random(500, 800)

    --nice even spacing now doesn't work cause i remove platforms at they move down -_-
    if #platforms % 2 == 0 then
        platforms[#platforms + 1] = Platform(x1, -10)
    else
        platforms[#platforms + 1] = Platform(x2, -10)
    end

end

handle = Timer.every(4, tick)

function Stairs:update(dt)

    lol:update(dt)
    if lol:getFall() then
      Gamestate.switch(Lost)
    end
    for i = #platforms, 1, -1 do
        platforms[i]:update(dt)

        -- if platforms[i]:getY() > 850 then
        --     table.remove(platforms, i)
        --     i = i-1
        -- end
    end

    for i = 1, #platforms, 1 do
        text = ""
        --if love.keyboard.isDown('q') then
            --platforms[i]:update(dt)
        --end
        if lol:getBotBB():collidesWith(platforms[i]:getBB()) then
            lol:canJump()
            --lol:setVelocityY()
            -- local x1, y1, x2, y2 = platforms[i]:getBB():bbox()
            --     lol:setGround(y1 - lol:getImg():getHeight() + 10)
            break
        else
            lol:cannotJump()
            lol:setGround(500)
        end
    end

    Timer.update(dt)



    --text = ""
--    for var= 1,2,3  do
--        text = key
        -- if lol:getBotBB():collidesWith(platforms[1]) then
        --     local x1, y1, x2, y2 = platforms[1]:bbox()
        --     --text = "l" --only this line works??
        --     lol:setGround(y1 - lol:getImg():getHeight() + 10)
        -- elseif lol:getBotBB():collidesWith(platforms[2]) then
        --     local x1, y1, x2, y2 = platforms[2]:bbox()
        --     --text = text .. "l" --only this line works??
        --     lol:setGround(y1 - lol:getImg():getHeight() + 10)
        -- elseif lol:getBotBB():collidesWith(platforms[3]) then
        --     local x1, y1, x2, y2 = platforms[3]:bbox()
        --     --text = text .. "l" --only this line works??
        --     lol:setGround(y1 - lol:getImg():getHeight() + 10)
        -- else
        --     lol:setGround(600)
        --
        -- end

    --test()
    --xvar = xvar + 1
--    end

    -- for i = 1, #platforms, 1 do
    --     local x1, y1, x2, y2 = platforms[i]:bbox()
    --     if lol:getX() >= x1 - lol:getImg():getWidth() and lol:getX() <= x2 + lol:getImg():getWidth() then
    --         if lol:getBotBB():collidesWith(platforms[i]) then
    --             text = "-________-"
    --
    --
    --                     lol:setGround(y1 - lol:getImg():getHeight())--0.5 * (y1 + y2))
    --         	  --discrepancy between player x y and rectangle x y
    --           else
    --               lol:setGround(600)
    --           end
    --     end
    -- end

    -- if lol:getBotBB():collidesWith(rect) then
    --     text = "BOO"
    -- end
end

function Stairs:draw(dt)
love.graphics.draw(screen, 0, 0)

    love.graphics.print("" .. text, 800, 300)
    love.graphics.print(#platforms, 100, 200)
        love.graphics.print("press enter to continue")

    for i = 1, #platforms, 1 do
        platforms[i]:draw(dt)
    end

    lol:draw(dt)

end

function Stairs:keyreleased(key, code)
    if key == 'return' then
        Gamestate.switch(Bedroom)
    end
end

return Stairs
