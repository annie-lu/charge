Gamestate = require 'hump.gamestate'
Piano = require 'pianolevel.piano'

local Stairs = {}

local Player = require 'playerTest2'

local rect = HC.rectangle(100, 500, 200, 20)
local rect3 = HC.rectangle(600, 400, 200, 20)
local rect2 = HC.rectangle(500, 650, 200, 20)
--local rect2 = HC.rectangle(100, 700, love.graphics.getWidth(), 20)
local lol = Player(100, 100, true, true, 800)
local text = ""
local platforms = {rect2, rect3, rect} -- only the last one will be interactable why
-- lol:addPlatform(rect)
-- lol:addPlatform(rect2)
-- lol:addPlatform(rect) --the last platform in the table will only be the one that is interactable with
--                       --why


--local test = {}
function Stairs:update(dt)

    lol:update(dt)
    text = #platforms
    for i = 1, #platforms, 1 do
        if lol:getBotBB():collidesWith(platforms[i]) then
            local x1, y1, x2, y2 = platforms[i]:bbox()
            text = text .. "l"
            lol:setGround(y1 - lol:getImg():getHeight() + 10)
        else
            lol:setGround(600)

        end

    end

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


    love.graphics.print("" .. text, 400, 400)

        love.graphics.print("press enter to continue")

    for i = 1, #platforms, 1 do
        platforms[i]:draw(dt)
    end

    lol:draw(dt)

end

function Stairs:keyreleased(key, code)
    if key == 'return' then
        Gamestate.switch(Piano)
    end
end

return Stairs
